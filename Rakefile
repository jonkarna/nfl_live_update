require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/*_test.rb']
  test.verbose = true
  # test.warning = true
end

task :console do
  sh "pry -I lib -r nfl.rb"
end

task :default => :test
