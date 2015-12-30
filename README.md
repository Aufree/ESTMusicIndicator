Cool Animated music indicator view written in Swift.

ESTMusicIndicator is an implementation of NAKPlaybackIndicatorView in Swift for iOS 8.

> <> Made With :heart: By [The EST Group](http://est-group.org/).

## Requirements

* An iPhone/iPad running iOS 8.0+
* Xcode 7.0 or above

## Screenshots

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/5310542/12050743/8b3352ec-af34-11e5-99b8-24577e5475e7.png" width="320" height="150" alt="MusicIndicator"/>
</p>

## Run the Demo

```bash
$ open ESTMusicIndicator.xcodeproj
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

pod 'ESTMusicIndicatorView', '0.1'
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
indicator.tintColor = UIColor.redColor()
indicator.sizeToFit()
view.addSubview(indicator)
```

Initially the `state` property is ESTMusicIndicatorViewStateStopped and the `hidesWhenStopped` property is YES.
Thus, the view is hidden at this time.

The view appears and the bars start animation.

```swift
indicator.state = .ESTMusicIndicatorViewStatePlaying;
```

The bars stop animation and become idle.

```swift
indicator.state = .ESTMusicIndicatorViewStatePaused;
```

The view becomes hidden.

```swift
indicator.state = .ESTMusicIndicatorViewStateStopped;
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

## Thanks for

* [NAKPlaybackIndicatorView](https://github.com/yujinakayama/NAKPlaybackIndicatorView)

## License

Copyright (c) 2015 Paul King
---

Released under the [MIT license](https://github.com/Aufree/ESTMusicIndicator/blob/master/LICENSE)
