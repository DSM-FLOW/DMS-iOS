// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum DesignSystemFontFamily {
  public enum NotoSansKR {
    public static let black = DesignSystemFontConvertible(name: "NotoSansKR-Black", family: "Noto Sans KR", path: "NotoSansKR-Black.otf")
    public static let bold = DesignSystemFontConvertible(name: "NotoSansKR-Bold", family: "Noto Sans KR", path: "NotoSansKR-Bold.otf")
    public static let light = DesignSystemFontConvertible(name: "NotoSansKR-Light", family: "Noto Sans KR", path: "NotoSansKR-Light.otf")
    public static let medium = DesignSystemFontConvertible(name: "NotoSansKR-Medium", family: "Noto Sans KR", path: "NotoSansKR-Medium.otf")
    public static let regular = DesignSystemFontConvertible(name: "NotoSansKR-Regular", family: "Noto Sans KR", path: "NotoSansKR-Regular.otf")
    public static let thin = DesignSystemFontConvertible(name: "NotoSansKR-Thin", family: "Noto Sans KR", path: "NotoSansKR-Thin.otf")
    public static let all: [DesignSystemFontConvertible] = [black, bold, light, medium, regular, thin]
  }
  public static let allCustomFonts: [DesignSystemFontConvertible] = [NotoSansKR.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct DesignSystemFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    #if os(macOS)
    return SwiftUI.Font.custom(font.fontName, size: font.pointSize)
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    return SwiftUI.Font(font)
    #endif
  }
  #endif

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return Bundle.module.url(forResource: path, withExtension: nil)
  }
}

public extension DesignSystemFontConvertible.Font {
  convenience init?(font: DesignSystemFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}
// swiftlint:enable all
// swiftformat:enable all
