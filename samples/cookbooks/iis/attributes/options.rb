default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.3 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/20598243-c38f-4538-b2aa-af33bc232f80/ea9b2ca232f59a6fdc84b7a31da88464/dotnet-hosting-8.0.3-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 7.0.17 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/5d44e448-88ba-493f-9aff-d6daa1319181/7c500e85192bae5e1c43484b0bc7bdd5/dotnet-hosting-7.0.17-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.28 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/c9277ae6-1bd2-47d6-aa9f-0409791e4a22/ce685479743a5567f43913362237e320/dotnet-hosting-6.0.28-win.exe',
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
