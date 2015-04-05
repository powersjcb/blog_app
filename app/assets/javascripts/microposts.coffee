# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('textarea').on 'keyup', ->
    remaining = 140 - $('textarea').val().length

    #sets counter
    $('.counter').text(remaining)

    #changes counter color
    #valid but low 
    $('.counter').toggleClass('warning', remaining < 16 && remaining > -1 )
    #invlaid
    $('.counter').toggleClass('error', remaining < 0)


    #submit button toggle when invalid inputs
    $('.btn-primary').prop('disabled', remaining < 0 || remaining == 140)