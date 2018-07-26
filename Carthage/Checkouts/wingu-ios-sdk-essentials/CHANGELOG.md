# Change Log

> **Note:** Changes mark as **Beta** can change rapidly without backwards compatimbility.

#### 0.4.x Releases
- [0.4.1](#0.4.2)
- [0.4.1](#0.4.1)
- [0.4.0](#0.4.0)

#### 0.3.x Releases

0.3.x Releases are the last release that will mantain support for iOS 9.x. Since Release 0.4.0 wingu-ios-sdk-essentials minimum deployment target will be set to iOS 10.0

- [0.3.0](#0.3.0)

--

## [0.4.2](https://github.com/wingu-GmbH/wingu-ios-sdk-essentials/releases/tag/0.4.2)

#### Added
- `Card` conform fully to `Codable`.
- Encoded `Content` object now contain also informations about `Pack`
- Allow `Channel` to be encoded and decoded [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/Channel.html)

#### Fixed
- `Channel` without content now return correctly in delegate methods.
- Notification payload will again contain information about channel that trigger notification in `userInfo` under key `channel`

## [0.4.1](https://github.com/wingu-GmbH/wingu-ios-sdk-essentials/releases/tag/0.4.1)

###### API version 0.12

#### Added
- `NotificationsManager` gain ability to not send wingu notifications. It can be used with custom notifications or to disable them completely. [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/NotificationsManager.html)

## [0.4.0](https://github.com/wingu-GmbH/wingu-ios-sdk-essentials/releases/tag/0.4.0)

###### API version: 0.12

#### Added
- [Beacon](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/Beacon.html) gain `inRange` var with associated `enum`
- WinguLocationsDelegate gain extra callback method `updatePhysical()` [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Protocols/WinguLocationsDelegate.html)
- update Analytics for automatic sending and data collection for enter in trigger region. [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/WinguAnalytics.html)

#### Removed
- iOS 9.x is no longer supported

#### Beta
- `Logger` struct that help limit logging [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/Logger.html) 


## [0.3.0](https://github.com/wingu-GmbH/wingu-ios-sdk-essentials/releases/tag/0.3.0)

###### API version: 0.12

#### Added
- update channels is now possible to trigger manually. [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/Channel.html#/s:17winguSDKEssential7ChannelC6updateyySbcF)
- notifications now can be configured to be triggered only when content is updated in wingu portal. [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/NotificationsManager.html#/s:17winguSDKEssential20NotificationsManagerC04onlyC17WithContentUpdateSbvp)
- `Content` now contains `lastChange: Date` that tell when last update in wingu portal was made. [See documentation](https://wingu-gmbh.github.io/wingu-ios-sdk-essentials/Classes/Content.html#/s:17winguSDKEssential7ContentC10lastChange10Foundation4DateVSgvp)
