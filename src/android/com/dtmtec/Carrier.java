package com.dtmtec;

import android.app.Activity;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.telephony.TelephonyManager;

public class Carrier extends CordovaPlugin {

  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
    if (action.equals("getCarrierInfo")) {
      Context context = this.cordova.getActivity().getApplicationContext();

      TelephonyManager manager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
      String carrierName = manager.getNetworkOperatorName();
      String carrierCode = manager.getNetworkOperator();

      callbackContext.success(carrierName + "," + carrierCode);

      return true;
    } else {
      return false;
    }
  }
}
