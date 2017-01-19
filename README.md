![](http://ww4.sinaimg.cn/large/76dc7f1bjw1ezi2uzethxj21jk09uabz.jpg)

<p align="center">
<a href="https://weibo.com/jinfali"><img src="https://img.shields.io/badge/contact-@Aufree-orange.svg?style=flat"></a>
<a href="https://github.com/Aufree/ESTMusicIndicator/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg?style=flat"></a>
<a href="https://github.com/Aufree"><img src="https://ga-beacon.appspot.com/UA-70965318-2/ESTMusicIndicator/readme" alt="GA"></a>
</p>

Cool Animated music indicator view written in Swift.

ESTMusicIndicator is an implementation of [NAKPlaybackIndicatorView](https://github.com/yujinakayama/NAKPlaybackIndicatorView) in Swift for iOS 8.

> <> Made With :heart: By [The EST Group](http://est-group.org/).

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/5310542/12050743/8b3352ec-af34-11e5-99b8-24577e5475e7.png" width="320" height="150" alt="MusicIndicator"/>
</p>

## You may interested in my other project

* [PHPHub-iOS](https://github.com/aufree/phphub-ios) PHPHub for iOS is the universal iPhone and iPad application for PHPHub.
* [ESTMusicPlayer](https://github.com/Aufree/ESTMusicPlayer) An elegant and simple iOS music player.
* [ESTCollectionViewDropDownList](https://github.com/Aufree/ESTCollectionViewDropDownList) A demo implementation of a drop down tag list view for iOS.
* [Hodor](https://github.com/Aufree/Hodor) A simple solution to localize your iOS App quickly.

## Requirements

* An iPhone/iPad running iOS 8.0+
* Xcode 7.0 or above

## Screenshots

<p align="center">
<img src="http://ww1.sinaimg.cn/large/76dc7f1bgw1eznwh2vtipg20ku11277j.gif" width="350" height="667" alt="MusicIndicator"/>
</p>

## Run the Demo

```bash
$ open Example/ESTMusicIndicator.xcodeproj
```

## Installation

### CocoaPods

CocoaPods is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ESTMusicIndicatorView into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'ESTMusicIndicator'
```

Then, run the following command:

```bash
$ pod install
```

You can check out [this link](http://www.raywenderlich.com/97014) for more information about how to use CocoaPods.

### Manually

1. Clone this project or download it.
2. Drag and drop Classes folder to your workspace

## Usage

Simple Example:

```swift
let indicator = ESTMusicIndicatorView.init(frame: CGRectZero)
indicator.tintColor = UIColor.red
indicator.sizeToFit()
view.addSubview(indicator)
```

Initially the `state` property is ESTMusicIndicatorViewStateStopped and the `hidesWhenStopped` property is YES.
Thus, the view is hidden at this time.

The view appears and the bars start animation.

```swift
indicator.state = .playing;
```

The bars stop animation and become idle.

```swift
indicator.state = .paused;
```

The view becomes hidden.

```swift
indicator.state = .stopped;
```

You can use ESTMusicIndicatorView in both code and Storyboard, and it works well with both Auto Layout and frame-based layout.

### Code with Auto Layout

```swift
let indicator = ESTMusicIndicatorView.init(frame: CGRectZero)
indicator.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(indicator)
```

Then, add some positioning layout constraints.
Note that normally you don't need to add sizing constraints since ESTMusicIndicatorView has an intrinsic content size.
It will be automatically resized to fit its content.

### Code with Frame-Based Layout

```swift
let indicator = ESTMusicIndicatorView.init(frame: CGRectZero)
view.addSubview(indicator)
indicator.sizeToFit() // Resize itself to fit its content.
```

## Customization

### Color

The color of the bars can be changed by setting `tintColor` property (`UIView`) of the view or its ancestor view.

### Size

Normally the view can be automatically resized to fit its content by:

* Omitting sizing constraints in Auto Layout, since it has an intrinsic content size.
* Calling `sizeToFit` in frame-based layout.

Or if you explicitly specify size, the bars will be placed in the center of the view.

## Contact

You can ping me on [Twitter](https://twitter.com/_Paul_King_) or follow me on [Weibo](http://weibo.com/jinfali) If you find an issue.

## Contributing

Thank you for your interest in contributing to Hodor! Your ideas for improving this app are greatly appreciated. The best way to contribute is by submitting a pull request. I'll do my best to respond to you as soon as possible. You can also [submit a new GitHub issue](https://github.com/Aufree/ESTMusicIndicator/issues/new) if you find bugs or have questions.

## Thanks for

* [NAKPlaybackIndicatorView](https://github.com/yujinakayama/NAKPlaybackIndicatorView)

## License

Copyright (c) 2017 Paul King
---

Released under the [MIT license](https://github.com/Aufree/ESTMusicIndicator/blob/master/LICENSE)
