//
//  Rechteck.swift
//  LiveB20
//
//  Created by Marianne Leal on 20.06.24.
//

import Foundation

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
