# wingu-ios-sdk-essentials

[![Version](https://img.shields.io/cocoapods/v/wingu-ios-sdk-essentials.svg?style=flat)](http://cocoapods.org/pods/wingu-ios-sdk-essentials)
[![License](https://img.shields.io/cocoapods/l/wingu-ios-sdk-essentials.svg?style=flat)](http://cocoapods.org/pods/wingu-ios-sdk-essentials)
[![Platform](https://img.shields.io/cocoapods/p/wingu-ios-sdk-essentials.svg?style=flat)](http://cocoapods.org/pods/wingu-ios-sdk-essentials)

wingu sdk essentials is an iOS SDK for managing triggers configured at [wingu](https://wingu.de). It will range beacons and find geofences already with content attached. 

wingu essentials is delivered to you in pre-compiled form `.framework`. It's written in Swift 4.1 


# Table of Contents
1. [Installation](#installation)
 * [Cocoapods](#cocoapods)
 * [Carthage](#carthage)
 * [Manual installation](#manual_installation)
2. [Requirements](#requirements)
3. [Quick start guide](#quick_start)
4. [Documentation](#full_documentation)
5. [License](#license)

<a name="installation"></a>
## Installation

<a name="cocoapods"></a>
### Cocoapods
wingu-ios-sdk-essentials is available through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile:

```ruby
pod 'wingu-ios-sdk-essentials'
```
<a name="carthage"></a>
### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a simple, decentralized dependency manager for Cocoa. 

#### no-build option

Add this dependency to your `Cartfile`

```ruby
github "wingu-GmbH/wingu-ios-sdk-essentials"
```

> **Please Note** this is pre-compiled .framework, so there is only need to fetch it using Carthage not build. Use `--no-build` option in carthage command (ex:  `carthage update --platform iOS --no-build`)

#### Direct link

Version of library can be downloaded using `binary` option in `Cartfile`. Add this line to `Cartfile`:

```ruby
binary "https://raw.githubusercontent.com/wingu-GmbH/wingu-ios-sdk-essentials/master/wingu-ios-sdk-essentials.json"
```
<a name="manual_installation"></a>
### Manual Installation

Copy `winguSDKEssential.framework` file from this repository to your project.

<a name="requirements"></a>
## Requirments

There is a location permission needed to run an app and work with wingu channels. Add this keys into your `Info.plist` file:

```
NSLocationAlwaysAndWhenInUseUsageDescription
NSLocationWhenInUseUsageDescription
```

<a name="quick_start"></a>
## Quick start guide

This guide shows you how get triggers callbacks with default configuration. You can always have some custom parameters in scanners. For all available configuration please check our [full documentation](#full_documentation). Depends on a use case you may need `winguLocations` in only one model or in whole app.

We recommend create a one instance of `winguLocations`:

```swift
lazy var winguLocations: WinguLocations = {
	let winguLocations: WinguLocations = WinguLocations.shared
	winguLocations.delegate = self
	return winguLocations
}()
```

Your class should conform to protocol `WinguLocationsDelegate` and there you will receive all delegate callbacks from wingu triggers 
```swift
extension YourClass: WinguLocationsDelegate { }
```

`WinguLocationsDelegate` requires only one method implemented to get triggers, but you can check [full documentation](#full_documentation). This required callback is:

```swift
func winguChannels(_ channels: [Channel]) {
	// your code here
}
```


`Channel` is default class for all wingu triggers. This method will return available list of channels in range and will also get called whenever some trigger are out of range or scanner found a new one.

You can start ranging beacons by calling

```swift
winguLocations.start()
```

See example project to learn more.

<a name="full_documentation"></a>
## Documentation

Documentation is available [here](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/) or through your IDE.

<a name="license"></a>
## License

`wingu-ios-sdk-essentials` is available under the Apache-2.0 license. See the LICENSE file for more info.
