Gem::Specification.new do |s|
  s.name        = 'lab42_shell_tools'
  s.version     = '0.0.1'
  s.date        = '2020-02-02'
  s.summary     = 'div tools'
  s.description = 'div tools'
  s.authors     = ['Robert Dober']
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob('lib/lab42/**/*.rb')
  s.homepage    =
    'https://github.com/robertdober/lab42_rgxargs'
  s.license       = 'Apache-2.0'

  s.executables << 'lab42_init_vim' 

  s.add_dependency 'lab42_rgxargs', '~> 0.1.5'

  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'pry-byebug', '~> 3.7'
  s.add_development_dependency 'pry-doc', '~> 1.0'
end
