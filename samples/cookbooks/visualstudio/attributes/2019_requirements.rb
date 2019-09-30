default['gusztavvargadr_visualstudio']['2019_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 1.1.14 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/c6b9a396-5e7a-4b91-86f6-f9e8df3bf1dd/6d61addfd6069e404981bede03f8f4f9/dotnet-dev-win-x64.1.1.14.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.202 SDK' => {
      'source' => 'https://download.microsoft.com/download/f/c/1/fc16c864-b374-4668-83a2-f9f880928b2d/dotnet-sdk-2.1.202-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.802 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/0297dbc2-424f-426a-a415-b39927dffe9a/2417ef7aae3c24da94ad7e54137b38b6/dotnet-sdk-2.1.802-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.402 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/40c1dd82-671c-4974-919d-ac8a61ef5a91/49ab67c335878f4a5bdd84e14c76708f/dotnet-sdk-2.2.402-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.100 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/53f250a1-318f-4350-8bda-3c6e49f40e76/e8cbbd98b08edd6222125268166cfc43/dotnet-sdk-3.0.100-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
