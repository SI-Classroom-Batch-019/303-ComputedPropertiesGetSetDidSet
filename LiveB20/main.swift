//
//  main.swift
//  LiveB20
//
//  Created by Marianne Leal on 19.06.24.
//

import Foundation

// MAIN: NUR HIER duerfen funktionsaufrufe stattfinden! also print() etc

let dog1: Dog = Dog(name: "Bello", age: 3)
let human1: Human = Human(age: 20, name: "Max Mustermann", dog: dog1)
dog1.bla()

// wir koennen auch einen Hund frisch bei der Instanziierung von human2 instanziieren, er existiert dann nur in relation zu human2
let human2: Human = Human(age: 22, name: "Marianne Mustermann", dog: Dog(name: "Mimi", age: 5), country: "Portugal")

// Wie greife ich auf Properties einer Instanz zu?
print("\(human1.age), \(human1.dog.age)") // 20, 3
// print(human1.beschreibung()) (geschieht jetzt im Initializer block)



print("---Rechteck-Beispiel--")


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
