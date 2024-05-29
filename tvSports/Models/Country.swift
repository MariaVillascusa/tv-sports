//
//  Country.swift
//  tvSports
//
//  Created by Maria  Villascusa on 30/5/24.
//

import Foundation

class Country: Codable {
    private var name:String;
    private var id: Int
    private var slug:String;

    init(name: String, id: Int, slug: String) {
        self.name = name
        self.id = id
        self.slug = slug
    }
}
