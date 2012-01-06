require 'bundler'
Bundler::GemHelper.install_tasks

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/unit/*_test.rb', 'test/integration/*_test.rb']
  test.verbose = true
  # test.warning = true
end

namespace :test do

  Rake::TestTask.new(:unit) do |test|
    test.libs << 'lib' << 'test'
    test.test_files = FileList["test/unit/*_test.rb"]
    test.verbose = true
  end

  Rake::TestTask.new(:integration) do |test|
    test.libs << 'lib' << 'test'
    test.test_files = FileList["test/integration/*_test.rb"]
    test.verbose = true
  end

end

task :console do
  sh "pry -I lib -r nfl.rb"
end
