require 'pp'

log 'hello' do
  message 'hello'
  level :info
end

log 'node' do
  message node.attributes.pretty_inspect
  level :info
end
