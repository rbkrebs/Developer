// ======================== Singleton Design Pattern =========================

import Foundation

class Singleton{
    
    var nome: String?
    static let instance = Singleton()
    
    private init(){}
}


var shared =  Singleton.instance;

shared.nome = "1"
var shared2 = Singleton.instance;

shared2.nome = "2"

print(shared.nome)
print(shared2.nome)

// ======================== Strategy Design Pattern =========================


protocol StrategyProtocol{
    
    var text: String {get set};
    
    init(text : String);
    
    func printSomething() -> String;
    
}

class StrategyOne : StrategyProtocol{
    
    var text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func printSomething() -> String {
        return  "\(self.text) strategy1";
    }
    
}

class StrategyTwo : StrategyProtocol{
    
    var text: String
    
    required init(text: String) {
        self.text = text
    }
    
    func printSomething() -> String {
        return "\(self.text) strategy2"
    }
   
    
}

class ManagerStrategy {
    
    func testOfStrategy(_ strategy: StrategyProtocol){
        print(strategy.printSomething());
    }
    
}

let strategy1 = StrategyOne(text: "ola");
let strategy2 = StrategyOne(text: "oi");
let strategy3 = StrategyTwo(text: "oi");

let manager = ManagerStrategy();

manager.testOfStrategy(strategy1);
manager.testOfStrategy(strategy2);
manager.testOfStrategy(strategy3);

// https://www.youtube.com/watch?v=pxmqkzWPW6E 5:13 depende explicitamente de classes concretas

// ======================== Delegate Design Pattern =========================

/* When I don't know what pattern to use, I start by trying delegation. It's great for one-to-one relationships between objects. It's straightforward to debug, and you get more compile-time checks than other patterns.
 https://sandofsky.com/patterns/delegates-vs-observers/
 */

protocol DelegateProtocol {
    
    func delegateFunctionTrigger(_ value: String);
    
}

class BossClassDelegate{
    
    var delegate: DelegateProtocol?
    
    func triggerDelegate(){
       
        delegate?.delegateFunctionTrigger("delegate test");
        
    }
}

class InternClassDelegate: DelegateProtocol{
    
    let bossDelegate = BossClassDelegate();
    var stringValue: String?;
    
    init(){
        
        bossDelegate.delegate = self;
    }
    
    func delegateFunctionTrigger(_ value: String) {
       
        self.stringValue = value ;
    }
    
}
var intern = InternClassDelegate();
intern.bossDelegate.triggerDelegate()
print(intern.stringValue)


/* https://www.youtube.com/watch?v=L2x2Yjoe-T4&t=2s 9:50 weak porque é delegate
 https://stackoverflow.com/questions/38876606/simple-swift-delegate-in-swift-playground
Declaring delegates as weak makes sense because it prevents circular references causing delegate to never be release in memory – that's a whole different story though – check how reference counting works, then you will understand why this is a good practice.
 */


// ======================== Observer Design Pattern =========================


/*
 Notifications are ideal in one-to-many relationships, with mostly one-directional communication. Consider the iOS keyboard. Imagine if iOS used the app delegate to notify of keyboard events:
 
 https://sandofsky.com/patterns/delegates-vs-observers/
 
 https://www.youtube.com/watch?v=Kr3G9C22_-Q

 */

class ObservableClass{
    
    
    func triggerObserve(){
        
        NotificationCenter.default.post(name: Notification.Name("printText"), object: nil);
        
    }
    
}

class ListenerClass1{
    
    var observe: String?
    
    init(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(triggerText), name: Notification.Name("printText"), object: nil)
        
    }
    
    @objc func triggerText(){
        self.observe = "Observe1 test"
               
    }
    
    func getObserve() -> String?{
        return self.observe
    }
}

class ListenerClass2{
    
    var observe: String?
    
    init(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(triggerText), name: Notification.Name("printText"), object: nil)
        
    }
    
    @objc func triggerText(){
        self.observe = "Observe2 test"
               
    }
    
    func getObserve() -> String?{
        return self.observe
    }
}

let observable = ObservableClass();
let listenner1 = ListenerClass1()
let listenner2 = ListenerClass2()
print(listenner1.getObserve())
print(listenner2.getObserve())
print(listenner1.getObserve())
observable.triggerObserve()
print(listenner1.getObserve())
print(listenner2.getObserve())

// ======================== MVVM Design Pattern =========================
