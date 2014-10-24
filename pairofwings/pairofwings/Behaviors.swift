//
//  Behaviors.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit

public protocol ViewControllerBehaviorProtocol : Equatable {
	
	unowned var viewController : UIViewController { get set }
	
	func viewDidLoad()
	
	func viewWillAppear(animated: Bool)
	func viewDidAppear(animated: Bool)
	func viewWillDisappear(animated: Bool)
	func viewDidDisappear(animated: Bool)
	
	func didReceiveMemoryWarning()

	func viewWillLayoutSubviews()
	func viewDidLayoutSubviews()

    func performSegueWithIdentifier(identifier: String?, sender: AnyObject?)
	func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)

    func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool
    func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController?

    func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue?

	func willMoveToParentViewController(parent: UIViewController?)
	func didMoveToParentViewController(parent: UIViewController?)
}

public class ViewControllerBehavior : ViewControllerBehaviorProtocol {
	public var viewController : UIViewController
	
	public init(viewController : UIViewController) {
		self.viewController = viewController
	}
	
	public func viewDidLoad() {}
	
	public func viewWillAppear(animated: Bool) {}
	public func viewDidAppear(animated: Bool) {}
	public func viewWillDisappear(animated: Bool) {}
	public func viewDidDisappear(animated: Bool) {}

	public func didReceiveMemoryWarning() {}

	public func viewWillLayoutSubviews() {}
	public func viewDidLayoutSubviews() {}

    public func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {}
	public func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool { return true }
    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {}

    public func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool { return true }
    public func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController? { return nil }

    public func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? { return nil }

	public func willMoveToParentViewController(parent: UIViewController?) {}
	public func didMoveToParentViewController(parent: UIViewController?) {}
}

public func ==(lhs: ViewControllerBehavior, rhs: ViewControllerBehavior) -> Bool {
	return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}


