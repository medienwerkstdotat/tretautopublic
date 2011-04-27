
after "deploy:update_code", "include:copy"

set :git_enable_submodules,1
set :project, "include"

set :include, true
namespace :include do

  desc "Copy theme and static files to public folder"
  task :copy do
    run "cp -r #{shared_path}/cached-copy/theme #{current_release}/public/theme"
    run "cp #{shared_path}/cached-copy/theme/static/* #{current_release}/public/"
  end

end
