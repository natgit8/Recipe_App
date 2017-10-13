$(function(){
  $('.button_to').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      url: this.action,
      method: 'DELETE',
    success: function(response) {
      console.log('delete successful', response);
      $(`div#${e.target.id}`).remove();
      }
    });
  })
})



$(function(){
$('.new_comment').on('submit', function(e) {
  e.preventDefault();
  url = this.action
  console.log(url);
  $.ajax({
    type: 'POST',
    url: url,
    data: {'comment[body]': $('#comment_body').val(),
           'comment[rating]': $('#comment_rating').val(),
         },
    success: function(response) {
      $('.comments-body ol').append(response)
      }
  });
  $('.new_comment').trigger("reset")
})
})
