# Installs Cinc Client where no client is installed, then runs a chef policy in local mode.
# Usage, in an elevated session:
# $env:CHEF_POLICY = '<policy>'; powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://github.com/gusztavvargadr/chef/releases/latest/download/provision.ps1 | iex"

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072

function Get-Setting([string] $name, [string] $default) {
  $value = [Environment]::GetEnvironmentVariable($name)
  if ([string]::IsNullOrEmpty($value)) { $default } else { $value }
}

$chefVersion = Get-Setting 'CHEF_VERSION' '18'
$chefPolicy = Get-Setting 'CHEF_POLICY' ''
$chefPolicyUrl = Get-Setting 'CHEF_POLICY_URL' "https://github.com/gusztavvargadr/chef/releases/latest/download/$($chefPolicy).tgz"
$chefPolicyPath = Get-Setting 'CHEF_POLICY_PATH' ''
$chefAttributes = Get-Setting 'CHEF_ATTRIBUTES' 'default'
$chefRunList = Get-Setting 'CHEF_RUN_LIST' ''
$chocolateyVersion = Get-Setting 'CHOCOLATEY_VERSION' '2.7.3'

$principal = New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  [Console]::Error.WriteLine('provision.ps1 needs an elevated session. Run it as Administrator.')
  exit 1
}

$env:CHEF_LICENSE = 'accept-silent'

$cincClient = 'C:/cinc-project/cinc/bin/cinc-client.bat'
$chefClient = 'C:/opscode/chef/bin/chef-client.bat'
if (Test-Path $cincClient) {
  $client = $cincClient
} elseif (Test-Path $chefClient) {
  $client = $chefClient
} else {
  # The Cinc MSI replaces Chef Infra Client as a major upgrade, so never install it where Chef Infra Client is registered.
  $uninstallKeys = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
  )
  $chefProduct = Get-ItemProperty $uninstallKeys -ErrorAction Ignore | Where-Object { $_.DisplayName -like 'Chef Infra Client*' } | Select-Object -First 1
  if ($chefProduct) {
    [Console]::Error.WriteLine("$($chefProduct.DisplayName) is installed, but not at $($chefClient). provision.ps1 doesn't install Cinc Client, which would replace it.")
    exit 1
  }

  Write-Host "Installing Cinc Client $($chefVersion)."
  . { Invoke-WebRequest -UseBasicParsing https://omnitruck.cinc.sh/install.ps1 } | Invoke-Expression
  install -project cinc -version $chefVersion
  if (-not (Test-Path $cincClient)) {
    throw "Cinc Client $($chefVersion) did not install to $($cincClient)."
  }
  $client = $cincClient
}
Write-Host "Using $($client)."
& $client --version

if (-not (Get-Command 'choco' -ErrorAction Ignore)) {
  Write-Host "Installing Chocolatey $($chocolateyVersion)."
  $env:chocolateyVersion = $chocolateyVersion
  Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

if ([string]::IsNullOrEmpty($chefPolicy) -and [string]::IsNullOrEmpty($chefPolicyPath)) {
  Write-Host 'No CHEF_POLICY or CHEF_POLICY_PATH set, so no policy runs.'
  exit 0
}

$tempDir = $null
$exitCode = 1
try {
  if ($chefPolicyPath -and (Test-Path $chefPolicyPath -PathType Container)) {
    $policyDir = $chefPolicyPath
  } else {
    $tempDir = Join-Path ([IO.Path]::GetTempPath()) ([IO.Path]::GetRandomFileName())
    New-Item -ItemType Directory -Path $tempDir | Out-Null

    if ($chefPolicyPath) {
      if (-not (Test-Path $chefPolicyPath -PathType Leaf)) {
        throw "CHEF_POLICY_PATH $($chefPolicyPath) is neither a directory nor a file."
      }
      $archive = $chefPolicyPath
    } else {
      $archive = Join-Path $tempDir 'policy.tgz'
      Write-Host "Downloading $($chefPolicyUrl)."
      Invoke-WebRequest -UseBasicParsing -Uri $chefPolicyUrl -OutFile $archive
    }

    $policyDir = Join-Path $tempDir 'policy'
    New-Item -ItemType Directory -Path $policyDir | Out-Null
    tar -xzf $archive -C $policyDir
    if ($LASTEXITCODE -ne 0) {
      throw "tar failed with code $($LASTEXITCODE)."
    }
  }

  Push-Location $policyDir
  try {
    # Parallel cookbook sync races while exporting Windows certificate keys.
    $runOptions = @('--local-mode', '--config', '.chef/config.rb', '--config-option', 'cookbook_sync_threads=1')
    if (Test-Path "attributes.$($chefAttributes).json") {
      $runOptions += @('--json-attributes', "attributes.$($chefAttributes).json")
    }
    if ($chefRunList) {
      $runOptions += @('--named-run-list', $chefRunList)
    }

    Write-Host "Running $($client) $($runOptions -join ' ') in $($policyDir)."
    $ErrorActionPreference = 'Continue'
    & $client @runOptions
    $exitCode = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'
  } finally {
    Pop-Location
  }
} finally {
  if ($tempDir) {
    Remove-Item -Recurse -Force $tempDir -ErrorAction Continue
  }
}

exit $exitCode
