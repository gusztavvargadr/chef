default['gusztavvargadr_mssql']['management_studio']['2018'] = {
  'native_packages' => {
    'SSMS 18.11.1' => {
      'source' => 'https://download.microsoft.com/download/c/7/c/c7ca93fc-3770-4e4a-8a13-1868cb309166/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
    },
  },
}
