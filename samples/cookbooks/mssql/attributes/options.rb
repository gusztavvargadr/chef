default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer'] = {
  'windows' => {
    'install_file_url' => 'https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SQLServer2019-x64-ENU-Dev.iso',
    'configuration_file_name' => 'server_2019_developer.ini',
    'patch_file_url' => 'https://catalog.s.download.windowsupdate.com/c/msdownload/update/software/updt/2024/08/sqlserver2019-kb5039747-x64_1cad9480c17058e2aad05c1876883b847a95b095.exe',
  },
}

default['gusztavvargadr_mssql']['options']['tools']['server:2019'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019-developer']
default['gusztavvargadr_mssql']['options']['tools']['server:latest'] = default['gusztavvargadr_mssql']['options']['tools']['server:2019']
default['gusztavvargadr_mssql']['options']['tools']['server'] = default['gusztavvargadr_mssql']['options']['tools']['server:latest']

default['gusztavvargadr_mssql']['options']['tools']['management-studio:20'] = {
  'windows' => {
    'native_packages' => {
      'SSMS 20.2' => {
        'source' => 'https://download.microsoft.com/download/9/b/e/9bee9f00-2ee2-429a-9462-c9bc1ce14c28/SSMS-Setup-ENU.exe',
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
