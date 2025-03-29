default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 9.0.3 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/712e0fb1-575c-44f8-9253-3b32ef25e122/763e1cbd0aac7cefe69d2b720316770c/dotnet-hosting-9.0.3-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 8.0.14 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/fdec46ca-0355-4fa5-a0fb-a7b798d24957/c44beca075d298a722ff18adbfad3b81/dotnet-hosting-8.0.14-win.exe',
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
