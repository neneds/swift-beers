//
//  ProjectUtils.swift
//  sis-mobile-ios-smb
//
//  Created by Dennis Merli on 4/10/19.
//  Copyright © 2019 AIS Digital. All rights reserved.
//

import Foundation

class ProjectUtils {
    
    /// Check if is running Unit tests
    class func isRunningUnitTests() -> Bool {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            return true
        } else {
            return false
        }
    }
    
    /// Check if is running UI tests
    class func isRunningUITests() -> Bool {
        if CommandLine.arguments.contains("--uitesting") {
            return true
        } else {
            return false
        }
    }
    
    /// Check if is running Unit or UI Tests
    class func isRunningTests() -> Bool {
        return isRunningUITests() || isRunningUnitTests()
    }
}
