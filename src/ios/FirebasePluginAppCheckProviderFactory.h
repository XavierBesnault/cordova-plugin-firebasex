#ifndef FirebasePluginAppCheckProviderFactory_h
#define FirebasePluginAppCheckProviderFactory_h


@interface FirebasePluginAppCheckProviderFactory : NSObject <FIRAppCheckProviderFactory>

- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app;

#endif

@end
