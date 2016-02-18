require 'puppet'
Puppet.initialize_settings

def create_file(path)
  Puppet[:noop] = false
  resource = Puppet::Resource.new("file", path, :parameters => {
    :ensure => 'file',
  })
  result = Puppet::Resource.indirection.save(resource)[1]
  failed = result.resource_statuses.values.first.failed
  if failed
    puts "Failed to proces file'#{path}':"
    put result.inspect
    exit 1
  else
    puts result.inspect
  end
end

## Example
#create_file('/tmp/fooooooooo')
