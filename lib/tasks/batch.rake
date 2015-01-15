namespace :batch do

  desc 'Constant data updates'
  task :update_constantly => :environment do
    Rails.logger.info "Running constant update tasks"
    Rake::Task['course:update_courses'].invoke
    Rake::Task['user:update_users'].invoke
    Rake::Task['revision:update_revisions'].invoke
    Rake::Task['article:update_new_article_views'].invoke
    Rake::Task['cache:update_caches'].invoke
  end

  desc 'Daily data updates'
  task :update_daily => :environment do
    Rails.logger.info "Running daily update tasks"
    Rake::Task['article:update_views'].invoke
    Rake::Task['cache:update_caches'].invoke
  end

  desc 'Initialize the database from scratch'
  task :initialize => :environment do
    Rails.logger.info "Running initialization tasks"
    Rake::Task['course:update_courses'].invoke
    Rake::Task['user:update_users'].invoke
    Rake::Task['revision:update_revisions'].invoke
    Rake::Task['article:update_views_all_time'].invoke
    Rake::Task['cache:update_caches'].invoke
  end

end
