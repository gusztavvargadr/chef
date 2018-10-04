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
    '.NET Core 2.1.5 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/86df96bb-384c-4d7a-82ce-2e4c2c871189/045870c1ab4004219cb312039c5a64d5/dotnet-hosting-2.1.5-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
