default['gusztavvargadr_mssql']['management_studio']['2018'] = {
  'native_packages' => {
    'SSMS 18.12.1' => {
      'source' => 'https://download.microsoft.com/download/8/a/8/8a8073d2-2e00-472b-9a18-88361d105915/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
    },
  },
}
