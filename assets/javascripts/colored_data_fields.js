/* Redmine Colored Enumeration
   Copyright (C) 2021  Liane Hampe, xmera */

function coloredEnumerationAddBackgroundColor() {
  $('div.enumeration_cf').each(function(){
    var color = $(this).data('color');
    if (color) {
      $(this).children('.value').css('background-color', color);
      $(this).children('.value').css('text-align', 'center');
      $(this).children('.value').css('width', 'max-content');
    }
  });
}
$(document).ready(coloredEnumerationAddBackgroundColor);
