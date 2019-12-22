default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'NetFx3$' => {},
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
    '.NET Core 2.1.14 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/d08902cf-87b0-4bfe-b25c-627ff77b8802/8293c56094f50ba8c4ed703aff95c325/dotnet-hosting-2.1.14-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.8 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/ba001109-03c6-45ef-832c-c4dbfdb36e00/e3413f9e47e13f1e4b1b9cf2998bc613/dotnet-hosting-2.2.8-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.1 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/32b71802-0b4d-4064-a7e6-083b5155d3b1/080cf60a5c06be4ed27e2eac6c693f2f/dotnet-hosting-3.0.1-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.0 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/fa3f472e-f47f-4ef5-8242-d3438dd59b42/9b2d9d4eecb33fe98060fd2a2cb01dcd/dotnet-hosting-3.1.0-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
