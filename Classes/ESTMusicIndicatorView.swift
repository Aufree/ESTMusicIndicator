//
//  ESTMusicIndicatorView.swift
//  ESTMusicIndicator
//
//  Created by Aufree on 12/6/15.
//  Copyright © 2015 The EST Group. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

/**
 Values for the [state]([ESTMusicIndicatorView state]) property.
 
 
 */

public enum ESTMusicIndicatorViewState: Int {
     /**
     Stopped state of an indicator view.
     In this state, if an indicator's [hidesWhenStopped]([ESTMusicIndicatorView hidesWhenStopped]) is `YES`, the indicator becomes hidden.
     Or if an indicator's [hidesWhenStopped]([ESTMusicIndicatorView hidesWhenStopped]) is `NO`, the indicator shows idle bars.
     */
    case stopped
    
    /**
     Playing state of an indicator view.
     In this state, an indicator shows oscillatory animated bars.
     */
    case playing
    
    /**
     Paused state of an indicator view.
     In this state, an indicator shows idle bars.
     */
    case paused
}

open class ESTMusicIndicatorView: UIView {

    /**
     A boolean value that controls whether the receiver is hidden
     when the state is set to `ESTMusicIndicatorViewStateStopped`.
     
     If the value of this property is `YES` (the default),
     the receiver sets its `hidden` property (`UIView`) to `YES`
     when receiver’s state is `ESTMusicIndicatorViewStateStopped`.
     If the value is `NO`, the receiver is shown even when it's stopped.
     
     Note that by setting state `ESTMusicIndicatorViewStatePlaying` or `ESTMusicIndicatorViewStatePaused`
     the receiver will be shown automatically.
     */
    
    open var hidesWhenStopped: Bool = true {
        didSet {
            if state == .stopped {
                isHidden = hidesWhenStopped
            }
        }
    }
    
    /**
     The current state of the receiver.
     
     You can control the receiver's appearance and behavior by setting this property.
     
     - `ESTMusicIndicatorViewStateStopped`:
     - If hidesWhenStopped is `YES`, the receiver becomes hidden.
     - If hidesWhenStopped is `NO`, the receiver shows idle bars (same as `ESTMusicIndicatorViewStatePaused`).
     - `ESTMusicIndicatorViewStatePlaying`: The receiver shows oscillatory animated bars.
     - `ESTMusicIndicatorViewStatePaused`: The receiver shows idle bars.
     
     The initial value is `ESTMusicIndicatorViewStateStopped`.
     */
    
    public var state: ESTMusicIndicatorViewState = .stopped {
        didSet {
            if state == .stopped {
                stopAnimating()
                if hidesWhenStopped {
                    isHidden = true
                }
            } else {
                if state == .playing {
                    startAnimating()
                } else {
                    stopAnimating()
                }
                isHidden = false
            }
        }
    }
    
    private var hasInstalledConstraints: Bool = false
    private var contentView:ESTMusicIndicatorContentView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        layer.masksToBounds = true
        contentView = ESTMusicIndicatorContentView.init()
        addSubview(contentView)
        prepareLayoutPriorities()
        setNeedsUpdateConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationDidEnterBackground(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillEnterForeground(_:)), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
    }
    
    private func prepareLayoutPriorities() {
        // Custom views should set default values for both orientations on creation,
        // based on their content, typically to NSLayoutPriorityDefaultLow or NSLayoutPriorityDefaultHigh.
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: UILayoutConstraintAxis.horizontal)
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: UILayoutConstraintAxis.vertical)
        
        setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: UILayoutConstraintAxis.horizontal)
        setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: UILayoutConstraintAxis.vertical)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Auto Layout
    
    override open var intrinsicContentSize : CGSize {
        return contentView.intrinsicContentSize
    }
    
    override open func updateConstraints() {
        if !hasInstalledConstraints {
            addConstraint(NSLayoutConstraint(item: self,
                                        attribute: .centerX,
                                        relatedBy: .equal,
                                        toItem: contentView,
                                        attribute: .centerX,
                                        multiplier: 1.0,
                                        constant: 0.0))
            
            addConstraint(NSLayoutConstraint(item: self,
                                        attribute: .centerY,
                                        relatedBy: .equal,
                                        toItem: contentView,
                                        attribute: .centerY,
                                        multiplier: 1.0,
                                        constant: 0.0))
            
            hasInstalledConstraints = true
        }
        super.updateConstraints()
    }
    
    override open func forBaselineLayout() -> UIView {
        return contentView
    }
    
    // MARK: Frame-Based Layout
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return intrinsicContentSize
    }
    
    // MARK: Helpers
    
    private func startAnimating() {
        
        if contentView.isOscillating() {
            return
        }
        
        contentView.stopDecay()
        contentView.startOscillation()
    }
    
    private func stopAnimating() {
        if !contentView.isOscillating() {
            return
        }
        
        contentView.stopOscillation()
        contentView.startDecay()
    }
    
    // MARK: Notification
	
	@objc
	private func applicationDidEnterBackground(_ notification: Notification) {
		stopAnimating()
	}
	
	@objc
	private func applicationWillEnterForeground(_ notification: Notification) {
		if state == .playing {
			startAnimating()
		}
	}
}
