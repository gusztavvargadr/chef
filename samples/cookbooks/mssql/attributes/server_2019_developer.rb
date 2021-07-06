default['gusztavvargadr_mssql']['server']['2019_developer'] = {
  'chocolatey_packages' => {
    '7zip.portable' => {
      'version' => '19.0',
    },
  },
  'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
  'patch_file_url' => 'http://download.windowsupdate.com/c/msdownload/update/software/updt/2020/10/sqlserver2019-kb4577194-x64_a09e2537b854ae384d965e998e53ce33cdc34f16.exe',
}
