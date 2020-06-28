# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "ror-tracks"
set :repo_url, "git@github.com:gtrafimenkov/example-a020-ror-app-tracks.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/ror-tracks"

# Configuring capistrano rvm support
set :rvm_roles, [:app]
set :rvm_type, :user
set :rvm_ruby_version, '2.6.6'

before 'puma:start', 'custom:puma_make_dirs'
before 'bundler:install', 'custom:install_bundler'

set :bundle_without, %w{development test}.join(' ')

append :linked_files, "config/database.yml"
append :linked_files, "config/site.yml"

append :linked_dirs, '.bundle'
append :linked_dirs, 'log'

set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"

namespace :custom do
  task :puma_make_dirs do
    on roles(:app) do
      # required my Puma
      execute "mkdir -p #{shared_path}/log"
      execute "mkdir -p #{shared_path}/tmp/pids"
      execute "mkdir -p #{shared_path}/tmp/sockets"
    end
  end

  task :install_bundler do
    # The Gemfile.lock is created with bundler 2.1 (see BUNDLED WITH inside the file).
    # We need this version of bundler installed on the app server,
    # so bundle install can be performed.
    on roles(:app) do
      execute "~/.rvm/bin/rvm #{fetch :rvm_ruby_version} do gem install -N 'bundler:~> 2.1'"
    end
  end
end
