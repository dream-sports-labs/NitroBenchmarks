///
/// HybridMyModuleSpecCxx.swift
/// Sat Aug 10 2024
/// This file was generated by nitrogen. DO NOT MODIFY THIS FILE.
/// https://github.com/mrousavy/react-native-nitro
/// Copyright © 2024 Marc Rousavy @ Margelo
///

import Foundation
import NitroModules

/**
 * A class implementation that bridges HybridMyModuleSpec over to C++.
 * In C++, we cannot use Swift protocols - so we need to wrap it in a class to make it strongly defined.
 *
 * Also, some Swift types need to be bridged with special handling:
 * - Enums need to be wrapped in Structs, otherwise they cannot be accessed bi-directionally (Swift bug: https://github.com/swiftlang/swift/issues/75330)
 * - Other HybridObjects need to be wrapped/unwrapped from the Swift TCxx wrapper
 * - Throwing methods need to be wrapped with a Result<T, Error> type, as exceptions cannot be propagated to C++
 */
public final class HybridMyModuleSpecCxx {
  private(set) var implementation: HybridMyModuleSpec

  public init(_ implementation: HybridMyModuleSpec) {
    self.implementation = implementation
  }

  // HybridObject C++ part
  public var hybridContext: margelo.nitro.HybridContext {
    get {
      return self.implementation.hybridContext
    }
    set {
      self.implementation.hybridContext = newValue
    }
  }

  // Memory size of the Swift class (plus size of any other allocations)
  public var memorySize: Int {
    return self.implementation.memorySize
  }

  // Properties
  

  // Methods
  @inline(__always)
  public func addNumbers(a: Double, b: Double) -> HybridMyModuleSpecCxx_addNumbers_Result {
    do {
      let result = try self.implementation.addNumbers(a: a, b: b)
      return .value(result)
    } catch RuntimeError.error(withMessage: let message) {
      // A  `RuntimeError` was thrown.
      return .error(message: message)
    } catch {
      // Any other kind of error was thrown.
      // Due to a Swift bug, we have to copy the string here.
      let message = "\(error.localizedDescription)"
      return .error(message: message)
    }
  }
  
  @inline(__always)
  public func addStrings(a: String, b: String) -> HybridMyModuleSpecCxx_addStrings_Result {
    do {
      let result = try self.implementation.addStrings(a: a, b: b)
      return .value(result)
    } catch RuntimeError.error(withMessage: let message) {
      // A  `RuntimeError` was thrown.
      return .error(message: message)
    } catch {
      // Any other kind of error was thrown.
      // Due to a Swift bug, we have to copy the string here.
      let message = "\(error.localizedDescription)"
      return .error(message: message)
    }
  }
}
