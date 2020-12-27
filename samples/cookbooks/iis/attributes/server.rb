default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/c9b8749dd99fc0d4453b2a3e4c37ba16/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 2.1.23 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/3e3c37fb-4d77-4558-a78c-17434e1cc804/60116643f610fb43f858af4e0dc1b223/dotnet-hosting-2.1.23-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.10 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7e35ac45-bb15-450a-946c-fe6ea287f854/a37cfb0987e21097c7969dda482cebd3/dotnet-hosting-3.1.10-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.1 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/b6271a4b-db02-4245-bf99-974ea96b7ca3/29389344a55c6792bd4e717a254168a2/dotnet-hosting-5.0.1-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
