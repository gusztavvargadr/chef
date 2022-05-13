default['gusztavvargadr_docker']['engine']['desktop']['windows'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V-All' => {},
    'Microsoft-Windows-Subsystem-Linux' => {},
    'VirtualMachinePlatform' => {},
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
    },
    'Docker Desktop 4.8.1' => {
      'source' => 'https://desktop.docker.com/win/main/amd64/78998/Docker%20Desktop%20Installer.exe',
      'install' => [
        'install',
        '--quiet',
      ],
      'executable' => 'C:/Program Files/Docker/Docker/Docker Desktop.exe',
    },
  },
  'chocolatey_packages' => {
  },
}
