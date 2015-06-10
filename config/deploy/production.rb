set :stage, :production
set :branch, "master"

# set :server_name, "www.example.com example.com"

server '54.207.125.128', user: 'deploy', roles: %w{web app db}, primary: true

# set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
# set :unicorn_worker_count, 5

# whether we're using ssl or not, used for building nginx
# config file
# set :enable_ssl, false