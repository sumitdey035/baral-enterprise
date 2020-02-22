lock '~> 3.12.0'

server '13.127.91.212', port: 22, roles: %i[web app db], primary: true

set :application, 'baral-enterprise'
# set :repo_url, 'https://github.com/sumitdey035/baral-enterprise.git'
# set :git_https_username, 'sumit.dey.035@gmail.com'
# set :git_https_password, 'Luvalomistu035'
set :repo_url, 'git@github.com:sumitdey035/baral-enterprise.git'
set :user, 'ubuntu' # server user
set :rbenv_ruby, '2.5.3'

# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, false
set :rails_env, 'production'
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :keep_releases, 5

set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/Downloads/baral_enterprise.pem) }


# Puma configurations
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 2
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# namespace :puma do
#   desc 'Create Directories for Puma Pids and Socket'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/tmp/sockets -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end
#
#   before :start, :make_dirs
# end
