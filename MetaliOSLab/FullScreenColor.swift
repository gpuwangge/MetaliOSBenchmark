//
//  Created by Xiaojun Wang on 10/14/23.
//

import Metal

final class CFullScreenColor {

  func testFullScreenColor() {
    // Allocate input buffer
    let device = CContext.global.device
    let inputBuffer = device.makeBuffer(length: 16)!
    let inputContents = inputBuffer.contents()
      .assumingMemoryBound(to: SIMD4<Float>.self)
    
    // Initialize input buffer
    inputContents[0] = [1, 2, 3, 4]
      
      let function_name = "testFullScreenColor"
      CContext.global.CreatePipeline(functionName: function_name)
      
      let commandBuffer = CContext.global.commandQueue.makeCommandBuffer()!
      let encoder = commandBuffer.makeComputeCommandEncoder()!
      encoder.setComputePipelineState(CContext.global.pipelines[function_name]!)

      let unusedBuffer = device.makeBuffer(length: 16)
      encoder.setBuffer(unusedBuffer, offset: 0, index: 0)
      encoder.setBuffer(inputBuffer, offset: 0, index: 1)
      //encoder.dispatchThreads(
      //  MTLSizeMake(1, 1, 1),
      //  threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
      encoder.dispatchThreadgroups(
        MTLSizeMake(1, 1, 1),
        threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
      
      
      encoder.endEncoding()
      //commandBuffer.commit()
      
      /*
    CContext.global.withComputeEncoder { encoder in
      let pipeline = CContext.global.pipelines["testFullScreenColor"]!
      encoder.setComputePipelineState(pipeline)
      
      let unusedBuffer = device.makeBuffer(length: 16)
      encoder.setBuffer(unusedBuffer, offset: 0, index: 0)
      encoder.setBuffer(inputBuffer, offset: 0, index: 1)
      encoder.dispatchThreads(
        MTLSizeMake(1, 1, 1),
        threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
    }*/
    
    // Check input buffer
    //XCTAssertEqual(inputContents[0], [1, 2, 3, 0])
      print(inputContents[0])
  }
  
}
