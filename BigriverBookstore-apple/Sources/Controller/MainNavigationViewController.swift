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
    @IBOutlet var currenSectionTitleTextField: NSTextField!
    
    private var sectionsNames: [String] = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.previousButton.isHidden = true
        self.currenSectionTitleTextField.stringValue = ""
    }
    
    @IBAction func goBackInNavigationStack(_ sender: Any) {
        self.previousButton.animator().isHidden = children.count == 2
        _ = self.sectionsNames.popLast()
        self.currenSectionTitleTextField.animator().stringValue = self.sectionsNames.last ?? ""
        if self.children.count >= 2 {
            let index = self.children.count - 1
            self.transition(from: self.children[index], to: self.children[index - 1], options: .slideRight, completionHandler: {
                _ = self.children.popLast()
                self.previousButton.animator().isHidden = self.children.count == 1
            })
        }
    }
    
    func pushNewControllerInNavigationStack(from oldController: NSViewController, to newController: NSViewController, newSectionName: String = "") {
        self.currenSectionTitleTextField.stringValue = newSectionName
        self.sectionsNames.append(newSectionName)
        self.addChild(newController)
        self.transition(from: oldController, to: newController, options: .slideLeft, completionHandler: {})
        self.previousButton.isHidden = false
    }
}
