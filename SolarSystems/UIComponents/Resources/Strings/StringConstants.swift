// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Intro {
    /// Ready to Explore Our Galaxy?
    public static let firstTitle = L10n.tr("Intro", "Intro.firstTitle", fallback: "Ready to Explore Our Galaxy?")
    /// Embark on a Journey Beyond Imagination!
    public static let fourthTitle = L10n.tr("Intro", "Intro.fourthTitle", fallback: "Embark on a Journey Beyond Imagination!")
    /// Intro.strings
    ///   SolarSystems
    /// 
    ///   Created by Şehriban Yıldırım on 27.12.2023.
    public static let next = L10n.tr("Intro", "Intro.Next", fallback: "Continue!")
    /// Buckle Up for Interstellar Travel!
    public static let secondTitle = L10n.tr("Intro", "Intro.secondTitle", fallback: "Buckle Up for Interstellar Travel!")
    /// Get Started!
    public static let start = L10n.tr("Intro", "Intro.Start", fallback: "Get Started!")
    /// Unveiling the Gates to Infinite Space.
    public static let thirdTitle = L10n.tr("Intro", "Intro.thirdTitle", fallback: "Unveiling the Gates to Infinite Space.")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
