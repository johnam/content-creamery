var $Ml = $Ml || {}

$UTIL = {
  exec:function (controller, action) {
    var ns = $Ml,
        action = ( action === undefined ) ? "init" : action;

    if (controller !== "" && ns[controller] && typeof ns[controller][action] == "function") {
      ns[controller][action]();
    }
  },

  init:function () {
    var body = $('body'),
        controller = body.data('controller'),
        action = body.data('action')

    $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $UTIL.exec(controller);
    $UTIL.exec(controller, action);
  }
};

$(function() {
  // show loading cover until mdl is done upgrading layout
  // in order to avoid users scrolling down then having the page
  // jump to the top after mdl layout is upgraded
  // * there should be a fix for this in mdl v2
  window.FakeLoader.init();
  window.FakeLoader.showOverlay();
  $('.mdl-layout').one('mdl-componentupgraded', function() {
    window.FakeLoader.hideOverlay();
  })

  // remember scroll position on page refresh
  // * there should be a fix for this in mdl v2
  var mainScrollArea = document.getElementsByClassName('mdl-layout__content')[0];
  var scrollTimeout;

  window.onload = function () {
    if(window.location.href == localStorage.getItem('lastUrl')) {
      mainScrollArea.scrollTop = localStorage.getItem('scrollTop');
    } else {
      localStorage.setItem('lastUrl', window.location.href);
      localStorage.setItem('scrollTop', 0);
    }
  }

  mainScrollArea.addEventListener('scroll', function() {
    clearTimeout(scrollTimeout);
    scrollTimeout = setTimeout(function() {
      localStorage.setItem('scrollTop', mainScrollArea.scrollTop);
    }, 100)
  });

  $UTIL.init();
});