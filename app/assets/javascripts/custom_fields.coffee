$(document).ready ->
  $('*[data-control="type"]').bind 'change', ->
    if this.value == 'select'
      $('*[data-group="select"]').removeClass('hide');
    else
      $('*[data-group="select"]').addClass('hide');