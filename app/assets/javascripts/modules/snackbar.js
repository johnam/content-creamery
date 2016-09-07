$(window).load(function () {
  'use strict';

  var snackbarData = $('#Devise-Snackbar').data();

  if(snackbarData.alert || snackbarData.notice) {
    var snackbarContainer = document.querySelector('#Devise-Snackbar');

    var data = {
      message: snackbarData.alert + ' ' + snackbarData.notice,
      timeout: 20000
    }

    snackbarContainer.MaterialSnackbar.showSnackbar(data);
  }

});