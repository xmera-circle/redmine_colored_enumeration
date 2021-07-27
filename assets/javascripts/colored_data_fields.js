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

function coloredEnumerationBadge() {
  $('div.enumeration_cf').each(function() {
    var color = $(this).data('color');
    var value = $(this).children('.value').text();
    if (color) {
      $(this).children('.value').empty().html(
        `<table class='enumeration-badge'>
          <tbody>
            <tr>
              <td style="background-color: `+ color + `;" class="closed" title="` + value + ` "></td>
            </tr>
          </tbody>
        </table>`
      )
    }
  });
}

$(document).ready(coloredEnumerationBadge);
