default['gusztavvargadr_mssql']['2018_ssms'] = {
  'native_packages' => {
    'SSMS 18.5' => {
      'source' => 'https://download.microsoft.com/download/f/e/b/feb0e6be-21ce-4f98-abee-d74065e32d0a/SSMS-Setup-ENU.exe',
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
