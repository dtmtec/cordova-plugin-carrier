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

      String carrierName = manager.getSimOperatorName(); // VIVO
      String simOperator = manager.getSimOperator(); // 72411

      String mcc = simOperator.substring(0, Math.min(simOperator.length(), 3)); // 724
      String countryCode = manager.getSimCountryIso(); // br
      String mnc = simOperator.substring(Math.max(simOperator.length() - 2, 0)); // 11

      JSONObject result = new JSONObject();

      result.put("carrierName", carrierName);
      result.put("countryCode", countryCode);
      result.put("mcc", mcc);
      result.put("mnc", mnc);

      callbackContext.success(result);

      return true;
    } else {
      return false;
    }
  }
}
