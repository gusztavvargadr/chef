default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/c9b8749dd99fc0d4453b2a3e4c37ba16/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 1.0.16 / 1.1.13 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/85188c51-c71f-442e-ae3a-f46449564959/690b9e12e7da159576f67afd986b873d/dotnetcore.1.0.16_1.1.13-windowshosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.0.9 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/3/a/3/3a3bda26-560d-4d8e-922e-6f6bc4553a84/DotNetCore.2.0.9-WindowsHosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.13 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/070b4126-8c0c-445f-8c0e-7a29963b0a1c/d50548fc04e2e0063dad4fda8232cd9d/dotnet-hosting-2.1.13-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.7 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/51c29196-43b3-47d6-a393-d0df24081ac1/8b8d720b3cd63d88a2fd69115ab713c5/dotnet-hosting-2.2.7-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.0 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/bf608208-38aa-4a40-9b71-ae3b251e110a/bc1cecb14f75cc83dcd4bbc3309f7086/dotnet-hosting-3.0.0-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
