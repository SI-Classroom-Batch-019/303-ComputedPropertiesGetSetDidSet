//
//  Human.swift
//  LiveB20
//
//  Created by Marianne Leal on 20.06.24.
//

import Foundation

// wir duerfen NUR IN DER MAIN Ausdruecke, also funktionsaufrufe schreiben
//print("blabla")

// Funktionen sind erlaubt, sind keine Ausdruecke.
func x(){
    print("Hallo!")
}

// Variablen sind auch erlaubt
var y = 0

// Structs sind ebenfalls erlaubt

// W3T2: Wiederholung
// Was sind Structs und wozu werden sie genutzt?
// Datengruppierung, weitere Logik/Funktionalität, Objekte modellieren

struct Human {
    
    // Wie deklariert man Properties im Struct?
    var age: Int
    var name: String
    // structs verschachteln: 1 Struct kann andere Structs als Property (Eigenschaft) haben
    var dog: Dog
    var country: String /* = "Deutschland", wenn es keinen Benutzerdefinierten Initializer gäbe */
    
    
    
    // Wie funktioniert der Initializer?
    // Benutzerdefinierter Initializer: wird ausgeführt, sobald eine Instanz erstellt wird
    // WENN es einen Benutzerdefinierten Initialiser gibt, MUESSEN Default-Werte hier in die Klammern hinein, statt direkt in die oben angelegten Properties
    init(age: Int, name: String, dog: Dog, country: String = "Deutschland") {
        self.age = age
        self.name = name
        self.dog = dog
        self.country = country
        // Initialisierungslogik, die immer ausgefuehrt wird, sobald eine Instanz erstellt wird:
        print("Neue Instanz des Structs Human erstellt!")
        print(beschreibung())
        
        // theoretisch: irgendein krasser funktionsaufruf, der zB Daten aus dem Internet lädt
    }
    
    // Func innerhalb eines Structs: nennt sich METHODE, hat Zugriff auf alle Properties (und andere Methoden)
    func beschreibung() -> String {
        return "\(name) ist \(age) Jahre alt, lebt in \(country) und hat einen Hund namens \(dog.name), der \(dog.age) Jahre alt ist."
    }
    
    // Human wird 1 Jahr älter
    // um Properties zu verändern, MÜSSEN WIR 'mutating' vor die func schreiben. ansonsten darf sie das nicht
    mutating func geburtstag() {
        
        print("\(name) hatte Geburtstag!")
        age+=1
        print("\(name) ist jetzt \(age) Jahre alt.")
    }
}

