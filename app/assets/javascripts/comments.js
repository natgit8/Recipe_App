$(function(){
  $('.button_to').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      url: this.action,
      method: 'DELETE',
    success: function() {
      alert('you clicked delete button');
      // debugger
      $('#' + `${e.target.parentElement.parentElement.id}`).remove();
      }
    });
  })
})



// $(function(){
//   $('.button_to').on('click', function(e) {
//     e.preventDefault();
//     url = this.action
//
//     // const recipeId = $(this).data('recipe')
//     // const commentId = $(this).data('comment')
//     // console.log(recipeId, commentId)
//     $.ajax({
//       url: url,
//       data: {'comment[body]': $('#comment_body').val(),
//              'comment[rating]': $('#comment_rating').val(),
//            },
//       method: 'DELETE',
//     success: function(data) {
//       // alert("YOU CLICKED")
//       // debugger
//       $(e.target.parentElement.parentElement.id).remove();
//       // $('#' + `${e.target.parentElement.parentElement.id}`).remove();
//       }
//     });
//   })
// })


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
