$(document).ready(function() {

  $.fn.select2.defaults.set( "theme", "bootstrap" );

  if ($('#topic-placeholder').length > 0) {
    $('#topic-placeholder').select2();
  }
});
