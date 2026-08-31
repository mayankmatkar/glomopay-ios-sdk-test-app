# GlomoPay iOS SDK Test App

This is a standalone SwiftUI UI wrapper for manually testing the native GlomoPay iOS SDK. It is equivalent to the Kotlin test app and follows the Flutter test app flow. It validates the public key/order or subscription ID contract, automatically detects Standard/LRS checkout from the order API, toggles developer mode, opens the SDK's native modal `WKWebView`, and displays payment status plus bridge events.

## Local SDK setup

The Xcode project links the sibling Swift package:

```text
../glomopay-ios-sdk
```

Keep both folders next to each other under the Flutter workspace. The wrapper does not need to be added to the SDK repository.

## Run

1. Open `GlomoPayExample.xcodeproj` in Xcode.
2. Select the `GlomoPayExample` scheme.
3. Select an iOS Simulator or connected iPhone.
4. Build and run with `Cmd + R`.

The SDK package product `glomo-ios-sdk` is already configured as a local package dependency in the project. Swift source files continue to import the `GlomoPaySDK` module.
