require 'rake/clean'
require 'rake/testtask'

<<<<<<< HEAD
desc "Build a binary gem including pre-compiled binary files for re-distribution"
task :binary  do |t|
  # Move compiled files into locations for repackaging as a binary gem
  FileUtils.mkdir_p('lib/wmq')
  Dir['ext/lib/*.rb'].each{|file| FileUtils.copy(file, File.join('lib/wmq', File.basename(file)))}
  FileUtils.copy('ext/wmq.so', 'lib/wmq/wmq.so')

  gemspec = Gem::Specification.new do |spec|
    spec.name              = 'ferocia-rubywmq'
    spec.version           = WMQ::VERSION
    spec.platform          = Gem::Platform::CURRENT
    spec.authors           = ['Reid Morrison', 'Edwin Fine']
    spec.email             = ['reidmo@gmail.com']
    spec.homepage          = 'https://github.com/reidmorrison/rubywmq'
    spec.date              = Date.today.to_s
    spec.summary           = "Native Ruby interface into WebSphere MQ"
    spec.description       = "RubyWMQ is a high performance native Ruby interface into WebSphere MQ."
    spec.files             = Dir['examples/**/*.rb'] +
                             Dir['examples/**/*.cfg'] +
                             Dir['doc/**/*.*'] +
                             Dir['lib/**/*.rb'] +
                             ['lib/wmq/wmq.so', 'tests/test.rb', 'README', 'LICENSE']
    spec.license           = "Apache License V2.0"
    spec.rubyforge_project = 'rubywmq'
    spec.test_file         = 'tests/test.rb'
    spec.has_rdoc          = false
    spec.required_ruby_version = '>= 1.8.4'
    spec.add_development_dependency 'shoulda'
    spec.requirements << 'WebSphere MQ v5.3, v6 or v7 Client or Server with Development Kit'
  end
  Gem::Package.build gemspec
=======
require_relative 'lib/wmq/version'

task :gem do
  system 'gem build rubywmq.gemspec'
end

task publish: :gem do
  system "git tag -a v#{WMQ::VERSION} -m 'Tagging #{WMQ::VERSION}'"
  system 'git push --tags'
  system "gem push rubywmq-#{WMQ::VERSION}.gem"
  system "rm rubywmq-#{WMQ::VERSION}.gem"
>>>>>>> v2.1.0
end

desc 'Run Test Suite'
task :test do
  Rake::TestTask.new(:functional) do |t|
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose    = true
  end

  Rake::Task['functional'].invoke
end

task default: :test
