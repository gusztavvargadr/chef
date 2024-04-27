default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.4 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/00397fee-1bd9-44ef-899b-4504b26e6e96/ab9c73409659f3238d33faee304a8b7c/dotnet-hosting-8.0.4-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 7.0.18 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/5c21d823-4a3d-43ef-8b94-fd5fff183219/7256acb83dfb031b0948b942d35cbf80/dotnet-hosting-7.0.18-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.29 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/b54e1bdd-2525-4414-a93a-27c62b329e47/c34cf7303786e74a20f7125475ffa511/dotnet-hosting-6.0.29-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
    },
  },
}

default['gusztavvargadr_iis']['options']['tools']['server'] = default['gusztavvargadr_iis']['options']['tools']['server:latest']
