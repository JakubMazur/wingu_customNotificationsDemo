#
# Be sure to run `pod lib lint wingu-ios-sdk-essentials.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'wingu-ios-sdk-essentials'
  s.version          = '0.4.2'                  #sh_replace_version
  s.summary          = 'Essentials part of wingu iOS SDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Essentials part of wingu iOS SDK. Visit www.wingu.de to know more.
                       DESC

  s.homepage         = 'https://github.com/wingu-GmbH/wingu-ios-sdk-essentials'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Jakub Mazur' => 'jakub.mazur@wingu.de', 'Mateusz Staruchowicz' => 'mateusz.staruchowicz@wingu.de' }
  s.source           = { :git => 'https://github.com/wingu-GmbH/wingu-ios-sdk-essentials.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wingude'
  s.frameworks = 'UIKit','Foundation','CoreLocation'
  s.ios.deployment_target = '9.0'

  s.source_files = 'winguSDKEssential.framework/Headers/*'
  s.vendored_frameworks = 'winguSDKEssential.framework'

  
  # s.resource_bundles = {
  #   'wingu-ios-sdk-essentials' => ['wingu-ios-sdk-essentials/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


















