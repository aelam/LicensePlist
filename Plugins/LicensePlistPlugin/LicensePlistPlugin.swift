//
//  LicensePlistPlugin.swift
//  
//  Created by ST22956 on 2022/11/21.
//

import PackagePlugin
import Foundation

@main
struct LicensePlistPlugin: BuildToolPlugin, CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        let executablePath = try! context.tool(named: "LicensePlist").path
        let packagePath = context.package.directory.string

        let url = URL(fileURLWithPath: executablePath.string)
        print("================")
        print(url)
        let process = try Process.run(url, arguments: [])
        process.waitUntilExit()

        // Check whether the subprocess invocation was successful.
        if process.terminationReason == .exit && process.terminationStatus == 0 {
            print("Generated documentation at 234234")
        }
        else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("docc invocation failed: \(problem)")
        }
    }
    
    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        let executablePath = try context.tool(named: "LicensePlist").path
        print("=====================================")
        print(executablePath)

        return [
            .buildCommand(
                displayName: "Generate license plist",
                executable: executablePath,
                arguments: [
                ],
                outputFiles: [
                ]
            ),
        ]
    }
    
    
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension LicensePlistPlugin: XcodeCommandPlugin, XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget) throws -> [PackagePlugin.Command] {
        let executablePath = try context.tool(named: "LicensePlist").path

        return [
            .buildCommand(
                displayName: "Generate license plist",
                executable: executablePath,
                arguments: [
                ],
                outputFiles: [
                ]
            ),
        ]
    }
    
    func performCommand(context: XcodePluginContext, arguments: [String]) throws {
        print("hello from Xcode")
        let path = context.xcodeProject.directory.appending("hello.txt")
        let data = "hello".data(using: .utf8)
        FileManager.default.createFile(atPath: path.string, contents: data)
        print("hello command plugin!")
        
        
//        let executablePath = try! context.tool(named: "LicensePlist").path
//        let url = URL(fileURLWithPath: executablePath.string)
//        let process = try Process.run(url, arguments: [])
//        process.waitUntilExit()
//
//

    }
    
    
}
#endif
