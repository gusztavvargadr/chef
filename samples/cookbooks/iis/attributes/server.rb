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
    '.NET Core 3.1.27 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/f569cc3f-3f9e-4303-af34-026991fa7a7b/1f8fd7dc844fa422cbf6972fb26056f9/dotnet-hosting-3.1.27-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.7 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7de08ae2-75e6-49b8-b04a-31526204fa7b/c1cee44a509495e4bb0bba49f52c719a/dotnet-hosting-6.0.7-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
