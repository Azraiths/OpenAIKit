//
//  ContentView.swift
//  tvOS_Example
//
//  Copyright (c) 2023 MarcoDotIO
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  

import SwiftUI
import OpenAIKit

struct ContentView: View {
    @State private var image: UIImage = UIImage()
    
    var body: some View {
        VStack {
            Image(uiImage: image)
        }
        .padding()
        .task {
            do {
                let config = Configuration(
                    organization: "INSERT-ORGANIZATION-ID",
                    apiKey: "INSERT-API-KEY"
                )

                let openAi = OpenAI(config)
                let imageParam = ImageParameters(
                    prompt: "an avocado chair",
                    resolution: .small,
                    responseFormat: .base64Json
                )

                let result = try await openAi.createImage(parameters: imageParam)
                let b64Image = result.data[0].image

                self.image = try openAi.decodeBase64Image(b64Image)
            } catch {
                print("ERROR DETAILS - \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
