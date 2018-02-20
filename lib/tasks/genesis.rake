namespace :db do
  desc 'Drop, create, and seed database'
  task :genesis do
    tasks = ['db:drop', 'db:create', 'db:migrate', 'db:seed']
    tasks.each do |t|
      puts "EXECUTING #{t}..."
      Rake::Task[t].reenable
      Rake::Task[t].invoke
    end

    puts "FINISHED WITH GENESIS!"
  end
end
