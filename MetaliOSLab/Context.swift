//
//  Context.swift
//  
//
//  Created by Xiaojun Wang on 10/14/23.
//

import Metal

class CContext {
  static let global = CContext()
  
  var device: MTLDevice
  var library: MTLLibrary
  var commandQueue: MTLCommandQueue
  
  // List of pipelines, identified by their name in shader code.
  var pipelines: [String: MTLComputePipelineState] = [:]
  
  init() { //Don't need to explicit call this function
    print("Init Context...")
      
    //Step 1: device
    self.device = MTLCreateSystemDefaultDevice()!
      
    //Step 2: command queue
    self.commandQueue = device.makeCommandQueue()!
    
      //Step 3.1: loal all function to a single library
      self.library = device.makeDefaultLibrary()!
      //Xcode compiles all the Metal source files (ending in .metal) in an Xcode project into a single default library
      //You need have at least one .metal file in your app target's Compile Sources build phase
        
      //Step 4.1: make a dummy pipeline in int
      self.pipelines["dummy"] = nil
      
    print("Init Context Done.")
  }
    
    func CreatePipeline(functionName : String){
        //Step 3.2: compile kernel function from library
        let function = self.library.makeFunction(name: functionName)!
          
        //Step 4.2: make pipeline with kernel function
        //let pipeline = try! device.makeComputePipelineState(function: function)
        let desc = MTLComputePipelineDescriptor()
        desc.computeFunction = function
        desc.maxCallStackDepth = 5 //default: 1
        let pipeline = try! device.makeComputePipelineState(descriptor: desc, options: [], reflection: nil)
        self.pipelines[functionName] = pipeline
    }
 
}
