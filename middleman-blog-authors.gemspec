# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-blog-authors"
  s.version     = "4.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Darby Frey"]
  s.email       = ["darby@bellycard.com"]
  # s.homepage    = "http://example.com"
  s.summary     = %q{A Middleman extension to add author profile pages to a blog}
  s.description = %q{A Middleman extension to add author profile pages to a blog}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", [">= 4.0.0"])
  s.add_runtime_dependency("middleman-blog", [">= 4.0.0"])
end
