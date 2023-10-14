default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 7.0.12 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/723dac98-2f86-4efa-a67d-90b7f88d1a78/325c7069d70a1b23dd1a1545930ac251/dotnet-hosting-7.0.12-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.23 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/34343c71-eb52-4537-b2b9-f25bc8b6c894/c6a39b3b387ad3f9662cd77c220902f5/dotnet-hosting-6.0.23-win.exe',
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
