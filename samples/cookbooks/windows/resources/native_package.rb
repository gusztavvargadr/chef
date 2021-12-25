unified_mode true

property :options, Hash, default: {}

default_action :install

action :install do
  source = new_resource.options['source']
  install = new_resource.options['install'].nil? ? {} : new_resource.options['install']
  executable = new_resource.options['executable']

  return if !executable.nil? && ::File.exist?(executable)

  download_directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_windows"
  download_file_path = "#{download_directory_path}/#{::File.basename(source)}"

  gusztavvargadr_windows_file download_file_path do
    options('source' => source)
    action :create
  end

  script_name = "Install Native package '#{new_resource.name}'"
  script_code = "Start-Process \"#{download_file_path.tr('/', '\\')}\" \"#{install.join(' ')}\" -Wait"

  powershell_script script_name do
    code script_code
    action :run
  end
end
