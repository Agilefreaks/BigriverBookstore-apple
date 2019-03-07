//
import Cocoa
//  MainNavigationViewController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 07/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
import Foundation

class MainNavigationViewController: NSViewController {
    @IBOutlet var previousButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(children.count)
    }
    
    @IBAction func goBackInNavigationStack(_ sender: Any) {
        if self.children.count >= 2 {
            let index = self.children.count - 1
            self.transition(from: self.children[index], to: self.children[index - 1], options: .slideRight, completionHandler: {
                _ = self.children.popLast()
                self.previousButton.isEnabled = self.children.count > 1
            })
        }
    }
    
    func pushNewControllerInNavigationStack(from oldController: NSViewController, to newController: NSViewController) {
        self.addChild(newController)
        self.transition(from: oldController, to: newController, options: .slideLeft, completionHandler: {})
        self.previousButton.animator().isEnabled = true
    }
}
