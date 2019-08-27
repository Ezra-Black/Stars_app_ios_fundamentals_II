//
//  Star.swift
//  Stars
//
//  Created by Joseph Rogers on 8/8/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//
//sampling
import Foundation


struct Star: Codable {
    var name: String
    var distance: Double
    
    var distanceDescription: String {
        return "\(distance) light years away"
    }
    
}
