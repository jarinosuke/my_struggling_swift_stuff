import UIKit

var str = "Hello, playground"

let tutorialTeam = 23
let editorialTeam = 56
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

let priceInferred = 19.99
let priceExplicit: Double = 19.99

let onSalesInferred = true
let onSalesExplicit: Bool = false

let nameInferred = "Whoopie Cushion"
let nameExplicit: String = "Whoopie Cushion"

if onSalesInferred {
    println("\(nameInferred) on sale \(priceInferred)!")
} else {
    println("\(nameInferred) at regular price: \(priceInferred)!")
}




class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct;
    }
    
    func printPossibleTips() {
        println("15% \(calcTipWithTipPct(0.15))")
        println("18% \(calcTipWithTipPct(0.18))")
        println("20% \(calcTipWithTipPct(0.20))")
    }
    
//    let possibleTipsInferred = [0.15, 0.18, 0.20]
//    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
//    
//    for possibleTip in possibleTipsInferred {
//    println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
//    }
    
    func returnPossibleTips () -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retval = Dictionary <Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}


let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()
