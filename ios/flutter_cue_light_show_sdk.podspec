#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_cue_light_show_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_cue_light_show_sdk'
  s.version          = '0.0.1'
  s.summary          = 'Cue Light Show'
  s.description      = <<-DESC
Cue Light Show
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.static_framework = true
  s.dependency 'Flutter'
  s.dependency 'MQTTClient', '0.15.3'
  s.dependency 'TrueTime', '5.0.3'
  s.dependency 'ReachabilitySwift', '5.0.0'
  s.dependency 'lottie-ios', '4.1.3'
  s.dependency 'CUELive-framework', '~> 3.6.2'
  s.dependency 'CUELive-bundle-Default', '~> 3.0'
  s.dependency 'engine', '~> 1.14'
  s.dependency 'CUEBluetooth'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
