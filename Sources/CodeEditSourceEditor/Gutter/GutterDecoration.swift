//
//  GutterDecoration.swift
//  CodeEditSourceEditor
//
//  Created by Codex on 02/08/26.
//

import AppKit

/// Describes a simple decoration to draw in the gutter for a given line.
public struct GutterDecoration: Equatable, Sendable {
    public enum Shape: Sendable, Equatable {
        case circle
        case square
        case sfSymbol(String)
    }

    public let lineIndex: Int
    public let color: NSColor
    public let shape: Shape
    public let size: CGFloat

    public init(lineIndex: Int, color: NSColor, shape: Shape = .circle, size: CGFloat = 6) {
        self.lineIndex = lineIndex
        self.color = color
        self.shape = shape
        self.size = size
    }
}

/// Provide per-line gutter decorations.
public protocol GutterDecorationProviding: AnyObject {
    /// Return a decoration for the given zero-based line index.
    func decoration(for lineIndex: Int) -> GutterDecoration?
}

/// Optional interaction handler for gutter decorations.
public protocol GutterDecorationInteractionDelegate: AnyObject {
    /// Called when a decoration line is clicked.
    func gutterDecorationDidClick(lineIndex: Int)

    /// Called when a decoration line is clicked, providing the gutter view and line rect for popover positioning.
    func gutterDecorationDidClick(lineIndex: Int, in view: NSView, rect: CGRect)
}

extension GutterDecorationInteractionDelegate {
    public func gutterDecorationDidClick(lineIndex: Int, in view: NSView, rect: CGRect) {
        gutterDecorationDidClick(lineIndex: lineIndex)
    }
}
