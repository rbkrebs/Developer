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

extension Singleton{
    
    
    
}

