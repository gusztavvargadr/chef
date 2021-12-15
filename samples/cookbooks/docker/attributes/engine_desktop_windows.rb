default['gusztavvargadr_docker']['engine']['desktop']['windows'] = {
  'features' => {
    'Containers' => {
      'reboot' => true,
    },
    'Hyper-V-All' => {
      'reboot' => true,
    },
    'Microsoft-Windows-Subsystem-Linux' => {
      'reboot' => true,
    },
    'VirtualMachinePlatform' => {
      'reboot' => true,
    },
  },
  'powershell_modules' => {},
  'powershell_packages' => {},
  'native_packages' => {
    'WSL Linux kernel update' => {
      'source' => 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi',
      'install' => [
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Windows/System32/lxss/tools/kernel',
      'reboot' => true,
    },
    'Docker Desktop 4.3.1' => {
      'source' => 'https://desktop.docker.com/win/main/amd64/72247/Docker%20Desktop%20Installer.exe',
      'install' => [
        'install',
        '--quiet',
      ],
      'executable' => 'C:/Program Files/Docker/Docker/Docker Desktop.exe',
      'reboot' => true,
    },
  },
  'chocolatey_packages' => {
  },
}
