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
    '.NET Core 2.1.12 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/eebd54bc-c3a2-4580-bb29-b35c1c5ffa92/22ffe5649861167d3d5728d3cb4b10a1/dotnet-hosting-2.1.12-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.6 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/a9bb6d52-5f3f-4f95-90c2-084c499e4e33/eba3019b555bb9327079a0b1142cc5b2/dotnet-hosting-2.2.6-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
