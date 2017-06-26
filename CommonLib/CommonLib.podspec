Pod::Spec.new do |s|
  s.name             = 'CommonLib'
  s.version          = '0.2.0'
  s.summary          = 'CommonLib description'

  s.description      = <<-DESC
CommonLib long description
                       DESC

  s.homepage         = 'https://github.com/gakaki/CommonLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gakaki' => 'gakaki@gmail.com' }
  #s.source          = { :git => 'https://github.com/gakaki/CommonLib.git', :tag => s.version.to_s }
  s.source           = { :git => 'https://github.com/gakaki/CommonLib.git', :branch => 'master' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.source_files = 'CommonLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CommonLib' => ['CommonLib/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.vendored_frameworks = "vendor_frameworks/UMMobClick.framework"
  s.framework           = "CoreTelephony"
  s.libraries           = "sqlite3", "z"
  s.requires_arc        = false
  # s.public_header_files = 'vendor_frameworks/**/*.h'

  s.xcconfig            = { "LIBRARY_SEARCH_PATHS" => "\"$(PODS_ROOT)/**\"" }

  # s.dependency 'UMengAnalyticsSwift'
  
end
