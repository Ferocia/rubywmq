$:.unshift File.expand_path('../lib', __FILE__)
require 'wmq/version'

Gem::Specification.new do |spec|

  excludes = [/lib.wmq.constants\.rb/, /lib.wmq.constants_admin\.rb/, /ext.wmq_structs\.c/, /ext.wmq_reason\.c/, /ext.Makefile/, /ext.*\.o/, /ext.wmq\.so/, /\.gem$/, /\.log$/, /nbproject/]

  spec.name              = 'ferocia-rubywmq'
  spec.version           = WMQ::VERSION
  spec.platform          = Gem::Platform::RUBY
  spec.authors           = ['Reid Morrison', 'Edwin Fine']
  spec.email             = ['reidmo@gmail.com']
  spec.homepage          = 'https://github.com/reidmorrison/rubywmq'
  spec.date              = Date.today.to_s
  spec.summary           = "Native Ruby interface into WebSphere MQ"
  spec.description       = "RubyWMQ is a high performance native Ruby interface into WebSphere MQ."
  spec.files             = Dir.glob("./**/*").reject {|p| excludes.any? {|e| p[e] } }.map {|f| f.sub(/^\.\//, '')} + ['.document']
  spec.license           = "Apache License V2.0"
  spec.extensions        << 'ext/extconf.rb'
  spec.rubyforge_project = 'rubywmq'
  spec.test_file         = 'tests/test.rb'
  spec.has_rdoc          = true
  spec.required_ruby_version = '>= 1.8.4'
  spec.add_development_dependency 'shoulda'
  spec.requirements << 'WebSphere MQ v5.3, v6 or v7 Client or Server with Development Kit'

  if RUBY_PLATFORM =~ /darwin/
    spec.post_install_message = <<-MESSAGE

###########################################
* [rubywmq] The rubywmq gem cannot be installed on a mac as you need WMQ client libraries on the system.
* [rubywmq] Installation will complete successfully (so you can keep this gem in your bundles) but the gem will not function, you'll need stubs on a mac.
###########################################

    MESSAGE
  end
end
