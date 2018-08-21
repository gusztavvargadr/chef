default['gusztavvargadr_mssql']['2017_ssms'] = {
  'native_packages' => {
    'SSMS 17.8.1' => {
      'source' => 'https://download.microsoft.com/download/0/5/B/05B2AF8F-906F-4C57-A58E-5780F64F9D62/SSMS-Setup-ENU.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn/ManagementStudio/Ssms.exe',
      'elevated' => true,
    },
  },
}
