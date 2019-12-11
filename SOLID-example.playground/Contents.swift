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
