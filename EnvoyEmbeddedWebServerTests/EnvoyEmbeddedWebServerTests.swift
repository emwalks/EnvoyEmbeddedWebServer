//
//  EnvoyEmbeddedWebServerTests.swift
//  EnvoyEmbeddedWebServerTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 28/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest
@testable import EnvoyEmbeddedWebServer
import Embassy
import EnvoyAmbassador

class EnvoyEmbeddedWebServerTests: XCTestCase {
    
    func testASimpeServer(){
        
        let simpleServer = SimpleServer()
        simpleServer.runAFruitDataServer()
    }
    
}
