//
//  OnboardingController.swift
//  MVP
//
//  Created by Jeremy Tay on 23/09/2017.
//  Copyright © 2017 Jeremy Tay. All rights reserved.
//

import UIKit
import Onboard

class OnboardingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateStandardOnboardingVC()
    }
    
    func onboardingCompletionHandler() {
        let loginStoryboard = UIStoryboard(name: "auth", bundle: nil)
        
        guard let targetVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginController") as? LoginController else {
            return
        }
        self.dismiss(animated: true, completion: nil)
        self.present(targetVC, animated: true)
//        self.dismiss(animated: true, completion: nil)
    }

    func generateStandardOnboardingVC() {
        
        let firstPage = OnboardingContentViewController.content(withTitle: "Step 1", body: "Pick your items", image: UIImage(named: "blue"), buttonText: "Next Step", action: {() -> Void in
            
        })
        firstPage.movesToNextViewController = true
        
        let secondPage = OnboardingContentViewController.content(withTitle: "Step 2", body: "Scan your items", image: UIImage(named: "red"), buttonText: "Next Step", action: {() -> Void in
            
        })
        secondPage.movesToNextViewController = true
        
        let thirdPage = OnboardingContentViewController.content(withTitle: "Step 3", body: "Checkout using card via our app or cash at the cashier", image: UIImage(named: ""), buttonText: "Get Started", action: {() -> Void in
            self.onboardingCompletionHandler()
        })
        
        guard let onboardingVC = OnboardingViewController(backgroundImage: UIImage(named: "bg_1"), contents: [firstPage, secondPage, thirdPage]) else { return }
        
        onboardingVC.shouldFadeTransitions = true
        onboardingVC.fadePageControlOnLastPage = true
        onboardingVC.fadeSkipButtonOnLastPage = true
        
        onboardingVC.allowSkipping = true
        onboardingVC.skipHandler = {() -> Void in
            self.onboardingCompletionHandler()
        }
        present(onboardingVC, animated: true, completion: nil)
    }
}


