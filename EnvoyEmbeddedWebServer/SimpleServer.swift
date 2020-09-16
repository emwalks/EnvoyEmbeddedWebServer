//
//  SimpleServer.swift
//  EnvoyEmbeddedWebServer
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 28/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//
//  Following tutorial https://envoy.engineering/embedded-web-server-for-ios-ui-testing-8ff3cef513df#.c2i5tx380

import Foundation
import Embassy
import EnvoyAmbassador

class SimpleServer {
    
    // http://[::1]:8080/api/v2/users
    func runASimpleServer() {
        let loop = try! SelectorEventLoop(selector: try! KqueueSelector())
        let router = Router()
        let server = DefaultHTTPServer(eventLoop: loop, port: 8080, app: router.app)
        
        router["/api/v2/users"] = DelayResponse(JSONResponse(handler: { _ -> Any in
            return [
                ["id": "01", "name": "john"],
                ["id": "02", "name": "tom"]
            ]
        }))
        
        // Start HTTP server to listen on the port
        try! server.start()
        
        // Run event loop
        loop.runForever()
    }
    
    // http://[::1]:8000/fruitData
    func runAFruitDataServer() {
        let loop = try! SelectorEventLoop(selector: try! KqueueSelector())
        let FRouter = Router()
        let server = DefaultHTTPServer(eventLoop: loop, port: 8000, app: FRouter.app)
        
        FRouter["/fruitData"] = DelayResponse(JSONResponse(handler: { _ -> Any in
            return [
                "fruit":[
                    ["type":"apple", "price":149, "weight":120],
                    ["type":"banana", "price":129, "weight":80],
                    ["type":"blueberry", "price":19, "weight":18],
                    ["type":"orange", "price":199, "weight":150],
                    ["type":"pear", "price":99, "weight":100],
                    ["type":"strawberry", "price":99, "weight":20],
                    ["type":"kumquat", "price":49, "weight":80],
                    ["type":"pitaya", "price":599, "weight":100],
                    ["type":"kiwi", "price":89, "weight":200]
                ]
            ]
            
        }))
        
        // Start HTTP server to listen on the port
        try! server.start()
        
        // Run event loop
        loop.runForever()
     
        
    }
    
}
