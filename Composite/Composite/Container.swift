//
//  Container.swift
//  Composite
//
//  Created by Elizaveta Sidorenkova on 24.01.2022.
//

import Foundation
import UIKit

class CompositeClass: CompositeProtocol {

    var name: UILabel?
    var count: UILabel?

//    var button = UIButton

    var subControllers: [UIViewController] = []

    // конструктор
    init(nibName: String) {
        self.name!.text = nibName
        self.count!.text = "0"
        
    }


    func addSubController(_ childController: UIViewController) {
        //let childController = CompositeClass(nibName: "newVC", bundle: nil)
        self.subControllers.append(childController)
        
        // увеличение
        // self.count 
    }
}
