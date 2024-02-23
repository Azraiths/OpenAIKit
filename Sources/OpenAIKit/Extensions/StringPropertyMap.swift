//
//  SwiftUIView.swift
//  
//
//  Created by Marcus Arnett on 10/10/23.
//

#if os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
import SwiftUI

internal extension [String: Property] {
    var body: [String: Any] {
        var result: [String: Any] = [:]
        for key in self.keys {
            let value = self[key]
            if let value {
                result[key] = value.body
            }
        }
        return result
    }
}
#endif

