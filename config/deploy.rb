set :application, "bitspudlo50"

set :user, "ror-bitspudlo"  # CHANGE THIS LINE TO USE YOUR OCS USERNAME
set :use_sudo, false

role :app, "bitspudlo.com"
role :web, "bitspudlo.com"
role :db,  "bitspudlo.com", :primary => true

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
#set :repository, "tomash@thirster:/var/git/bitspudlo_spree"
set :repository, 'git@git.rebased.pl:bitspudlo_spree.git'
set :branch, "master"
#set :deploy_via, :remote_cache
set :deploy_via, :copy
set :scm_verbose, true
set :env, "production"

set :default_environment, {
  'PATH' => '/usr/local/bin:$PATH'
}


require 'bundler/capistrano'

desc "Link in the shared stuff" 
task :make_symlinks do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/application.yml #{release_path}/config/application.yml"
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
  # run "ln -nfs #{deploy_to}/#{shared_dir}/public/assets #{release_path}/public/assets"
  run "ln -nfs #{deploy_to}/#{shared_dir}/certs #{release_path}/certs"
  # run "ln -nfs /u/apps/bitspudlo/shared/public/images/products #{release_path}/public/images/products"
  run "ln -nfs #{deploy_to}/#{shared_dir}/public/spree/products #{release_path}/public/spree/products"
end

namespace :deploy do
  task :start, :roles => :app do
    run "cd #{deploy_to}/current; touch tmp/restart.txt"
  end
  task :stop, :roles => :app do
    run "cd #{deploy_to}/current; touch tmp/restart.txt"
  end
  task :restart, :roles => :app do
    run "cd #{deploy_to}/current; touch tmp/restart.txt"
  end
    
  task :migrate, :roles => :app do
    run "cd #{current_path}; bundle exec rake db:migrate RAILS_ENV=#{env}"
  end
  
end


after "deploy", "deploy:migrate"
#after "deploy:update_code", "make_symlinks"
before "deploy:assets:precompile", "make_symlinks"

require './config/boot'
require 'airbrake/capistrano'
