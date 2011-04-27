after "deploy:setup", "page_cache:setup"
after "deploy:update_code", "page_cache:symlink"
after "deploy:rollback", "page_cache:flush"

set :page_cache, true
namespace :page_cache do
  
  desc "Setup page cache directory"
  task :setup do
    run "mkdir -p #{shared_path}/cache"
  end

  desc "Symlink page cache directory"
  task :symlink do
    run "ln -nfs #{shared_path}/cache #{current_release}/public/cache"
  end
  
  desc "Flush page cache"
  task :flush do
    run "rm -rf #{shared_path}/cache/*"
  end
  
end
