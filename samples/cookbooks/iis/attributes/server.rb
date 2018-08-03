default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Core 1.1.8 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/1/B/8/1B80E25B-316E-4DFB-9707-DB758681F175/DotNetCore.1.0.11_1.1.8-WindowsHosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.0.7 Windows Server Hosting' => {
      'source' => 'https://download.microsoft.com/download/A/9/F/A9F8872C-48B2-41DB-8AAD-D5908D988592/DotNetCore.2.0.7-WindowsHosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
