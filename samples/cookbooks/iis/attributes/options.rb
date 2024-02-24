default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.2 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/98ff0a08-a283-428f-8e54-19841d97154c/8c7d5f9600eadf264f04c82c813b7aab/dotnet-hosting-8.0.2-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 7.0.16 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/1419ee9f-72b4-435f-a1e0-14c1ab7200b4/8d9a7366d093d4afd31c43456da4a2e4/dotnet-hosting-7.0.16-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.27 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/04389c24-12a9-4e0e-8498-31989f30bb22/141aef28265938153eefad0f2398a73b/dotnet-hosting-6.0.27-win.exe',
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
