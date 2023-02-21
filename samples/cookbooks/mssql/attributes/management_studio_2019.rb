default['gusztavvargadr_mssql']['management_studio']['2019'] = {
  'native_packages' => {
    'SSMS 19.0.1' => {
      'source' => 'https://download.microsoft.com/download/a/3/2/a32ae99f-b6bf-4a49-a076-e66503ccb925/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe',
    },
  },
}
