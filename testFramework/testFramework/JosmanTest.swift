//
//  JosmanTest.swift
//  testFramework
//
//  Created by Josman Pérez Expósito on 26/04/2024.
//

import Foundation
import RealmSwift

public let Josman = JosmanFramework.default

public class JosmanFramework {
    
    public static let `default` = JosmanFramework()
    
    // Prevent  developers from creating their own instances by making the initializer `private`.
    private init() {}
    
}

public extension JosmanFramework {
    
    /*private func getRealmConfiguration() -> Realm.Configuration {
        var config = Realm.Configuration.defaultConfiguration
        if var _fileURL = config.fileURL {
            _fileURL.deleteLastPathComponent()
            _fileURL.appendPathComponent("josman")
            _fileURL.appendPathExtension("realm")
            config.fileURL = _fileURL
        }
        return config
    }*/
    
    func test() {
        print("Hola Mundo")
    }
    
    func readFile() {
        if let path = Bundle(for: type(of: self)).path(forResource: "DeviceCGMShort", ofType: "txt") {
            do {
                let content = try String(contentsOfFile: path, encoding: .utf8)
                var lines = content.components(separatedBy: "\n")
                let total = Double(lines.count)
                let interval = total / 10
                let date = Date()
                for (index, line) in lines.enumerated() {
                    if index % Int(interval) == 0 {
                        let progress = (Double(index) / total) * 100
                        print("\(String(format: "%.2f", progress))% completed")
                    }
                    let words = line.components(separatedBy: "|")
                    parseWords(words: words)
                }
                print(Date().distance(to: date))
            } catch {
                print("Error reading file: \(error)")
            }
        } else {
            print("File not found")
        }
    }
    
    private func parseWords(words: [String]) {
        for word in words {
            print(word)
        }
    }
    
    
    
}

