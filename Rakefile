require 'rake'
require 'rspec/core/rake_task'

PUPPETMASTER = 'puppet.geeksoc.org'
SSH = 'ssh -t -A'
task :deploy do
    puts "Obsolete: just git push instead."
end

task :apply do
    client = ENV['client']
    sh "#{SSH} #{client} 'sudo puppet agent --test'" do |ok,status|
        puts case status.exitstatus
            when 0 then "Client is up to date."
            when 1 then "Puppet couldn't compile the manifest."
            when 2 then "Puppet made changes."
            when 4 then "Puppet found errors."
        end 
    end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
task :default => [:spec]
