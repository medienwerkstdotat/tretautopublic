after "deploy:setup", "newrelic:setup"
after "deploy:update_code", "newrelic:symlink"
after "deploy:update", "newrelic:notice_deployment"
set :newrelic_template_path, "config/deploy/setup/templates/newrelic.template"
set :newrelic_config_name, "newrelic.yml"

set :newrelic, true
namespace :newrelic do
  
  desc "Setup or update newrelic.yml"
  task :setup do
    run_template(newrelic_template_path, newrelic_config_name)
  end

  desc "Creates a symlink to newrelic.yml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/#{newrelic_config_name} #{current_release}/config/#{newrelic_config_name}"
  end
  
end
