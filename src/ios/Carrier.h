#import <Cordova/CDV.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@interface Carrier : CDVPlugin

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command;

@end
