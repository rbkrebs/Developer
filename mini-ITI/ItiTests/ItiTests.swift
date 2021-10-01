//
//  ItiTests.swift
//  ItiTests
//
//  Created by Romulo Basso Krebs on 30/09/21.
//

import XCTest

@testable import MiniIti

class ItiTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

    func criaClienteTest() {
        
        var cliente = Cliente(nome: "dsf",
                              cpf: "sdfdf",
                              telefone: "fdsf",
                              endereco: "dsf",
                              ocupacao: "sdfdsf",
                              renda: "dsfdsf",
                              senha: "dffdg")
        
        let saldo = cliente.verSaldo()
        XCTAssertEqual(saldo, "0")
    }

}
