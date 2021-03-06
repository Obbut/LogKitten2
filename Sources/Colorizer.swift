//
//  Colorizer.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

public enum AnsiColor : String {
    case black = "\u{1b}[0;30m"
    case red = "\u{1b}[0;31m"
    case green = "\u{1b}[0;32m"
    case brown = "\u{1b}[0;33m"
    case blue = "\u{1b}[0;34m"
    case purple = "\u{1b}[0;35m"
    case cyan = "\u{1b}[0;36m"
    case lightGray = "\u{1b}[0;37m"
    case darkGray = "\u{1b}[1;30m"
    case lightRed = "\u{1b}[1;31m"
    case lightGreen = "\u{1b}[1;32m"
    case yellow = "\u{1b}[1;33m"
    case lightBlue = "\u{1b}[1;34m"
    case magenta = "\u{1b}[1;35m"
    case lightCyan = "\u{1b}[1;36m"
    case white = "\u{1b}[1;37m"
    
    case reset = "\u{1b}[0m"
}

public class Colorizer : PlaintextTransformer {
    
    public init() {}
    
    public var colors: [Level : AnsiColor] = [
        .verbose: .darkGray,
        .debug: .purple,
        .info: .cyan,
        .success: .green,
        .warning: .yellow,
        .error: .red,
        .fatal: .lightRed
    ]
    
    public func transform(_ input: String, context: Message) -> String {
        guard let color = colors[context.level] else {
            return input
        }
        
        return color.rawValue + input + AnsiColor.reset.rawValue
    }
    
}
