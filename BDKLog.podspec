Pod::Spec.new do |s|
  s.name         = 'BDKLog'
  s.version      = '1.0.0'
  s.summary      = 'A simple log formatter for CocoaLumberjack.'
  s.description  = 'A simple log formatter for CocoaLumberjack.'
  s.homepage     = 'https://github.com/kreeger/BDKLog'
  s.license      = 'MIT'
  s.author       = { 'Ben Kreeger' => 'ben@kree.gr' }
  s.source       = { :git => 'https://github.com/kreeger/BDKLog.git', :tag => "v#{s.version.to_s}" }
  s.requires_arc = true
  s.source_files = 'Classes'
  s.dependency 'CocoaLumberjack', '~> 1.6'
end
