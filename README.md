# GlomoPay iOS SDK Test App

This is a standalone SwiftUI UI wrapper for manually testing the native GlomoPay iOS SDK. It is equivalent to the Kotlin test app and follows the Flutter test app flow. It validates the public key/order or subscription ID contract, automatically detects Standard/LRS checkout from the order API, opens the SDK's native modal `WKWebView`, and displays payment and journey results plus callback history.

## Local SDK setup

The Xcode project links the sibling Swift package:

```text
../glomo-ios-sdk
```

Keep both folders next to each other under the `glomo` folder. Flutter is not required. The wrapper does not need to be added to the SDK repository.

## Run

1. Open `GlomoPayExample.xcodeproj` in Xcode.
2. Select the `GlomoPayExample` scheme.
3. Select an iOS Simulator or connected iPhone.
4. Build and run with `Cmd + R`.

The SDK package product `glomo-ios-sdk` is already configured as a local package dependency in the project. Swift source files continue to import the `GlomoPaySDK` module.

The app uses the current SDK listener contract, including `onUserJourneyCompleted` for bank-transfer details submitted without a confirmed payment. SDK diagnostic events are handled by SDK analytics rather than an `onEvent` callback. Developer mode is an internal SDK build flag, not an app toggle.
