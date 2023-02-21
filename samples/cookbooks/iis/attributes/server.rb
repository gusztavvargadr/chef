default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET 7.0.3 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/ff197e9e-44ac-40af-8ba7-267d92e9e4fa/d24439192bc549b42f9fcb71ecb005c0/dotnet-hosting-7.0.3-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.14 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/321a2352-a7aa-492a-bd0d-491a963de7cc/6d17be7b07b8bc22db898db0ff37a5cc/dotnet-hosting-6.0.14-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.32 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/6744eb9d-dcd4-4386-9d87-b03b70fc58ce/818fadf3f3d919c17ba845b2195bfd9b/dotnet-hosting-3.1.32-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
  },
}
