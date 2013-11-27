$:.unshift File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|

  excludes = [/lib.wmq.constants\.rb/, /lib.wmq.constants_admin\.rb/, /ext.wmq_structs\.c/, /ext.wmq_reason\.c/, /ext.Makefile/, /ext.*\.o/, /ext.wmq\.so/, /\.gem$/, /\.log$/, /nbproject/]

  spec.name              = 'ferocia-rubywmq'
  spec.version           = "1.1.1"
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

  spec.post_install_message = <<-MESSAGE
* ferocia-rubywmq builds against the WMQ libs, which aren't available for OS X.
* The gem will still install, but the build will be skipped, producing a
* non-functional gem, so you'll need stubs. (You can skip the build elsewhere by
* setting the DISABLE_RUBYWMQ environment variable.)
  MESSAGE
end

