Pod::Spec.new do |s|
  s.name         = 'BDKLog'
  s.version      = '1.0.0'
  s.summary      = 'A simple log formatter for CocoaLumberjack.'
  s.description  = "A simple log formatter for CocoaLumberjack. Also allows for easy CocoaLumberjack initialization, if you're using XcodeColors."
  s.homepage     = 'https://github.com/kreeger/BDKLog'
  s.license      = 'MIT'
  s.author       = { 'Ben Kreeger' => 'ben@kree.gr' }
  s.source       = { :git => 'https://github.com/kreeger/BDKLog.git', :tag => "v#{s.version.to_s}" }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.source_files = 'Classes'
  s.dependency 'CocoaLumberjack', '~> 1.6'
end
