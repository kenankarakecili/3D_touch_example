//
//  QuickActionHandler.swift
//  3D_touch_example
//
//  Created by kenankarakecili on 3/6/19.
//  Copyright © 2019 kenankarakecili. All rights reserved.
//

import UIKit

class QuickActionHandler {
	enum Shortcut: String {
		case openBlue = "OpenBlue"
	}
	
	class func handleQuickAction(shortcutItem: UIApplicationShortcutItem) -> Bool {
		var quickActionHandled = false
		let type = shortcutItem.type.components(separatedBy: ".").last!
		guard let shortcutType = Shortcut.init(rawValue: type) else { return quickActionHandled }
		switch shortcutType {
		case .openBlue:
			getTopmostVC()?.view.backgroundColor = UIColor.blue
			quickActionHandled = true
		}
		return quickActionHandled
	}
	
	class func getTopmostVC() -> UIViewController? {
		if var topVC = UIApplication.shared.keyWindow?.rootViewController {
			while let presentedVC = topVC.presentedViewController {
				topVC = presentedVC
			}
			return topVC
		}
		return nil
	}
}
