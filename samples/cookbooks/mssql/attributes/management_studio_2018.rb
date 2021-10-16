default['gusztavvargadr_mssql']['management_studio']['2018'] = {
  'native_packages' => {
    'SSMS 18.10' => {
      'source' => 'https://download.microsoft.com/download/a/2/e/a2ef0390-62b6-4189-af6d-1762e0aa90aa/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
    },
  },
}
