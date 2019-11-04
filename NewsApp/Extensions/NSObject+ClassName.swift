//
//  NSObject+ClassName.swift
//  NewsApp
//
//  Created by Никита Красавин on 04.11.2019.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
