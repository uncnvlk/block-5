//
//  Protocol.swift
//  Composite
//
//  Created by Elizaveta Sidorenkova on 24.01.2022.
//

import Foundation
import UIKit

protocol CompositeProtocol {
    var name: UILabel? { get  }
    var count: UILabel? { get }
    
    // создать кнопку адекватно
    // var button = UIButton

    var subControllers: [UIViewController] {get }

    func addSubController(_ childController: UIViewController)

}
