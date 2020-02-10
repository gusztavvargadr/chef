default['gusztavvargadr_visualstudio']['2019_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 3.0.2 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7d6389b7-eda7-4ae0-924d-4fedaa3d0fc7/7712bebba5b34149837f9b60928acbb1/dotnet-sdk-3.0.102-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
