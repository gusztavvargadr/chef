default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.1 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/016c6447-764a-4210-a260-bf7a2880d5c0/a5746437a3862d7803284ae8c2290200/dotnet-hosting-8.0.1-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 7.0.15 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/5622bbdd-9184-4dcc-8ea6-7a7f1ce9de74/57103ffa6a60fb2db059d621165ef4b6/dotnet-hosting-7.0.15-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.26 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/16e13e4d-a240-4102-a460-3f4448afe1c3/3d832f15255d62bee8bc86fed40084ef/dotnet-hosting-6.0.26-win.exe',
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
