# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-in_http_healthcheck"
  spec.version       = "0.0.1"
  spec.authors       = ["Zaki_XL"]
  spec.email         = ["heavenzdrive@gmail.com"]

  spec.summary       = %q{fluentd plug-in for HTTP Health Check}
  spec.description   = %q{fluentd plug-in for HTTP Health Check}
  spec.homepage      = "http://need4answer.blogspot.jp/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "fluentd", ">= 0.10.00"
end
