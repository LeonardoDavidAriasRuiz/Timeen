//
//  HTMLServer.swift
//  Timeen
//
//  Created by Leonardo on 04/03/24.
//

import Foundation

struct HTMLServer {
    func fromHTMLToString(_ name: String) throws -> String {
        let filePath = Bundle.main.path(forResource: name, ofType: "html")!
        return try String(contentsOfFile: filePath, encoding: .utf8)
    }
}
