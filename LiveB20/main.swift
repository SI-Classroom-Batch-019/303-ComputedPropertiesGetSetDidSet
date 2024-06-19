//
//  main.swift
//  LiveB20
//
//  Created by Marianne Leal on 19.06.24.
//

import Foundation

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

struct Dog {
    var name: String
    var age: Int
}

let dog1: Dog = Dog(name: "Bello", age: 3)
let human1: Human = Human(age: 20, name: "Max Mustermann", dog: dog1)

// wir koennen auch einen Hund frisch bei der Instanziierung von human2 instanziieren, er existiert dann nur in relation zu human2
let human2: Human = Human(age: 22, name: "Marianne Mustermann", dog: Dog(name: "Mimi", age: 5), country: "Portugal")

// Wie greife ich auf Properties einer Instanz zu?
print("\(human1.age), \(human1.dog.age)") // 20, 3
// print(human1.beschreibung()) (geschieht jetzt im Initializer block)



print("---Rechteck-Beispiel--")


struct Rechteck {
    var breite: Double {
        // reagiert auf änderungen, wird ausgeführt, nachdem ein Wert neu gesetzt wurde. in diesem Fall breite.
        // geht nicht in Kombination mit expliziten getter und setter
        didSet {
            print("Breite wurde aktualisiert: \(breite) Neue Fläche: \(flaeche).")
            // hier koennte wieder theoretisch weitere logik stattfinden...
        }
        
    }

    var hoehe: Double
    
    // Computed Property: berechnete Eigenschaft, die erst zur Laufzeit/ beim Zugriff darauf berechnet wird
    //var flaeche: Double = breite * hoehe // funktoiniert NICHT, wir brauchen folgende Syntax:
    var flaeche: Double {
        // expliziter getter:
        get {
           // print("Flaeche wird berechnet...")
            return breite * hoehe // hier kann auch ein funktionsaufruf stehen, alternativ: return calcFlaeche()
        }
        // expliziter setter: mache ich, wenn ich beim setten zusätzliche logik haben moechte
        // set(name der neu gesetteten Variable) statt einfach newValue zu benutzen, das automatisch mitkommen wuerde
        set(neueFlaeche) {
            // mit selbst gesetzter flaeche passen breite und hoehe nicht mehr, die rechnung geht nicht mehr auf
            // deshalb: hier mit zusatz logik dafuer sorgen, dass die hoehe sich anpasst
            
            
            // Validierung: flaeche darf nicht negativ oder 0 sein, nur dann klappt der set
            if (neueFlaeche > 0) {
                print("Die Flaeche wurde zu \(neueFlaeche) geändert. Die Breite wird automatisch angepasst...")
                breite = neueFlaeche / hoehe
                print("Neue Breite: \(breite)")
                // alternativ: breite = newValue / hoehe
            } else {
                print("\(neueFlaeche) ist negativ oder 0. Das geht nicht. versuch's nochmal... Breite bleibt gleich bei \(breite)")
            }
        }
    }
    
    func calcFlaeche() -> Double {
        return breite * hoehe
    }
    
    
// Wir muessen den Initializer nicht selber schreiben, wenn wir darin keine weitere Logik haben moechten, die immer beim Erstellen einer Instanz stattfinden soll. Der ist implizit immer dabei. Sähe hier so aus:
//    init(breite: Double, hoehe: Double) {
//        self.breite = breite
//        self.hoehe = hoehe
//    }
//    
    
    
}

var rechteck: Rechteck = Rechteck(breite: 5, hoehe: 2)
print("Flaeche des Rechtecks: \(rechteck.flaeche)")
print("Breite vorher: \(rechteck.breite)")

// getter benutzen:
// get = ich kriege einen wert
print(rechteck.flaeche)

// setter benutzen:
// set = ich setze einen wert
rechteck.breite = 6.0
// print("Breite nachher: \(rechteck.breite)") brauchen wir nicht mehr, Hinweis wird in didSet gedruckt

// wert hinter dem = wird im setter automatisch als 'newValue' erkannt, newValue kann im setter benutzt werden
rechteck.flaeche = -9.0

print("Breite, nachdem die Flaeche veraendert wurde: \(rechteck.breite)")



// FUNKTIONEN: UNTERSCHIED RETURN / KEIN RETURN
print("---Funktionen Wiederholung: return vs kein return---")

// func mit return: 
// gibt den String nach "außen", er kann in eine Variable gespeichert und weiterverwendet werden
func beispiel1() -> String {
    return "Dies ist das Ergebnis von Beispiel 1"
    
}

// func ohne return:
// keine Chance, an den String "Dies ist das Ergebnis von Beispiel 1" ranzukommen. Er wird lediglich ausgedruckt, aber innerhalb des Programms kommen wir nicht ran.
// kein return, es wird nur gedruckt
func beispiel2() {
    print("Dies ist das Ergebnis von Beispiel 2")
}

var string = beispiel1() // in string steht jetzt "Dies ist das Ergebnis von Beispiel 1"
var string2 = beispiel2() // der Aufruf von beispiel2() druckt ""Dies ist das Ergebnis von Beispiel 2". Aber in string2 steht jetzt (), quasi nichts, weil nichts aus der Funktion rauskommt
print("-----")
print(string) // druckt "Dies ist das Ergebnis von Beispiel 1"
print(string2) // druckt ()


print("-----")
beispiel1() // nichts passiert
beispiel2() // druckt ""Dies ist das Ergebnis von Beispiel 2"

print(beispiel1()) // druckt "Dies ist das Ergebnis von Beispiel 1"
