/********* Echo.m Cordova Plugin Implementation *******/

#import "Carrier.h"
#import <Cordova/CDV.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation Carrier

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command
{
  // NSString *carrier = @"OPERADORA BOLADONA";

   CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
   CTCarrier *carrier = [netinfo subscriberCellularProvider];

   NSString *carrierResult = [carrier carrierName];

   CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:carrierResult];

  /* if (echo != nil && [echo length] > 0) { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_ok messageasstring:echo]; */
  /* } else { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_error]; */
  /* } */

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
