default['gusztavvargadr_mssql']['management_studio']['2018'] = {
  'native_packages' => {
    'SSMS 18.7.1' => {
      'source' => 'https://download.microsoft.com/download/2/d/1/2d12f6a1-e28f-42d1-9617-ac036857c5be/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
      'elevated' => true,
    },
  },
}
