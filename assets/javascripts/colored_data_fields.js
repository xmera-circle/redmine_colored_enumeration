/* Redmine Colored Enumeration
   Copyright (C) 2021  Liane Hampe, xmera */

function coloredEnumerationAddBackgroundColor() {
  $('div.enumeration_cf, div.combi_matrix_cf, td.enumeration').each(function(){
    var color = $(this).data('color');
    if (color) {
      $(this).children('.value').css('background-color', color);
      $(this).children('.value').css('text-align', 'center');
      $(this).children('.value').css('width', 'max-content');
    }
  });
}

function coloredEnumerationBadge() {
  $('div.enumeration_cf, div.combi_matrix_cf, td.enumeration').each(function() {
    var color = $(this).data('color');
    var element = $(this).children('.value').length ? $(this).children('.value') : $(this);
    var value = element.text();
    if (color && value) {
      element.empty().html(
        `<table class='enumeration-badge'>
          <tbody>
            <tr>
              <td style="background-color: `+ color + `;" title="` + value + ` "></td>
            </tr>
          </tbody>
        </table>`
      )
    }
  });
}

$(document).ready(coloredEnumerationBadge);
