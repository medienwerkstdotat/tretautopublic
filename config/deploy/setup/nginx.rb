set :nginx, true
namespace :nginx do
  
  desc "Setup or update the config file for nginx inside sites-available"
  task :setup do
    path = "config/deploy/setup/templates/nginx.template"
    override_path = "config/deploy/#{rails_env}/nginx.template"
    path = override_path if File.exists?(override_path)
    run_template(path, "#{application}.conf", "/opt/nginx/conf/sites-available/#{application}.conf")
    
    # if we have a http_username and http_password, set up the http authentication
    if exists?(:http_username) && exists?(:http_password)
      run "echo #{http_username}:#{http_password} > /opt/httpauth/#{application}"
    else
      run "rm -f /opt/httpauth/#{application}"
    end
  end
  
  desc "Reload Nginx"
  task :reload do
    run "sudo /etc/init.d/nginx reload"
  end
  
  desc "Symlinks the current site by linking into sites-enabled and reloading nginx"
  task :symlink do
    run "ln -nsf /opt/nginx/conf/sites-available/#{application}.conf /opt/nginx/conf/sites-enabled/#{application}.conf"
  end
  
  desc "Disables the current site by removing the link in sites-enabled and reloading nginx"
  task :unlink do
    run "rm /opt/nginx/conf/sites-enabled/#{application}.conf"
  end
  
end
