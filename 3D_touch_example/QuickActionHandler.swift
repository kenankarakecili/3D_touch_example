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
		case favourites = "Favourites"
	}
	
	class func handleQuickAction(shortcutItem: UIApplicationShortcutItem) -> Bool {
		var quickActionHandled = false
		let type = shortcutItem.type.components(separatedBy: ".").last!
		guard let shortcutType = Shortcut.init(rawValue: type) else { return quickActionHandled }
		switch shortcutType {
		case .openBlue:
			getTopmostVC()?.view.backgroundColor = UIColor.blue
			quickActionHandled = true
		case .favourites:
			guard let vc = getTopmostVC() else { return quickActionHandled }
			var message = "\(shortcutType.rawValue) triggered"
			if let name = shortcutItem.userInfo?["Name"] {
				message += " for \(name)"
			}
			let alertController = UIAlertController(title: "Quick Action", message: message, preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
			vc.present(alertController, animated: true, completion: nil)
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
	
	class func dynamicActions() -> [UIApplicationShortcutItem] {
		let actions = [
			UIApplicationShortcutItem(type: "Favourites",
									  localizedTitle: "Kenan",
									  localizedSubtitle: "iOS Developer",
									  icon: UIApplicationShortcutIcon(type: .contact),
									  userInfo: ["Name": "Kenan" as NSSecureCoding])
		]
		return actions
	}
}
