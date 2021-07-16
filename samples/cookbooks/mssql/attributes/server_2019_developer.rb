default['gusztavvargadr_mssql']['server']['2019_developer'] = {
  'chocolatey_packages' => {
    '7zip.portable' => {
      'version' => '19.0',
    },
  },
  'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
  'patch_file_url' => 'http://download.windowsupdate.com/d/msdownload/update/software/updt/2021/06/sqlserver2019-kb5003249-x64_a1b2d2845c5c66d7b9fced09309537d5fa7dc540.exe',
}
