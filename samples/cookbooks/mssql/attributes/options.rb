default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer'] = {
  'windows' => {
    'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
    'configuration_file_name' => 'server_2019_developer.ini',
    'patch_file_url' => 'https://catalog.s.download.windowsupdate.com/c/msdownload/update/software/updt/2024/04/sqlserver2019-kb5035123-x64_f4c614713287412219caadffdc8ae0ff00698324.exe',
  },
}

default['gusztavvargadr_mssql']['options']['tools']['server:2019'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer']
default['gusztavvargadr_mssql']['options']['tools']['server:latest'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019']
default['gusztavvargadr_mssql']['options']['tools']['server'] = default['gusztavvargadr_mssql']['options']['tools']['server:latest']

default['gusztavvargadr_mssql']['options']['tools']['management-studio:20'] = {
  'windows' => {
    'native_packages' => {
      'SSMS 20.1' => {
        'source' => 'https://download.microsoft.com/download/b/9/7/b97061b9-9b9c-4bc7-86de-22b262c016d1/SSMS-Setup-ENU.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
        'executable' => 'C:/Program Files (x86)/Microsoft SQL Server Management Studio 20/Common7/IDE/Ssms.exe',
      },
    },
  },
}

default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:20']
default['gusztavvargadr_mssql']['options']['tools']['management-studio'] = default['gusztavvargadr_mssql']['options']['tools']['management-studio:latest']
