namespace :reader do
  desc "TODO"
  task task_1: :environment do
      n = 1
      while n < 100
          puts "gem install libv8 -v '3.11.8.#{n}'"
          n+=1
      end
  end
end
