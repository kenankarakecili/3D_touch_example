//
//  ViewController.swift
//  3D_touch_example
//
//  Created by kenankarakecili on 3/6/19.
//  Copyright © 2019 kenankarakecili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var vwTouch: UIView!
	@IBOutlet weak var lbPercentage: UILabel!
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		guard traitCollection.forceTouchCapability == .available else { return }
		guard vwTouch === touch.view else { return }
		let force = touch.force / touch.maximumPossibleForce
		lbPercentage.text = "\(String(format: "%.1f", force * 100))% force"
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		lbPercentage.text = "0% force"
	}
}

