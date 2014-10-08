var carrier = {
  getCarrierInfo: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'Carrier', 'getCarrierInfo', []);
  }
}

cordova.addConstructor(function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.carrier = carrier;
  return window.plugins.carrier;
});
