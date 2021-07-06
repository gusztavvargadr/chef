default['gusztavvargadr_mssql']['management_studio']['2018'] = {
  'native_packages' => {
    'SSMS 18.9.1' => {
      'source' => 'https://download.microsoft.com/download/4/6/8/4681f3b2-f327-4d3d-8617-264b20685be0/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe',
    },
  },
}
