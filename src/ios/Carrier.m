/********* Echo.m Cordova Plugin Implementation *******/

#import "Carrier.h"
#import <Cordova/CDV.h>

@implementation Carrier

- (void)getCarrierInfo:(CDVInvokedUrlCommand*)command
{
  NSString *carrier = @"OPERADORA BOLADONA";

  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:carrier];

  /* if (echo != nil && [echo length] > 0) { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_ok messageasstring:echo]; */
  /* } else { */
  /*   pluginresult = [cdvpluginresult resultwithstatus:cdvcommandstatus_error]; */
  /* } */

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
