set :stage, :production
server '104.236.53.46', user: 'deploy', roles: %w{web app db}