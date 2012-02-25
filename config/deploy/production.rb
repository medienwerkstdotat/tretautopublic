set :rails_env, "production"
set :branch, "master"
set :application, "rakete.ror.at"
set :server_names, [{ :name => "rakete.ror.at"}]

role :app, "rakete.ror.at"
role :web, "rakete.ror.at"
role :db,  "rakete.ror.at", :primary => true
set :deploy_to, "/var/www/#{application}"

# application setup
set :ip, "80.120.121.246"
set :db_host, "mysql.antiloop.com"
set :db_prefix, "rakete_ror_at"
set :db_username, "helmutchlebecek"
set :db_password, "oyRyquen"

# ssl settings
set :ssl, false
#set :ssl_cert, "ror.at/ror.at.bundle.crt"
#set :ssl_key, "ror.at/ror.at.no-pw.key"
#set :ssl_chain, "gd_bundle.crt"

after "deploy:setup", "nginx:setup"
after "deploy:cold", "nginx:symlink"
after "deploy:cold", "nginx:reload"
