#
# Be sure to run `pod lib lint GMDataTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GMDataTool'
  s.version          = '0.2.0'
  s.summary          = '数据存储  UserDefaults 归档  钥匙串存储'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UserDefaults存储 归档 钥匙串存储 别的还有待于 更新
                       DESC

  s.homepage         = 'https://github.com/ioszhanghui/GMDataTool.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ioszhanghui@163.com' => 'yomingyo@gmail.com' }
  s.source           = { :git => 'https://github.com/ioszhanghui/GMDataTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'GMDataTool/Classes/**/*'
  
  s.dependency 'MJExtension'
  s.dependency 'GMSandboxTool'
  s.dependency 'GMThirdLibrary/GMkeyChain'
  s.dependency 'SAMKeychain'
  s.dependency 'GMPhoneInfo'
  
  s.prefix_header_contents = '#import<GMSandboxTool/GMFileUtil.h>','#import<MJExtension/MJExtension.h>','#import<GMPhoneInfo/GMPhoneInfo_Header.h>'

  
  
  # s.resource_bundles = {
  #   'GMDataTool' => ['GMDataTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
