after "deploy:setup", "database:setup"
after "deploy:update_code", "database:symlink"
set :db_template_path, "config/deploy/setup/templates/database.template"
set :db_config_name, "database.yml"
namespace :database do

  desc "Setup or update database.yml"
  task :setup do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/internal"
    run_template(db_template_path, db_config_name)
  end

  desc "Creates a symlink to database.yml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/#{db_config_name} #{current_release}/config/#{db_config_name}"
  end

end

namespace :suck do
  
  desc "Fetch database content from server"
  task :db do
    run "cd #{current_release} && rake db:data:dump RAILS_ENV=#{rails_env}"
    dir = "cd #{project} &&" if exists?(:project)
    # TODO is servers.first good?
    `#{dir} rsync -v #{user}@#{roles[:db].servers.first}:#{current_release}/db/data.yml db/data.yml`
    `#{dir} rake db:data:load`
  end

  desc "Fetch assets from server"
  task :assets do
    dir = "cd #{project} &&" if exists?(:project)
    # TODO is servers.first good?
    `#{dir} rsync -rv #{user}@#{roles[:db].servers.first}:#{shared_path}/system/* public/system/`
  end
  
end

after "deploy:update_code", "internal:symlink"
namespace :internal do
  
  desc "Symlink the internal directory"
  task :symlink do
    run "ln -nfs #{shared_path}/internal #{current_release}/public/internal"
  end
  
end

namespace :fileupload do
  
  desc "Create temp directories for nginx file upload"
  task :setup do
    10.times do |i|
      run "mkdir -p #{shared_path}/tmp/#{i}"
    end
  end
  
end

after "deploy:symlink", "deploy:cleanup"
namespace :deploy do

  desc "Start Application"
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  
  desc "Stop Application (does nothing, really)"
  task :stop, :roles => :app do
    # Do nothing.
  end
  
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  
  desc "Deploys and starts a `cold' application."
  task :cold do       # Overriding the default deploy:cold
    update
    run "cd #{current_release} && rake db:create RAILS_ENV=#{rails_env}"
    load_schema       # My own step, replacing migrations.
    run "cd #{current_release} && rake db:seed RAILS_ENV=#{rails_env}" # load the seed data
    start
  end

  task :load_schema, :roles => :app do
    run "cd #{current_release} && rake db:schema:load RAILS_ENV=#{rails_env}"
  end
  
end

after "deploy:update_code", "bundler:symlink"
namespace :bundler do
  
  desc "Symlink bundler directory"
  task :symlink, :roles => :app do
    run "ln -nfs #{shared_path}/bundle #{current_release}/vendor/bundle"
  end
  
end