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
 
 https://www.youtube.com/watch?v=srqiDnLEocA

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

// ======================== MVVM =========================


/* https://www.youtube.com/watch?v=n06RE9A_8Ks
 https://www.youtube.com/watch?v=nWSHWWV8Nas
 https://www.youtube.com/watch?v=qzXJckVxE4w&list=RDCMUCnksRRifsSCGUZpQukUKAyg&start_radio=1
 https://www.youtube.com/watch?v=qzXJckVxE4w&t=981s
 
 */


// ======================== Builder Design Pattern =========================


/* https://www.donnywals.com/understanding-swifts-optionset/
 https://www.youtube.com/watch?v=Wgz1zFXXywc
 
 */

struct MalaViagem {
    
    private let roupasFrios: [String] = []
    private let roupasCalor: [String] = []
    
}

class MalaViagemBuilder {
    
    
    
    func addRoupaFrio(_ roupa : String){
        
        
        
    }
    
}



// ======================== View coding =========================

/* https://www.youtube.com/watch?v=bXF6KMJFwSE */





// ======================== Data Structures =========================
// The Swift Arcade Data Structure and Algorithms Bootcamp

func solution (A: [Int], K: Int) -> [Int]{
    
    if A.isEmpty || K < 0 {
        return A
    }
    var result = A
    
    for _ in 1...K{ //O(nˆ2)
    
        result = reverse(array: result);
        
    }
    
    return result
    
}


func reverse(array:[Int]) -> [Int]{
    
    var result = Array<Int>(repeating: 0, count: array.count)
    
    for i in 0..<array.count - 1{
        result[i + 1] = array[i]
    }
    
    result[0] = array.last!
    
    return result
}

print(solution(A: [1, 2, 3, 4, 5], K: 1)) // [5,1,2,3,4]
print(solution(A: [1, 2, 3, 4, 5], K: 2) )// [4,5,1,2,3]
print(solution(A: [1, 2, 3, 4, 5], K: 3) )// [3,4,5,1,2]
print(solution(A: [1,2], K: 2) )// [3,4,5,1,2]



//==================

func solution(_ S : String) -> String {
    
    
    return ""
}

print(solution("123456789")) // 123-456-789
print(solution("555372654")) // 555-372-654
print(solution("123456789")) // 123-456-789




