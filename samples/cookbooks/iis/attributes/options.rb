default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.0 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/2a7ae819-fbc4-4611-a1ba-f3b072d4ea25/32f3b931550f7b315d9827d564202eeb/dotnet-hosting-8.0.0-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 7.0.14 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/ac40c925-f49c-4f27-b6f5-540ba6b944d5/457f3e7dbe9feeb2644d5a32fef321e4/dotnet-hosting-7.0.14-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.25 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/1fd87564-6bdb-4123-90dd-26488ec868c9/6c68988c310805bdcbb07b704fbe3e9d/dotnet-hosting-6.0.25-win.exe',
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
