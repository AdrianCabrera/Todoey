//
//  Category.swift
//  Todoey
//
//  Created by Adrian Cabrera on 08/09/2019.
//  Copyright © 2019 Adrian Cabrera. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
