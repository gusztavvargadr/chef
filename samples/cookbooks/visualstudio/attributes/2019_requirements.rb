default['gusztavvargadr_visualstudio']['2019_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 2.2.7 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/40c1dd82-671c-4974-919d-ac8a61ef5a91/49ab67c335878f4a5bdd84e14c76708f/dotnet-sdk-2.2.402-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
