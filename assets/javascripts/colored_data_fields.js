/* Redmine Colored Enumeration
   Copyright (C) 2021-2023  Liane Hampe, xmera Solutions GmbH*/

function coloredEnumerationAddBackgroundColor() {
  $('div.enumeration_cf, div.combi_matrix_cf, td.enumeration').each(function(){
    let color = $(this).data('color');
    if (color) {
      $(this).children('.value').css('background-color', color);
      $(this).children('.value').css('text-align', 'center');
      $(this).children('.value').css('width', 'max-content');
    }
  });
  highlightTooltip();
}

function coloredEnumerationBadge() {
  $('div.enumeration_cf, div.combi_matrix_cf, td.enumeration').each(function() {
    let color = $(this).data('color');
    let element = $(this).children('.value').length ? $(this).children('.value') : $(this);
    let value = element.text();
    if (color && value) {
      element.empty().html(
        `<table class='enumeration-badge'>
          <tbody>
            <tr>
              <td style="background-color: `+ color + `;" title="` + value + `"></td>
            </tr>
          </tbody>
        </table>`
      )
    }
  });
  highlightTooltip();
}

function highlightTooltip() {
  $("[title]").tooltip({
    classes: {
      "ui-tooltip": "highlight"
    }
  });
}

$(document).ready(coloredEnumerationBadge);
