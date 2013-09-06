require 'reek/rake/task'
require 'rubocop/rake_task'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => :ci

RSpec::Core::RakeTask.new(:spec)

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

Rubocop::RakeTask.new

desc 'Run all tests and checkers'
task ci:  %w[spec reek rubocop]
