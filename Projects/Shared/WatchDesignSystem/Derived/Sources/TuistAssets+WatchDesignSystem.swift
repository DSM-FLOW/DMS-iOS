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
public enum WatchDesignSystemAsset {
  public enum ErrorColor {
  public static let errorDarken1 = WatchDesignSystemColors(name: "Error Darken-1")
    public static let errorDarken2 = WatchDesignSystemColors(name: "Error Darken-2")
    public static let errorLighten1 = WatchDesignSystemColors(name: "Error Lighten-1")
    public static let errorLighten2 = WatchDesignSystemColors(name: "Error Lighten-2")
    public static let error = WatchDesignSystemColors(name: "Error")
  }
  public enum GrayColor {
  public static let gray1 = WatchDesignSystemColors(name: "Gray 1")
    public static let gray10 = WatchDesignSystemColors(name: "Gray 10")
    public static let gray2 = WatchDesignSystemColors(name: "Gray 2")
    public static let gray3 = WatchDesignSystemColors(name: "Gray 3")
    public static let gray4 = WatchDesignSystemColors(name: "Gray 4")
    public static let gray5 = WatchDesignSystemColors(name: "Gray 5")
    public static let gray6 = WatchDesignSystemColors(name: "Gray 6")
    public static let gray7 = WatchDesignSystemColors(name: "Gray 7")
    public static let gray8 = WatchDesignSystemColors(name: "Gray 8")
    public static let gray9 = WatchDesignSystemColors(name: "Gray 9")
  }
  public enum Icons {
  public static let dmsHorizontal = WatchDesignSystemImages(name: "DMSHorizontal")
    public static let pencil = WatchDesignSystemImages(name: "pencil")
  }
  public enum PrimaryColor {
  public static let darken1 = WatchDesignSystemColors(name: "Darken-1")
    public static let darken2 = WatchDesignSystemColors(name: "Darken-2")
    public static let lighten1 = WatchDesignSystemColors(name: "Lighten-1")
    public static let lighten2 = WatchDesignSystemColors(name: "Lighten-2")
    public static let primary = WatchDesignSystemColors(name: "Primary")
  }
  public enum SystemColor {
  public static let background = WatchDesignSystemColors(name: "Background")
    public static let errorContainer = WatchDesignSystemColors(name: "Error Container")
    public static let icon = WatchDesignSystemColors(name: "Icon")
    public static let line = WatchDesignSystemColors(name: "Line")
    public static let onBackgroundVariantEtc = WatchDesignSystemColors(name: "On Background Variant Etc")
    public static let onBackgroundVariantText = WatchDesignSystemColors(name: "On Background Variant Text")
    public static let onBackground = WatchDesignSystemColors(name: "On Background")
    public static let onErrorContainer = WatchDesignSystemColors(name: "On Error Container")
    public static let onError = WatchDesignSystemColors(name: "On Error")
    public static let onPrimaryContainer = WatchDesignSystemColors(name: "On Primary Container")
    public static let onPrimary = WatchDesignSystemColors(name: "On Primary")
    public static let onSurfaceVariantEtc = WatchDesignSystemColors(name: "On Surface Variant Etc")
    public static let onSurfaceVariantText = WatchDesignSystemColors(name: "On Surface Variant Text")
    public static let onSurface = WatchDesignSystemColors(name: "On Surface")
    public static let primaryContainer = WatchDesignSystemColors(name: "Primary Container")
    public static let surface = WatchDesignSystemColors(name: "Surface")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class WatchDesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension WatchDesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: WatchDesignSystemColors) {
    let bundle = WatchDesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: WatchDesignSystemColors) {
    let bundle = WatchDesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct WatchDesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = WatchDesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
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
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension WatchDesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the WatchDesignSystemImages.image property")
  convenience init?(asset: WatchDesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = WatchDesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: WatchDesignSystemImages) {
    let bundle = WatchDesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: WatchDesignSystemImages, label: Text) {
    let bundle = WatchDesignSystemResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: WatchDesignSystemImages) {
    let bundle = WatchDesignSystemResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
