$(document).ready ->

  $("#inverter").click ->
    destination_aux = $("#currency_destination").val()
    $("#currency_destination").val($("#currency").val())
    $("#currency").val(destination_aux)
    converter();

  $('form').change ->
    if $("#quantity").val() == ""
      $("#quantity").focus()
    else
      converter();

converter = () ->
  $.ajax '/exchange',
      type: 'POST'
      dataType: 'json'
      data: {
              currency: $("#currency").val(),
              currency_destination: $("#currency_destination").val(),
              quantity: $("#quantity").val()
            }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').val(data.value)
    return false;
