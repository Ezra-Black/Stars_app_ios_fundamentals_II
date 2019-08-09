//
//  StarController.swift
//  Stars
//
//  Created by Joseph Rogers on 8/8/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//
//manages all of my stars
import Foundation


class StarController {
    
    private(set) var stars: [Star] = []
    init() {
        loadFromPersistentStore()
    }
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("stars.plist")
    }
    
    func listStars() -> String {
        var output = ""
        for stars in stars {
            output += "\(stars.name) is \(stars.distanceDescription). \n"
        }
        return output
    }
    
    
  
    
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        
        let star = Star(name: name, distance: distance)
        stars.append(star)
        return star
        
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        }catch {
            print("Error saving the stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
       let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        }
        catch {
            print("Error loading start data: \(error)")
        }
    }
    
}
