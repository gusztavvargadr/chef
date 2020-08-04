default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.6' => {
      'source' => 'https://download.microsoft.com/download/d/9/7/d9789173-aaa7-4f5b-91b0-a2a01f4ba3a6/SSMS-Setup-ENU.exe',
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
