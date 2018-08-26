default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Core 1.0.12 / 1.1.9 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/3/7/f/37f3cf83-bed5-4ef1-bcd5-f24f7aef7c56/DotNetCore.1.0.12_1.1.9-WindowsHosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.0.9 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/3/a/3/3a3bda26-560d-4d8e-922e-6f6bc4553a84/DotNetCore.2.0.9-WindowsHosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.3 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/6/E/B/6EBD972D-2E2F-41EB-9668-F73F5FDDC09C/dotnet-hosting-2.1.3-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
