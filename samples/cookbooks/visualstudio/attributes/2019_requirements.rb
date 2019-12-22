default['gusztavvargadr_visualstudio']['2019_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 2.2.8 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/279de74e-f7e3-426b-94d8-7f31d32a129c/e83e8c4c49bcb720def67a5c8fe0d8df/dotnet-sdk-2.2.207-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.1 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/66adfd75-9c1d-4e44-8d9c-cdc0cbc41104/5288b628601e30b0fa10d64fdaf64287/dotnet-sdk-3.0.101-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
