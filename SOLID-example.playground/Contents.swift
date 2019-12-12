import UIKit

///SOLID
/*
1.-Single responsability principle
2.- Open/Closed principle
3.- Liskov substitution principle
4.- Interface segregation principle
5.- Dependency inversion principle
*/

///Decoupling airConditioner's responsaibilites into three separate interfaces.
protocol SwitchOption{
    func turnOn()
    func turnOff()
}
protocol ModeOption{
    func changeMode()
}
protocol FanSpeedOption{
    func controlWindSpeed()
}
///One solution is to maintain this separation of concern for the AirConditionerOld class to delegate the swithOption, ModeOption and FanSpeedOption
class Switch : SwitchOption{
    func turnOn(){
        print("Turn on")
    }
    func turnOff() {
        print("Turn off")
    }
}
class Mode: ModeOption{
    func changeMode() {
        print("Mode changed")
    }
}
class FanSpeed : FanSpeedOption{
    func controlWindSpeed() {
        print("Fan Speed changed")
    }
}

class AirConditionedNew: SwitchOption, ModeOption, FanSpeedOption{
    let modeController = Mode()
    let fanspeedController = FanSpeed()
    let switchController = Switch()
    
    func turnOn() {
        switchController.turnOn()
    }
    func turnOff() {
        switchController.turnOff()
    }
    func changeMode() {
        modeController.changeMode()
    }
    func controlWindSpeed() {
        fanspeedController.controlWindSpeed()
    }
}
///new feature Humidity
protocol Humidable{
    func changeHumidity(_ value: Int)
}
class HumidityController: Humidable {
    func changeHumidity(_ value: Int){
        print("You have changed airhumidity to \(value)")
    }
}
extension AirConditionedNew:Humidable{
    func changeHumidity(_ value: Int){
        let humidController = HumidityController()
        humidController.changeHumidity(value)
    }
}
let acNew = AirConditionedNew()
acNew.changeHumidity(10)

protocol Cost{
    func price() -> Int
}

protocol ACFeature: SwitchOption, ModeOption, FanSpeedOption, Cost{
    
}

class FullPriceAirConditioner: ACFeature{
    let modeController = Mode()
    let fanspeedController = FanSpeed()
    let switchController = Switch()
    func price() -> Int {
        print("FullPriceAirConditioner price = 1000")
        return 1000
    }
    func turnOn() {
           switchController.turnOn()
       }
       func turnOff() {
           switchController.turnOff()
       }
       func changeMode() {
           modeController.changeMode()
       }
       func controlWindSpeed() {
           fanspeedController.controlWindSpeed()
       }
}

class DiscountedAirConditioner: ACFeature{
    let acProduct : FullPriceAirConditioner
    init(_ ac: FullPriceAirConditioner) {
        self.acProduct=ac
    }
    func turnOn() {
        acProduct.turnOn()
    }
    func turnOff() {
        acProduct.turnOff()
    }
    func changeMode() {
        acProduct.changeMode()
    }
    func controlWindSpeed() {
        acProduct.controlWindSpeed()
    }
    func price() -> Int {
        print("DiscountedAirConditioner price \(Int(Float(acProduct.price()) * 0.75))")
        return Int(Float(acProduct.price()) * 0.75)
    }
}
let fullPriceProduct = FullPriceAirConditioner()
let discountedProdct : ACFeature = DiscountedAirConditioner(fullPriceProduct)
discountedProdct.price()


///Interface seggregation principle
protocol NewACFeature: ACFeature{
    func getCentralizedAirConditionerCount() -> Int
}
class CentralizedAC: NewACFeature{
    func getCentralizedAirConditionerCount() -> Int {return 100}
    
    func turnOn() {}
    
    func turnOff() {}
    
    func changeMode() {}
    
    func controlWindSpeed() {}
    
    func price() -> Int {return 10}
    
    //I can implement all function of full price air conditioner as well as getCentralizedAirConditionerCount
}
class SplitAC: NewACFeature{
    //It does not have multiple ac's so implementing NewACFeauture  protocol violates interface seggregation principle 
}
