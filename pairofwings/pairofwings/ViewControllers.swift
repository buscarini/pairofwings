//
//  ViewControllers.swift
//  pairofwings
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/10/14.
//  Copyright (c) 2014 José Manuel Sánchez. All rights reserved.
//

import UIKit

public class ViewController<Behavior:ViewControllerBehaviorProtocol> : UIViewController {

	public required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	private var behaviors: [Behavior] = []
	
	public func addBehavior(behavior: Behavior) {
		behaviors.append(behavior)
	}

	public func removeBehavior(behavior: Behavior) {
		behaviors.remove(behavior)
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		
		for behavior in behaviors {
			behavior.viewDidLoad()
		}
	}
	
	public override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		for behavior in behaviors {
			behavior.viewWillAppear(animated)
		}
	}
	public override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		for behavior in behaviors {
			behavior.viewDidAppear(animated)
		}
	}
	public override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		
		for behavior in behaviors {
			behavior.viewWillDisappear(animated)
		}
	}
	public override func viewDidDisappear(animated: Bool) {
		super.viewDidDisappear(animated)
		
		for behavior in behaviors {
			behavior.viewDidDisappear(animated)
		}
	}

	public override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
		for behavior in behaviors {
			behavior.didReceiveMemoryWarning()
		}
	}

	public override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		for behavior in behaviors {
			behavior.viewWillLayoutSubviews()
		}
	}
	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		for behavior in behaviors {
			behavior.viewDidLayoutSubviews()
		}
	}

    public override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
		super.performSegueWithIdentifier(identifier,sender: sender)
		
		for behavior in behaviors {
			behavior.performSegueWithIdentifier(identifier,sender: sender)
		}
	}
	public override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
		super.shouldPerformSegueWithIdentifier(identifier,sender: sender)
		
		for behavior in behaviors {
			if !behavior.shouldPerformSegueWithIdentifier(identifier,sender: sender) {
				return false
			}
		}
	
		return true
	}
	
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		super.prepareForSegue(segue,sender: sender)
		
		for behavior in behaviors {
			behavior.prepareForSegue(segue,sender: sender)
		}
	}

    public override func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool {
		let result = super.canPerformUnwindSegueAction(action,fromViewController: fromViewController,withSender: sender)
		
		for behavior in behaviors {
			if !behavior.canPerformUnwindSegueAction(action,fromViewController:fromViewController,withSender: sender) {
				return false
			}
		}
	
		return result
	 }
	 
    public override func viewControllerForUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject?) -> UIViewController? {
		let result = super.viewControllerForUnwindSegueAction(action,fromViewController: fromViewController,withSender: sender)
		
		for behavior in behaviors {
			if let viewController = behavior.viewControllerForUnwindSegueAction(action,fromViewController: fromViewController,withSender: sender) {
				return viewController
			}
		}
		
		return result
	}

    public override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
		let segue = super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
		
		for behavior in behaviors {
			if let segue = behavior.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier) {
				return segue
			}
		}

		return segue
	 }

	public override func willMoveToParentViewController(parent: UIViewController?) {
		super.willMoveToParentViewController(parent)
		
		for behavior in behaviors {
			behavior.willMoveToParentViewController(parent)
		}
	}
	public override func didMoveToParentViewController(parent: UIViewController?) {
		super.didMoveToParentViewController(parent)
		
		for behavior in behaviors {
			behavior.didMoveToParentViewController(parent)
		}
	}
}
