//
//  LicensePlistPlugin.swift
//  
//  Created by ST22956 on 2022/11/21.
//

import PackagePlugin
import Foundation

@main
struct LicensePlistPlugin: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        
    }
}


import XcodeProjectPlugin

extension LicensePlistPlugin: XcodeCommandPlugin {
    func performCommand(context: XcodePluginContext, arguments: [String]) throws {
        let path = context.xcodeProject.directory.appending("hello.txt")
        let data = "hello".data(using: .utf8)
        FileManager.default.createFile(atPath: path.string, contents: data)
        print("hello command plugin!")
    }
}
