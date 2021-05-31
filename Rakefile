require 'rake'
require 'rake/clean'

CLEAN.include('doc/**/*')
CLEAN.include('.yardoc/**/*')

task :default => :gendoc

# desc "Clean out any existing documentation"
# task :clean do
#   `rm -rf doc`
#   `rm -rf .yardoc`
# end

desc "Generate documentation from the example data"
task :gendoc => :clean do
  puts `yardoc -e ./lib/yard-gherkin-cucumber.rb 'example/**/*' --debug`
end

desc "Run the YARD Server"
task :server => :gendoc do
  puts `yard server -e ./lib/yard-gherkin-cucumber.rb`
end

desc "Create the yard-gherkin-cucumber gem"
task :gem do
  puts `gem build yard-gherkin-cucumber.gemspec`
end
