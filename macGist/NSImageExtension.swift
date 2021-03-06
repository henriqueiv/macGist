//
//  NSImageExtension.swift
//  macGist
//
//  Created by Fernando Bunn on 16/01/2018.
//  Copyright © 2018 Fernando Bunn. All rights reserved.
//

import Cocoa

extension NSImage {
    func tinting(with tintColor: NSColor) -> NSImage {
        guard let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return self }
        
        return NSImage(size: size, flipped: false) { bounds in
            guard let context = NSGraphicsContext.current?.cgContext else { return false }
            tintColor.set()
            context.clip(to: bounds, mask: cgImage)
            context.fill(bounds)
            return true
        }
    }
}
