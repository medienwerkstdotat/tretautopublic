set :rails_env, "staging"
set :branch, "development"
set :application, "staging.gildemeister.com"
set :server_names, [{ :name => "staging.gildemeister.com"}]

role :app, "staging.gildemeister.com"
role :web, "staging.gildemeister.com"
role :db,  "staging.gildemeister.com", :primary => true
set :deploy_to, "/var/www/#{application}"

# application setup
set :ip, "10.5.2.160"
set :http_port, "8080"
set :https_port, "8443"
set :db_prefix, "gildemeister"
set :db_password, "nAps78fi"

# ssl settings
set :ssl, true
set :ssl_cert, "gildemeister.com/gildemeister.com.crt"
set :ssl_key, "gildemeister.com/gildemeister.com.no-pw.key"
set :ssl_chain, "gd_bundle.crt"

# upload settings
set :fileupload, true

# other settings for the stuff below
set :thinking_sphinx_port, 9312

set :impala_settings, {
  :site_name => "GILDEMEISTER",
  :default_pagination_page => 1,
  :default_pagination_per_page => 3,
  :online => true,
  :landingpage => "home",
  :time_zone => "Berlin",
  :default_locale => "de",
  :key => "staging-gildemeister-com",
  :secret_token => "9b29fa694cd7c9f463d7a4f574f9d1e5ed0aea162fb3a16f3c89a88b1971fa592a2f2000157cee1283259f2a131c55f976c2aead0e0751741efe7d69327734d4",
  :rest_auth_site_key => "c71dfb1357e1a40b34172988d1763765791fcc10",
  :command_path => "/usr/local/bin/",
  :admin_email => "gerold.boehler@antiloop.com",
  :admin_password => "PzCkS5Ai"
}

# hooks that are special for this environment
after "deploy:setup", "nginx:setup"
after "deploy:cold", "nginx:symlink"
after "deploy:cold", "nginx:reload"