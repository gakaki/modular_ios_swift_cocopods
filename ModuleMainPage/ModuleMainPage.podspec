Pod::Spec.new do |s|
  s.name             = 'ModuleMainPage'
  s.version          = '0.1.0'
  s.summary          = 'ModuleMainPagedesc'

  s.description      = <<-DESC
ModulePage desc
                       DESC

  s.homepage         = 'https://github.com/gakaki/ModuleMainPage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gakaki' => 'gakaki@gmail.com' }
  s.source           = { :git => 'https://github.com/gakaki/ModuleMainPage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ModuleMainPage/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ModuleMainPage' => ['ModuleMainPage/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'CommonLib', '~> 2.3'
  # s.dependency 'CommonLib', '~> 0.1.0'
  s.dependency 'CommonLib', '~> 0.2.0'
end


