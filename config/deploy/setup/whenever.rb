set :whenever_template_path, "config/deploy/setup/templates/schedule.template"
set :whenever_config_name, "schedule.rb"

set :whenever, true
namespace :whenever do

  desc "Setup or update schedule.rb"
  task :setup do
    run_template(whenever_template_path, whenever_config_name)
  end

  desc "Creates a symlink to schedule.rb"
  task :symlink do
    run "ln -nfs #{shared_path}/config/#{whenever_config_name} #{current_release}/config/#{whenever_config_name}"
  end

  desc "Update crontab file"
  task :update, :roles => :app do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} bundle exec whenever --set environment=#{rails_env} --update-crontab #{application}"
  end

end
