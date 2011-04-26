set :apache, true
namespace :apache do
  
  desc "Setup or update the config file for apache inside sites-available"
  task :setup do
    run_template("config/deploy/setup/templates/apache.template", "#{application}.conf", "/etc/apache2/sites-available/#{application}.conf")
  end
  
  desc "Reload apache"
  task :reload do
    run "sudo /etc/init.d/apache2 reload"
  end
  
  desc "Enables the current site by linking into sites-enabled and reloading apache"
  task :symlink do
    run "ln -nsf /etc/apache2/sites-available/#{application}.conf /etc/apache2/sites-enabled/#{application}.conf"
  end
  
  desc "Disables the current site by removing the link in sites-enabled and reloading apache"
  task :unlink do
    run "rm /etc/apache2/sites-enabled/#{application}.conf"
  end
  
end
