/********* Echo.m Cordova Plugin Implementation *******/

#import "Carrier.h"
#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>

@implementation Carrier

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command
{
   CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
   CTCarrier *carrier = [netinfo subscriberCellularProvider];

   NSString *carrierNameResult    = [carrier carrierName];
   NSString *carrierCountryResult = [carrier isoCountryCode];
   NSString *carrierCodeResult    = [carrier mobileCountryCode];
   NSString *carrierNetworkResult = [carrier mobileNetworkCode];

   if (!carrierNameResult)    carrierNameResult    = @"";
   if (!carrierCountryResult) carrierCountryResult = @"";
   if (!carrierCodeResult)    carrierCodeResult    = @"";
   if (!carrierNetworkResult) carrierNetworkResult = @"";

   NSDictionary *carrierData = [NSDictionary dictionaryWithObjectsAndKeys:
   carrierNameResult,@"carrierName",
   carrierCountryResult,@"countryCode",
   carrierCodeResult,@"mcc",
   carrierNetworkResult,@"mnc",
   nil];

   CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:carrierData];

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
