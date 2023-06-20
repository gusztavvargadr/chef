default['gusztavvargadr_mssql']['management_studio']['2019'] = {
  'native_packages' => {
    'SSMS 19.1' => {
      'source' => 'https://download.microsoft.com/download/a/c/a/aca4e29f-6925-4d50-a06b-5576c6ea629f/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe',
    },
  },
}
