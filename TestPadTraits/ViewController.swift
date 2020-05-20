//
//  ViewController.swift
//  TestPadTraits
//
//  Created by Vladimir Inozemtsev on 19.05.2020.
//  Copyright © 2020 Vladimir Inozemtsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("$ viewDidLayoutSubviews size = \(view.bounds.size) traits = \(traitCollection.text)")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        print("$ viewWillTransition newSize = \(size) currentSize = \(view.bounds.size) traits = \(traitCollection.text)")
        
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            print("$ viewWillTransitionToSize animation in progress traits = \(self.traitCollection.text)")
        }, completion: { context in
            print("$ viewWillTransitionToSize animation finished")
        })
    }

    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator) {
        
        print("$ viewWillTransitionToCollection newTraits = \(newCollection.text) currentTraits = \(traitCollection.text) size = \(view.bounds.size)")
        
        super.willTransition(to: newCollection, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            print("$ viewWillTransitionToCollection animation in progress")
        }, completion: { _ in
            print("$ viewWillTransitionToCollection animation finished")
        })
    }
}

extension UITraitCollection {
    
    var text: String {
        let horizontalDescription: String
        let verticalDescription: String
        
        switch self.horizontalSizeClass {
        case .compact:
            horizontalDescription = "wC"
        default:
            horizontalDescription = "wR"
        }
        
        switch self.verticalSizeClass {
        case .compact:
            verticalDescription = "hC"
        default:
            verticalDescription = "hR"
        }
        
        return "\(horizontalDescription) \(verticalDescription)"
    }
}
