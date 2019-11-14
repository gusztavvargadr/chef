script_code = 'vagrant version'
script_result = 'Installed Version:'

describe powershell(script_code) do
  its('stdout') { should include script_result }
end
