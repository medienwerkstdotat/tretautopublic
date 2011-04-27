require "erb"

# here we setup stuff that we need everywhere
ssh_options[:forward_agent] = true
set :user, "deployer" unless exists?(:user)
set :use_sudo, false
set :deploy_via, :remote_cache

after "deploy:symlink", "deploy:cleanup"
namespace :deploy do

  desc "Start Application"
  task :start, :roles => :app do
    # Do nothing.
  end
  
  desc "Stop Application (does nothing, really)"
  task :stop, :roles => :app do
    # Do nothing.
  end
  
  desc "Restart Application"
  task :restart, :roles => :app do
    # Do nothing.
  end
  
  desc "Deploys and starts a `cold' application."
  task :cold do       # Overriding the default deploy:cold
    # Do nothing.
  end
  
end


# parses one template and move it to config_path
def run_template(template_path, file_name, config_path = nil)
  template=File.read(template_path)
  buffer= ERB.new(template).result(binding)
  output_path = config_path.nil? ? "#{shared_path}/config/#{file_name}" : config_path
  put buffer, output_path
end 
