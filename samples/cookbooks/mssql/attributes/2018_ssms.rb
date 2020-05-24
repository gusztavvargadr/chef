default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.4' => {
      'source' => 'https://download.microsoft.com/download/1/9/4/1949aa9c-6536-48f2-81fa-e7bb07410b36/SSMS-Setup-ENU.exe',
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
