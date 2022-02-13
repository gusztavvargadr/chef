default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 3.1.22 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5b681079-0068-4c70-be77-af30f1154a83/cd5d074d8328fbc0b3bebf87c88ae082/dotnet-hosting-3.1.22-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.14 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5adf4f36-aff5-447f-99db-86eae913d4eb/b71f76ea31156438499da1d419c577ff/dotnet-hosting-5.0.14-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.2 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/e77fd80d-b12b-4d8c-9dc2-a22007f44cc8/ad05622589430ca580b7309513f139fe/dotnet-hosting-6.0.2-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
