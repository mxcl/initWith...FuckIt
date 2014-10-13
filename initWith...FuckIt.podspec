Pod::Spec.new do |s|
  s.name = "initWith...FuckIt"
  s.version = "1.8.3"
  s.homepage = "https://github.com/mxcl/#{s.name}"
  s.source = { :git => "https://github.com/mxcl/#{s.name}.git", :tag => s.version }
  s.license = { :type => 'Public Domain', :text => 'This text or CocoaPods throws a fit' }
  s.summary = 'Convenience constructors for potty-mouths.'
  s.social_media_url = 'https://twitter.com/mxcl'
  s.authors  = { 'Max Howell' => 'mxcl@me.com' }
  s.ios.source_files = '*.{h,m}'
  s.frameworks = 'UIKit'
  s.requires_arc = true
  s.ios.deployment_target = '5.0'
end
