//
//  Created by Xiaojun Wang on 10/14/23.
//

import Metal

final class CCallStackOverflow {
  func testCallStackOverflow() {
    // Allocate input buffer
    let numThreads = 1_000
    let device = CContext.global.device
    let inputBuffer = device.makeBuffer(length: numThreads * 16)!
    let inputContents = inputBuffer.contents()
      .assumingMemoryBound(to: SIMD4<Float>.self)
    
    // Initialize input buffer
    for i in 0..<numThreads {
      inputContents[i] = SIMD4<Float>(1, 2, 3, 4) + Float(i)
    }
      
      let function_name = "testCallStackOverFlow"
      CContext.global.CreatePipeline(functionName: function_name)
      
      let commandBuffer = CContext.global.commandQueue.makeCommandBuffer()!
      let encoder = commandBuffer.makeComputeCommandEncoder()!
      encoder.setComputePipelineState(CContext.global.pipelines[function_name]!)

      let flags: [UInt32] = [1, 1, 2, 3, 1, 0]
      encoder.setBytes(flags, length: flags.count * 4, index: 0)
      encoder.setBuffer(inputBuffer, offset: 0, index: 1)
      //encoder.dispatchThreads(
      //  MTLSizeMake(numThreads, 1, 1),
      //  threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
      encoder.dispatchThreadgroups(
        MTLSizeMake(numThreads, 1, 1),
        threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
      
      
      encoder.endEncoding()
      //commandBuffer.commit()
    
      /*
    Context.global.withComputeEncoder { encoder in
      let pipeline = Context.global.pipelines["testCallStackOverFlow"]!
      encoder.setComputePipelineState(pipeline)
      
      let flags: [UInt32] = [1, 1, 2, 3, 1, 0]
      encoder.setBytes(flags, length: flags.count * 4, index: 0)
      encoder.setBuffer(inputBuffer, offset: 0, index: 1)
      encoder.dispatchThreads(
        MTLSizeMake(numThreads, 1, 1),
        threadsPerThreadgroup: MTLSizeMake(1, 1, 1))
    }*/
    
    // Check input buffer
    for i in 0..<numThreads {
      let original = SIMD4<Float>(1, 2, 3, 4) + Float(i)
      let expected = original * original
      //XCTAssertEqual(inputContents[i], expected)
        print(inputContents[i])
    }
  }
}
