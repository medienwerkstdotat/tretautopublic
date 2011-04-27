
after "deploy:setup", "impala:setup"
after "deploy:update_code", "impala:symlink"

set :impala_template_path, "config/deploy/setup/templates/impala.template"
set :impala_config_name, "impala.yml"

set :impala, true
namespace :impala do

  desc "Setup the impala.yml on the server"
  task :setup do
    run_template(impala_template_path, impala_config_name)
  end
  
  desc "Symlink impala.yml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/#{impala_config_name} #{current_release}/config/#{impala_config_name}"
    # TODO - remove this once all projects are updated to impala.yml
    run "ln -nfs #{shared_path}/config/#{impala_config_name} #{current_release}/config/inc2.yml"
  end

end
