//
//  Main.swift
//  MKHStateTst
//
//  Created by Maxim Khatskevich on 12/25/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import XCTest

import XCEState

//===

class Main: XCTestCase
{
    let aView = MyView()
    
    var ctrl: StateCtrl<MyView>!
    
    //===
    
    func testApplyDirectlyToView()
    {
        let ex = expectation(description: "After All States Apply")
        
        //===
        
        aView
            .become{ $0.highlighted(.blue) }
            .instantly()
        
        //===
        
        aView
            .become{ $0.disabled() }
            .via(MyView.shortAnimation) { if $0 { ex.fulfill() } }
        
        //===
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testExample()
    {
        let ex2 = expectation(description: "Second state applied")
        let ex3 = expectation(description: "Third state applied")
        
        //===
        
        ctrl = StateCtrl(for: aView, MyView.shortAnimation)
        
        //===
        
        ctrl
            .apply { $0.highlighted(.blue) }
            .instantly()
        
        //===
        
        XCTAssert(ctrl.isReadyForTransition)
        
        //===
        
        ctrl
            .apply { $0.disabled() }
            .viaTransition { if $0 { ex2.fulfill() } }
        
            .apply { $0.normal(0.6) }
            .via(MyView.shortAnimation) { if $0 { ex3.fulfill() } }
        
        //===
        
        XCTAssert(!ctrl.isReadyForTransition)
        
        //===
        
        waitForExpectations(timeout: 1.5)
    }
}
