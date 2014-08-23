import UIKit

//Unnamed Tuples

let tipAndTotal:(Double, Double) = (4.00, 25.19)
print(tipAndTotal)
println("hello")

tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

//Named Tuples

let tipAndTotalNamed:(tipAmt:Double, total:Double) = (4.00, 25.19)
tipAndTotalNamed.tipAmt
tipAndTotalNamed.total

//Returning Tuples

let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1.0)
func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}
calcTipWithTipPct(0.20)

//Protocol

@objc protocol Speaker {
    func Speak()
    optional func TellJoke()
}

class Vicki: Speaker {
    func Speak() {
        println("Hello, I am Vicki!")
    }
    
    func TellJoke() {
        println("Q: What did Sushi A say to Sushi B?")
    }
}

class Ray: Speaker {
    func Speak() {
        println("Yo, I am Ray!")
    }
    
    func TellJoke() {
        println("Q: What did Sushi A say to Sushi B?")
    }
    
    func WriteTutorial() {
        println()
    }
}

class Animal {
    
}

class Dog: Animal, Speaker {
    func Speak() {
        println("Woof!")
    }
}

var speaker:Speaker

speaker = Ray()
speaker.Speak()

(speaker as Ray).WriteTutorial()
speaker = Vicki()
speaker.Speak()

speaker.TellJoke?()


//Delegates

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker)
}

class DateSimulator {
    let a:Speaker
    let b:Speaker
    var delegate:DateSimulatorDelegate?
    
    init(a:Speaker, b:Speaker) {
        self.a = b
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        println("Off to dinner...")
        a.Speak()
        b.Speak()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
        println("Walking back home...")
        a.TellJoke?()
        b.TellJoke?()
    }
}

class LoggingDateSimulator:DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date ended")
    }
}

let simulator = DateSimulator(a: Vicki(), b: Ray())
simulator.delegate = LoggingDateSimulator()
simulator.simulate()
