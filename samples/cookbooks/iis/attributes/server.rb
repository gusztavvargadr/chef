default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Core 1.0.14 / 1.1.11 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/3c1eea43-d933-414e-97bd-3b382f57a78c/7bad96a7fbee33cd15e210090e5413cc/dotnetcore.1.0.14_1.1.11-windowshosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.8 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/c2b2968d-022d-4889-afd0-b02010813c94/bd315e931f55eecfdaea258cf3dee48e/dotnet-hosting-2.1.8-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.2 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5efd5ee8-4df6-4b99-9feb-87250f1cd09f/552f4b0b0340e447bab2f38331f833c5/dotnet-hosting-2.2.2-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
