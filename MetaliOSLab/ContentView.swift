//
//  ContentView.swift
//  MetaliOSLab
//
//  Created by Xiaojun on 10/14/23.
//

import SwiftUI

struct ContentView: View {
    func onButtonInstructionThroughput(){
        print("===onButtonInstructionThroughput===")
        let instructionThrouput = CInstructionThroughput()
        instructionThrouput.mainFunc()
        print("======")
    }
    
    func onButtonCommandConcurrency(){
        print("===onButtonCommandConcurrency===")
        let commandConcurrency = CCommandConcurrency()
        commandConcurrency.mainFunc()
        print("======")
    }
    
    func onButtonFullScreenColor(){
        print("===onButtonFullScreenColor===")
        let fullScreenColor = CFullScreenColor()
        fullScreenColor.testFullScreenColor()
        print("======")
    }
    
    func onButtonCallStackOverflow(){
        print("===onButtonCallStackOverflow===")
        let callStackOverflow = CCallStackOverflow()
        callStackOverflow.testCallStackOverflow()
        print("======")
    }
    
    func onButtonFunctionCallOverhead(){
        print("===onButtonFunctionCallOverhead===")
        let functionCallOverhead = CFunctionCallOverhead()
        functionCallOverhead.testFunctionCallOverhead()
        print("======")
    }
    
    var body: some View {
        Text("Wangge Metal Benchmark!")
            .padding()
        
        Button{
            onButtonInstructionThroughput()
        } label:{
            Text("Instruction Throughput").padding(20)
        }
        
        Button{
            onButtonCommandConcurrency()
        } label:{
            Text("Command Concurrency").padding(20)
        }
        
        Button{
            onButtonFullScreenColor()
        } label:{
            Text("Full Screen Color").padding(20)
        }
        
        Button{
            onButtonCallStackOverflow()
        } label:{
            Text("Call Stack Overflow").padding(20)
        }
        
        Button{
            onButtonFunctionCallOverhead()
        } label:{
            Text("Function Call Overhead").padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
