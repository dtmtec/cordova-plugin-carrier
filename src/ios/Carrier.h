#import <Cordova/CDV.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>


@interface Carrier : CDVPlugin

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command;

@end
