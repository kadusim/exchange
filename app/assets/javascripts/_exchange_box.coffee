$(document).ready ->

  $("#change").click ->
    destination_aux = $("#currency_destination").val()
    $("#currency_destination").val($("#currency").val())
    $("#currency").val(destination_aux)
    convert()

  $('form').change ->
    convert()

convert = () ->
  empty_value = $('#quantity').val() <= 0 || $('#quantity').val() == ""
  if empty_value
    $("#quantity").focus()
    return

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
