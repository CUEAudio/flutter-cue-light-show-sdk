# flutter_cue_light_show_sdk

Cue Light Show

## Getting Started

### iOS

## Installation
The CUE SDK uses Cocoapods and Artifactory to host and distribute. For authenticating with artifactory, in your local file system, locate the file `~/.netrc` (create if necessary) and insert your credentials, provided by CUE:

```
machine cueaudio.jfrog.io
login REPLACE_WITH_YOUR_USERNAME
password REPLACE_WITH_YOUR_PASSWORD
always-auth = true
```

### Install **CocoaPods**, and the CocoaPods *Artifactory* plugin:

```
brew install cocoapods
gem install cocoapods-art
```

If not already using CocoaPods, reference the [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html) for more information.
Once your iOS project has a Podfile you will need to add the "cocoapods-art" plugin to your Podfile. This plugin will allow you to access the CUE Frameworks from Artifactory. Add the following line to the top of your Podfile:
```ruby
plugin 'cocoapods-art', :sources => [
  'cocoapods-local'
]
```

And then you will also need to add this post_install script to the bottom of your Podfile. 
```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```

Next, navigate to your ios directory and using the command line. Execute this command to get access to CUE Frameworks and install the pod:

`pod repo-art update cocoapods-local`
`pod install`


## Configuration

Create the file `ios/Runner/CUEConfig.plist` and add it to the Xcode project. This file contains parameters that can be customized for your application ad contain important keys like apiKey and the primaryColor. Reference the following example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>primaryColor</key>
	<string>#FF0000</string>
	<key>apiKey</key>
	<string>REPLACE_WITH_YOUR_API_KEY</string>
	<key>hasExit</key>
	<true/>
	<key>hasExitOnHomescreen</key>
	<false/>
	<key>shouldShowNotificationOnboarding</key>
	<false/>
</dict>
</plist>
```


### Android

For Android, you will need to define the apiKey and primary color for the CUE SDK in your `android/app/build.gradle` file like the folowing snippet:

<?code-excerpt ""?>
```groovy
buildTypes {
    all {
        resValue "string", "cue_client_api_key", 'REPLACE_WITH_YOUR_API_KEY'
        resValue "color", "cue_primary_color", '#00AEFF'
        
    }
}
```


### Flutter Example

To launch the CUE SDK from your application, you can call the launchCue() method where pertinent.

<?code-excerpt "lib/basic.dart (basic-example)"?>
```dart
import 'package:flutter_cue_light_show_sdk/flutter_cue_light_show_sdk.dart';

void launchCueLightShow() {
  FlutterCueLightShowSdk.launchCue();
}
```


To allow the CUE SDK to fetch the theme prior to its launch, you can call the fetchTheme() method early on. It is recommended to call this shortly after app launch.

<?code-excerpt "lib/basic.dart (basic-example)"?>
```dart
import 'package:flutter_cue_light_show_sdk/flutter_cue_light_show_sdk.dart';

void fetchCueLightShowTheme() {
    FlutterCueLightShowSdk.fetchTheme();
}
```


## Native Demos for reference

For additonal information, reference the native demo applications for iOS and Android and their respective READMEs:
https://github.com/CUEAudio/sdk_demo_ios
https://github.com/CUEAudio/sdk_demo_android

