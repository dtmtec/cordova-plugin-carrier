#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>

@interface Carrier : CDVPlugin

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command;

@end
