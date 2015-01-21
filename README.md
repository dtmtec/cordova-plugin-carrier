# cordova-plugin-carrier #

## What is it? ##

cordova-plugin-carrier is a cordova plugin to get the device's carrier name, mcc, mnc and country code. The information comes from the device's SIM card.

## Installation ##

The plugin works on both Android and iOS platforms. To install it, go to your project dir and run this command:

```
cordova plugin add br.com.dtmtec.plugins.carrier
```

## Usage ##

On both Android and iOS, the plugin returns to the app an JSON with the following properties: carrierName, countryCode, mcc, mnc.

```
<script>
  function alertCarrier() {
   var succ = function (data) {
     alert(data['carrierName']);
     alert(data['countryCode']);
     alert(data['mcc']);
     alert(data['mnc']);
   }

   var err = function () {
     alert('Error!');
   }

   window.plugins.carrier.getCarrierInfo(succ, err)
  }

  document.addEventListener('deviceready', alertCarrier, false);
</script>
```
