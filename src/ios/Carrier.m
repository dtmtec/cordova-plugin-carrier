/********* Echo.m Cordova Plugin Implementation *******/

#import "Carrier.h"
#import <Cordova/CDV.h>

@implementation Carrier

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command
{
   CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
   CTCarrier *carrier = [netinfo subscriberCellularProvider];

   /* Oi (Carrier Name) */
   NSString *carrierNameResult = [carrier carrierName];
   /* 724 (MCC) */
   NSString *carrierCodeResult = [carrier mobileCountryCode];
   /* br (ISO Country Code) */
   NSString *carrierCountryResult = [carrier isoCountryCode];
   /* 31 (MNC) */
   NSString *carrierNetworkResult = [carrier mobileNetworkCode];

   NSString *middleResultOne   = [carrierNameResult stringByAppendingString:@","];
   NSString *middleResultTwo   = [middleResultOne stringByAppendingString:carrierCodeResult];
   NSString *middleResultThree = [middleResultTwo stringByAppendingString:@","];
   NSString *middleResultFour  = [middleResultThree stringByAppendingString:carrierCountryResult];
   NSString *middleResultFive  = [middleResultFour stringByAppendingString:@","];
   NSString *finalResult       = [middleResultFive stringByAppendingString:carrierNetworkResult];

   CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:finalResult];

  /* if (echo != nil && [echo length] > 0) { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_ok messageasstring:echo]; */
  /* } else { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_error]; */
  /* } */

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
