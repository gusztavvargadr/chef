default['gusztavvargadr_mssql']['management_studio']['2017'] = {
  'native_packages' => {
    'SSMS 17.9.1' => {
      'source' => 'https://download.microsoft.com/download/D/D/4/DD495084-ADA7-4827-ADD3-FC566EC05B90/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn/ManagementStudio/Ssms.exe',
    },
  },
}
