default['gusztavvargadr_visualstudio']['2017_requirements'] = {
  'features' => {
    'NetFx3$' => {},
  },
  'native_packages' => {
    '.NET Core 2.2.8 SDK' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/78969d24-673f-4515-9544-1dd5bcda5411/beda84891a9a085cecd9bff855fdd082/dotnet-sdk-2.2.110-win-x64.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
