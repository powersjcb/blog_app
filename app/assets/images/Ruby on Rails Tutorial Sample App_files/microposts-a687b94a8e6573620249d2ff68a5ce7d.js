(function() {
  $(document).ready(function() {
    $('#micropost_picture').bind({
      change: function() {
        var size_in_megabytes;
        size_in_megabytes = this.files[0].size / 1024 / 1024;
        if (size_in_megabytes > 5) {
          return alert('Maximum file size is 5MB. Please choose a smaller file.');
        }
      }
    });
    return $('textarea').on({
      keyup: function() {
        var remaining;
        remaining = 140 - $('textarea').val().length;
        $('.counter').text(remaining);
        $('.counter').toggleClass('warning', remaining < 21 && remaining > 9);
        $('.counter').toggleClass('error', remaining < 10);
        return $('.btn-primary').prop('disabled', remaining < 0 || remaining === 140);
      }
    });
  });

}).call(this);
