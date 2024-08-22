// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset: Sendable {
  public enum ErrorColor {
  public static let errorDarken1 = DesignSystemColors(name: "Error Darken-1")
    public static let errorDarken2 = DesignSystemColors(name: "Error Darken-2")
    public static let errorLighten1 = DesignSystemColors(name: "Error Lighten-1")
    public static let errorLighten2 = DesignSystemColors(name: "Error Lighten-2")
    public static let error = DesignSystemColors(name: "Error")
  }
  public enum GrayColor {
  public static let gray1 = DesignSystemColors(name: "Gray 1")
    public static let gray10 = DesignSystemColors(name: "Gray 10")
    public static let gray2 = DesignSystemColors(name: "Gray 2")
    public static let gray3 = DesignSystemColors(name: "Gray 3")
    public static let gray4 = DesignSystemColors(name: "Gray 4")
    public static let gray5 = DesignSystemColors(name: "Gray 5")
    public static let gray6 = DesignSystemColors(name: "Gray 6")
    public static let gray7 = DesignSystemColors(name: "Gray 7")
    public static let gray8 = DesignSystemColors(name: "Gray 8")
    public static let gray9 = DesignSystemColors(name: "Gray 9")
  }
  public enum Icons {
  public static let dmsHorizontal = DesignSystemImages(name: "DMSHorizontal")
    public static let pencil = DesignSystemImages(name: "pencil")
  }
  public enum PrimaryColor {
  public static let darken1 = DesignSystemColors(name: "Darken-1")
    public static let darken2 = DesignSystemColors(name: "Darken-2")
    public static let lighten1 = DesignSystemColors(name: "Lighten-1")
    public static let lighten2 = DesignSystemColors(name: "Lighten-2")
    public static let primary = DesignSystemColors(name: "Primary")
  }
  public enum SystemColor {
  public static let background = DesignSystemColors(name: "Background")
    public static let errorContainer = DesignSystemColors(name: "Error Container")
    public static let icon = DesignSystemColors(name: "Icon")
    public static let line = DesignSystemColors(name: "Line")
    public static let onBackgroundVariantEtc = DesignSystemColors(name: "On Background Variant Etc")
    public static let onBackgroundVariantText = DesignSystemColors(name: "On Background Variant Text")
    public static let onBackground = DesignSystemColors(name: "On Background")
    public static let onErrorContainer = DesignSystemColors(name: "On Error Container")
    public static let onError = DesignSystemColors(name: "On Error")
    public static let onPrimaryContainer = DesignSystemColors(name: "On Primary Container")
    public static let onPrimary = DesignSystemColors(name: "On Primary")
    public static let onSurfaceVariantEtc = DesignSystemColors(name: "On Surface Variant Etc")
    public static let onSurfaceVariantText = DesignSystemColors(name: "On Surface Variant Text")
    public static let onSurface = DesignSystemColors(name: "On Surface")
    public static let primaryContainer = DesignSystemColors(name: "Primary Container")
    public static let surface = DesignSystemColors(name: "Surface")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIColor: SwiftUI.Color {
      return SwiftUI.Color(asset: self)
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: DesignSystemColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct DesignSystemImages: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: DesignSystemImages) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: DesignSystemImages, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: DesignSystemImages) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
