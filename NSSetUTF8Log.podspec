#
# Be sure to run `pod lib lint NSSetUTF8Log.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSSetUTF8Log'
  s.version          = '0.1.0'
  s.summary          = '集合类型在控制台中打印中文(UTF8)字符'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'OC中集合数据类型在Xcode控制台中打印中文(UTF8)字符' \
                       '将源文件加入工程即可,不需要import,也不需要额外的代码'

  s.homepage         = 'https://github.com/AiweiChujian/NSSetUTF8Log.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AiweiChujian' => 'aiweichujian@gmail.com' }
  s.source           = { :git => 'https://github.com/AiweiChujian/NSSetUTF8Log.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.source_files = 'NSSetUTF8Log/Classes/**/*'
  s.requires_arc = true
  
#  s.default_subspec = 'Core'
#
#  s.subspec 'Core' do |core|
#      core.source_files = 'NSSetUTF8Log/Classes/Core/**/*'
#      core.public_header_files = 'NSSetUTF8Log/Classes/Core/**/*.h'
#      #core.frameworks = 'UIKit', 'MediaPlayer', 'AVFoundation'
#  end

  
  
  # s.resource_bundles = {
  #   'NSSetUTF8Log' => ['NSSetUTF8Log/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
#  s.dependency 'AFNetworking'
end
