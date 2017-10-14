server '52.199.204.102', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/itojun/.ssh/id_rsa'
