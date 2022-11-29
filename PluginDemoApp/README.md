# SpmDemoApp


## Usage
### add plugin for target (usually main target)

```swift
            plugins: [
                .plugin(name: "LicensePlistPlugin", package: "LicensePlist")
            ]),

```

### Run command to call plugin
 
```shell
swift package plugin license
```

## Known issue

When plugin calls `license-plist` command, license-plist inside will write some file that the plugin doesn't have permission

## How to fix it?

Check the implementation of file write permission, change it to some tmp folder that plugin can have write permission


## play with CommandTool

## play with BuildTool



## Logs

```markdown
$ swift package plugin license
Building for debugging...
Build complete! (1.39s)
================
file:///Users/ST22956/Documents/LicensePlist/PluginDemoApp/.build/arm64-apple-macosx/debug/LicensePlist
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] NetworkStorageDB:_openDBReadConnections: failed to open read connection to DB @ /Users/ST22956/Library/Caches/LicensePlist/Cache.db.  Error=14. Cause=unable to open database file
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] The read-connection to the DB=/Users/ST22956/Library/Caches/LicensePlist/Cache.db is NOT valid.  Unable to determine schema version.
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] NetworkStorageDB:_openDBWriteConnections: failed to open write connection to DB @ /Users/ST22956/Library/Caches/LicensePlist/Cache.db.  Error=14. Cause=unable to open database file
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] DEBUG: there is no SQL cache DB located at /Users/ST22956/Library/Caches/LicensePlist/Cache.db.
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] DEBUG: there is no SQL cache DB located at /Users/ST22956/Library/Caches/LicensePlist/Cache.db-shm.
2022-11-29 18:37:28.766 LicensePlist[79420:8898923] DEBUG: there is no SQL cache DB located at /Users/ST22956/Library/Caches/LicensePlist/Cache.db-wal.
LicensePlistCore/GitHubLicense.swift:33: Assertion failed: connectionError(Error Domain=NSURLErrorDomain Code=-1003 "A server with the specified hostname could not be found." UserInfo={_kCFStreamErrorCodeKey=-72000, NSUnderlyingError=0x600000866340 {Error Domain=kCFErrorDomainCFNetwork Code=-1003 "(null)" UserInfo={_NSURLErrorNWPathKey=satisfied (Path is satisfied), interface: en0, ipv4, dns, _kCFStreamErrorCodeKey=-72000, _kCFStreamErrorDomainKey=10}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <3E789962-BC46-4750-80AB-477C85303670>.<1>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <3E789962-BC46-4750-80AB-477C85303670>.<1>"
), NSLocalizedDescription=A server with the specified hostname could not be found., NSErrorFailingURLStringKey=https://api.github.com/repos/behrang/YamlSwift/license, NSErrorFailingURLKey=https://api.github.com/repos/behrang/YamlSwift/license, _kCFStreamErrorDomainKey=10})
error: docc invocation failed: NSTaskTerminationReason(rawValue: 2):5
```

