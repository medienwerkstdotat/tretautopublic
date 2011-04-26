require "thinking_sphinx/deploy/capistrano"

load(File.join("config", "deploy", "setup", "whenever")) unless exists?(:whenever)

set :thinking_sphinx_host, "127.0.0.1" unless exists?(:thinking_sphinx_host)
set :thinking_sphinx_port, 9312 unless exists?(:thinking_sphinx_port)

after "deploy:setup", "ts:setup"
after "deploy:update_code", "ts:symlink"
after "deploy:update_code", "whenever:symlink"
after "deploy:update_code", "whenever:update"
after "ts:setup", "whenever:setup"
#after "deploy:update_code", "thinking_sphinx:rebuild"
#after "deploy:rollback", "thinking_sphinx:rebuild"
#after "deploy:migrate", "thinking_sphinx:rebuild"

set :ts_template_path, "config/deploy/setup/templates/thinkingsphinx.template"
set :ts_config_name, "sphinx.yml"

set :thinkingsphinx, true
namespace :ts do

  desc "Setup or update sphinx.yml"
  task :setup do
    run "mkdir -p #{shared_path}/db/sphinx"
    run_template(ts_template_path, ts_config_name)
  end

  task :symlink do
    run "ln -nfs #{shared_path}/config/#{ts_config_name} #{current_release}/config/#{ts_config_name}"
  end

end
