//
//  ViewController.swift
//  UserDefaults
//
//  Created by dmorenoar on 24/11/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    let heroes:[Heroe] = [
        Heroe(nombre: "Genji", stats: ["ataque" : 55, "defensa": 55], tipo: "Asesino"),
        Heroe(nombre: "Sondius", stats: ["ataque" : 22, "defensa": 15], tipo: "Especialista"),
        Heroe(nombre: "Cromi", stats: ["ataque" : 11, "defensa": 35], tipo: "Asesino"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveUserData(heroe: Heroe(nombre: "Tyrael", stats: ["ataque":33,"defensa":45], tipo: "Guerrero"))
        
        getUserData()
        
        
    }
    
    func saveUserData(heroe:Heroe){
        
        //Guardamos un dato simple de otro heroe
        defaults.set("Kael'thas", forKey: "nombre")
        defaults.set(33, forKey: "ataque")
        
        
        do {
            //Guardamos un objeto de la clase heroe
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: heroe, requiringSecureCoding: true)
            defaults.set(encodedData, forKey: "Tyrael")
            
            //Guardamos un array de objetos de la clase heroe
            let encodedDataArray: Data = try NSKeyedArchiver.archivedData(withRootObject: heroes, requiringSecureCoding: true)
            defaults.set(encodedDataArray, forKey: "ListaHeroes")
            
            
        }catch let error{
            print("Ha ocurrido un error guardando al heroe", error)
        }
    }
    
    func getUserData(){
        
        //Recuperamos el objeto simple por su key
        let nombreKhael = defaults.string(forKey: "nombre")
        let ataqueKhael = defaults.integer(forKey: "ataque")
        
        print("Nombre del heroe", nombreKhael!)
        print("Ataque del heroe", ataqueKhael)
        
       
        
        do {
            
            //Recuperamos al objeto heroe
            let decodedData = defaults.object(forKey: "Tyrael") as! Data
            let decodedHeroe = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedData) as! Heroe
        
            print("Nombre:",decodedHeroe.nombre)
            print("Ataque:",decodedHeroe.stats["ataque"]!)
            
            //Recuperamos el array de heroes
            let decodedDataArray = defaults.object(forKey: "ListaHeroes") as! Data
            let decodedDataHeroes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedDataArray) as! [Heroe]
            
            for heroe in decodedDataHeroes {
                print("Nombre:", heroe.nombre)
            }
            
            
        } catch let error {
            print("Error obteniendo al heroe", error)
        }
        
        
        
        
        
    }


}

