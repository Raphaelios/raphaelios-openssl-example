#import "RAPHAppDelegate.h"

#include <openssl/sha.h>

/* Calculate a simple SHA512 digest */
void openssl_simple_sha512_test()
{
    char *something = "Hello, world!\n";
    
    unsigned char c[SHA512_DIGEST_LENGTH];
    SHA512_CTX shaCtx;
    
    SHA512_Init(&shaCtx);
    SHA512_Update(&shaCtx, something, strlen(something));
    SHA512_Final(c, &shaCtx);
    
    for(int i = 0; i < SHA512_DIGEST_LENGTH; i++) {
        printf("%02x", c[i]);
    }
}

@implementation RAPHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    /* Test a simple function from the openssl library */
    openssl_simple_sha512_test();
    
    return YES;
}

@end
