# Set some attributes based on the platform of the target node
case node['platform_family']
when 'debian'
  default['mongo']['package-name'] = 'mongodb-org'
when 'rhel'
  default['mongo']['package-name'] = 'mongodb-org'
end
