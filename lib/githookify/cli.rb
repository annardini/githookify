require 'rake'
require 'thor'
require 'githooks/setup'

module Githooks
  class CLI < Thor
    desc "version", "Print version"
    def version
      puts ::Githooks::VERSION
    end

    desc "setup", "Setup the .githooks directory"
    def setup
      Githooks::Setup.install
      puts ".githooks directories created."
    end

    desc "enable", "Enable git hooks"
    def enable
      Githooks::Setup.enable_hooks
      puts "Git hooks enabled."
    end

    desc "disable", "Disable git hooks"
    def disable
      Githooks::Setup.disable_hooks
      puts "Git hooks disabled."
    end

    desc "run HOOK_NAME", "Run tasks for the given hook."
    def run_hook(hook_name)
      Rake.application.init
      Rake.application.load_rakefile
      task_files = Dir.glob(".githooks/tasks/*.rake").select { |file| File.read(file).include?("namespace :#{hook_name.gsub('-', '_')}") }
      task_files.each { |file| Rake.load_rakefile(file) }
      task_name = "#{hook_name.gsub('-', '_')}:run"
      Rake.application[task_name].invoke if Rake::Task.task_defined?(task_name)
    end
  end
end
