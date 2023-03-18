default['gusztavvargadr_mssql']['management_studio']['2019'] = {
  'native_packages' => {
    'SSMS 19.0.2' => {
      'source' => 'https://download.microsoft.com/download/9/f/8/9f8197f4-0f71-42a3-8717-b2817c77b820/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 19/Common7/IDE/Ssms.exe',
    },
  },
}
