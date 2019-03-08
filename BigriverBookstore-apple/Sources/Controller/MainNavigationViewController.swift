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
    private var shouldHidepreviousButton: Bool {
        return children.count == 2
    }

    private var canGoBack: Bool {
        return self.children.count >= 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.previousButton.isHidden = true
        self.currenSectionTitleTextField.stringValue = ""
    }

    @IBAction func goBackInNavigationStack(_ sender: Any) {
        self.previousButton.animator().isHidden = shouldHidepreviousButton
        _ = self.sectionsNames.popLast()
        self.currenSectionTitleTextField.animator().stringValue = self.sectionsNames.last ?? ""
        if self.canGoBack {
            let index = self.children.count - 1
            let previousIndex = self.children.count - 2
            self.transition(from: self.children[index], to: self.children[previousIndex], options: .slideRight, completionHandler: {
                _ = self.children.popLast()
            })
        }
    }

    func pushNewControllerInNavigationStack(from oldController: NSViewController, to newController: NSViewController, withSectionName sectionTitle: String = "") {
        self.currenSectionTitleTextField.stringValue = sectionTitle
        self.sectionsNames.append(sectionTitle)
        self.addChild(newController)
        self.transition(from: oldController, to: newController, options: .slideLeft, completionHandler: {})
        self.previousButton.isHidden = false
    }
}
