default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.7 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/7d169ca8-2755-4870-b45c-bfc651013a77/46639ef8e327f00ab1a941288dd28abe/dotnet-hosting-8.0.7-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.32 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/67acc6b0-c653-4abf-af31-96edf0f75b24/90a29be6426124af37a70871fe1c0509/dotnet-hosting-6.0.32-win.exe',
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
