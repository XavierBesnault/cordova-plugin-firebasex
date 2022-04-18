#import <Foundation/Foundation.h>
@import FirebaseAppCheck;
@import FirebaseCore;

@interface FirebasePluginAppCheckProviderFactory : NSObject <FIRAppCheckProviderFactory>
@end

@implementation FirebasePluginAppCheckProviderFactory

- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app {
    #if TARGET_OS_SIMULATOR
        FIRAppCheckDebugProvider *provider = [[FIRAppCheckDebugProvider alloc] initWithApp:app];
        // App Attest is not available on simulators.
        NSLog(@"Firebase App Check debug token: %@", [provider localDebugToken]);

        return provider;
    #else
        // Use App Attest provider on real devices.
        if (@available(iOS 14.0, *)) {
            return [[FIRAppAttestProvider alloc] initWithApp:app];
        } else {
            return [[FIRDeviceCheckProvider alloc] initWithApp:app];
        }
    #endif
}

@end
