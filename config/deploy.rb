set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'
require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2-p180'
default_run_options[:pty] = true
set :user, "helmutchlebecek"
set :adapter, "mysql2"
set :socket, "none"
#default_run_options[:pty] = true
set :scm, "git"
set :repository,  "git@github.com:medienwerkstdotat/tretautopublic.git"

["base", "rails", "nginx", "logrotate"].each { |recipe| 
  load(File.join("config", "deploy", "setup", recipe)) 
} 