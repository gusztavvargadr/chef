default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Core 1.0.13 / 1.1.10 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/b84d0334-d56b-47b3-9da4-c48a553ce286/5079d35485214be3fbd72a4fdf21a655/dotnetcore.1.0.13_1.1.10-windowshosting.exe',
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
