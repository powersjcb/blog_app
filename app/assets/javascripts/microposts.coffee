# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#micropost_picture').bind change: ->
    size_in_megabytes = this.files[0].size/1024/1024;
    if size_in_megabytes > 5
      alert('Maximum file size is 5MB. Please choose a smaller file.')



  $('textarea').on keyup: ->
    remaining = 140 - $('textarea').val().length;
    #sets counter
    $('.counter').text(remaining);
    #changes counter color
    #valid but low 
    $('.counter').toggleClass('warning', remaining < 21 && remaining > 9 );
    #invlaid
    $('.counter').toggleClass('error', remaining < 10);
    #submit button toggle when invalid inputs
    $('.btn-primary').prop('disabled', remaining < 0 || remaining == 140);
    
