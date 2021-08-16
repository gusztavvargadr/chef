describe file('C:/Program Files (x86)/Microsoft Visual Studio/2019/Professional/Common7/IDE/devenv.exe') do
  its('product_version') { should include '16.11' }
end
