require "rspec/core/rake_task"

Rake::Task["docs:generate"].clear
Rake::Task["docs:generate:ordered"].clear

desc "Generate API request documentation from API specs"
RSpec::Core::RakeTask.new("docs:generate") do |t|
  t.pattern = "spec/api/**/*_spec.rb"
  t.rspec_opts = ["--format RspecApiDocumentation::ApiFormatter"]
end

desc "Generate API request documentation from API specs (ordered)"
RSpec::Core::RakeTask.new("docs:generate:ordered") do |t|
  t.pattern = "spec/api/**/*_spec.rb"
  t.rspec_opts = ["--format RspecApiDocumentation::ApiFormatter", "--order defined"]
end
