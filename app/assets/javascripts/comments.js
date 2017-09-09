


$(function(){
  $('.button_to').on('click', function(e) {
    e.preventDefault();
    url = this.action
    console.log(url);

    $.ajax({
      url: url,
      data: {'comment[body]': $('#comment_body').val(),
             'comment[rating]': $('#comment_rating').val(),
           },
      method: 'DELETE',
    success: function(data) {
      alert('you clicked delete button');
      $(`${e.target.parentElement.parentElement.id}`).remove();
      }
    });
  })
})


$(function(){
  $('.new_comment').on('submit', function(e) {
    e.preventDefault();
    url = this.action
    // console.log(url);
    $.ajax({
      type: 'POST',
      url: url,
      data: {'comment[body]': $('#comment_body').val(),
             'comment[rating]': $('#comment_rating').val(),
           },
      success: function(response) {
        // debugger
        $('.comments-body ol').append(response)
        }
    });
    $('.new_comment').trigger("reset")
  })
})
