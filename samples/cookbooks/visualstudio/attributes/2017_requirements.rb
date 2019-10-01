default['gusztavvargadr_visualstudio']['2017_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 2.2.7 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/f4fc2718-bc21-4a97-ac01-426aed568946/a5f6b770c7396ad1eb71355e4dc234f6/dotnet-sdk-2.2.109-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
