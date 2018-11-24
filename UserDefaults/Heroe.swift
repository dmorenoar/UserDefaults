//
//  Heroe.swift
//  UserDefaults
//
//  Created by dmorenoar on 24/11/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import Foundation

class Heroe : NSObject, NSSecureCoding{
    
    static var supportsSecureCoding: Bool = true
    var nombre:String
    var stats:[String:Int] = [String:Int]()
    var tipo:String
    
    init(nombre:String, stats:[String:Int], tipo:String){
        self.nombre = nombre
        self.stats = stats
        self.tipo = tipo
        
    }

    required convenience init(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObject(forKey: "nombre") as! String
        let stats = aDecoder.decodeObject(forKey: "stats") as! [String:Int]
        let tipo = aDecoder.decodeObject(forKey: "tipo") as! String
        self.init(nombre: nombre, stats: stats, tipo: tipo)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(stats, forKey: "stats")
        aCoder.encode(tipo, forKey: "tipo")
    }

    
}
