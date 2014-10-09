/********* Echo.m Cordova Plugin Implementation *******/

#import "Carrier.h"
#import <Cordova/CDV.h>

@implementation Carrier

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command
{
   CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
   CTCarrier *carrier = [netinfo subscriberCellularProvider];

   NSString *carrierNameResult = [carrier carrierName];
   NSString *carrierCodeResult = [carrier isoCountryCode];

   NSString *middleResult = [carrierNameResult stringByAppendingString:@","];
   NSString *finalResult  = [middleResult stringByAppendingString:carrierCodeResult];

   CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:finalResult];

  /* if (echo != nil && [echo length] > 0) { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_ok messageasstring:echo]; */
  /* } else { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_error]; */
  /* } */

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
