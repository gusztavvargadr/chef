default['gusztavvargadr_docker']['engine_community'] = {
  'features' => {
    'Containers' => {
      'reboot' => true,
    },
    'Hyper-V' => {
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
    'WSL Linux kernel' => {
      'source' => 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi',
      'install' => [
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Windows/System32/lxss/tools/kernel',
      'elevated' => true,
    },
    'Docker Desktop' => {
      'source' => 'https://desktop.docker.com/win/stable/50684/Docker%20Desktop%20Installer.exe',
      'install' => [
        'install',
        'quiet',
      ],
    },
  },
  'chocolatey_packages' => {
  },
}
