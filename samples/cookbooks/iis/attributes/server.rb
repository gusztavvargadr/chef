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
    '.NET Core 2.1.15 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/633b17e5-a489-4da4-9713-5ddedf17a5f0/5c18f4203e837dd90ba3da59eee92b01/dotnet-hosting-2.1.15-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.2 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7333c58c-6aa8-4dc2-9c1c-8116f18298ee/4e987f142794d8949e79344f42e253e6/dotnet-hosting-3.0.2-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.1 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/c9206d6d-a11a-4b0b-834b-6320c44d0a2d/993571f75a96b6a64f8bca001797c4f0/dotnet-hosting-3.1.1-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
