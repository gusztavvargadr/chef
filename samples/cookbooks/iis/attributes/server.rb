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
    '.NET Core 3.1.9 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/beca42b0-54a8-4364-86b8-a3d88003fbb7/592e0eec1e5e53f78d9647f7112cc743/dotnet-hosting-3.1.9-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
