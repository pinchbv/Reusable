/*********************************************
*
* This code is under the MIT License (MIT)
*
* Copyright (c) 2019 Wesley Hilhorst
*
*********************************************/

import UIKit

// MARK: Support for instantiation from Storyboard
public extension StoryboardBased where Self: UIViewController {

	/*
	Create an instance of the ViewController from its associated Storyboard's initialViewController or based on the `sceneIdentifier`

	- returns: instance of the conforming ViewController
	*/
	static func instantiate() -> Self  {

		if let sceneBased = self as? StoryboardSceneBased.Type {

			let storyboard = sceneBased.sceneStoryboard
			let viewController = storyboard.instantiateViewController(withIdentifier: sceneBased.sceneIdentifier)

			guard let typedViewController = viewController as? Self else {
				fatalError("The viewController '\(sceneBased.sceneIdentifier)' of '\(storyboard)' is not of class '\(self)'")
			}
			return typedViewController
		} else {

			let viewController = sceneStoryboard.instantiateInitialViewController()
			guard let typedViewController = viewController as? Self else {
				fatalError("The initialViewController of '\(sceneStoryboard)' is not of class '\(self)'")
			}
			return typedViewController
		}
	}
}
