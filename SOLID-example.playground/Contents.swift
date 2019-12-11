import UIKit

///SOLID
/*
1.-Single responsability principle
2.- Open/Closed principle
3.- Liskov substitution principle
4.- Interface segregation principle
5.- Dependency inversion principle
*/

///class AirConditionerOld violating the Single responsability because a class should have only a single responsability
///Coupled responsabilities lead to fragility in your classes. Each function represent one responsability
class AirConditionedOld{
    func turnOn(){}
    func turnOff(){}
    func changeMode(){}
    func changeFanSpeed(){}
}
