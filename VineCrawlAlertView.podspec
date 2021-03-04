#
# Be sure to run `pod lib lint VineCrawlAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VineCrawlAlertView'
  s.version          = '1.0'
  s.summary          = 'A type of alert that stays on the screen'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  I created this type of alert as an easy way to display information to the user without requiring an action from the user.
                       DESC

  s.homepage         = 'https://github.com/joshmon27/VineCrawlAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'joshmon27' => 'joshwalton5772@gmail.com' }
  s.source           = { :git => 'https://github.com/joshmon27/VineCrawlAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'VineCrawlAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VineCrawlAlertView' => ['VineCrawlAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
