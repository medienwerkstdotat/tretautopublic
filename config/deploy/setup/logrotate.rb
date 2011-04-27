after "deploy:setup", "logrotate:setup"
after "logrotate:setup", "logrotate:symlink"
set :logrotate_template_path, "config/deploy/setup/templates/logrotate.template"
set :logrotate_config_name, "logrotate.conf"

set :logrotate, true
namespace :logrotate do
  
  desc "Setup or update logrotate.conf"
  task :setup do
    run "mkdir -p #{shared_path}/logrotate"
    run_template(logrotate_template_path, logrotate_config_name)
  end
  
  desc "Symlinks the logrotate conf"
  task :symlink do
    run "ln -nsf #{shared_path}/config/#{logrotate_config_name} /opt/logrotate.d/#{application}.conf"
  end
  
end
