


// $(function(){
//   $('.button_to').on('click', function(e) {
//     // console.log($(this))
//     url = this.action
//     console.log(url);
//     // const recipeId = //the data attribute of the recipe id
//     // const commentId = //the data atrtribute of the comment id
//     //
//     $.ajax({
//       url: url,
//       data: { }
//       method: 'DELETE'
//     })
//     alert('you clicked delete button')
//     e.preventDefault();
//   })
// })

// $(function(){
//   $('.new_comment').on('submit', function(e) {
//     $.ajax({
//       type: 'POST',
//       url: this.action,
//       data = $(this).serialize();
//       success: function(response) {
//         $('#comment_body').val();
//         $('#comment_rating').val();
//       $('.new_comment').append(response);
//     })
//   })
// })

$(function(){
  $('.new_comment').on('submit', function(e) {
    url = this.action
    console.log(url);
    $.ajax({
      type: 'POST',
      url: url,
      data: {'comment[body]': $('#comment_body').val(),
             'comment[rating]': $('#comment_rating').val(),
           },
      success: function(response) {
        alert('you clicked submit!')
        $('.comments-body').append(response)
        // debugger
        }
    });
    e.preventDefault();
  })
})


// success: function(response) {
//         // debugger;
//         $('.new_comment').serialize(), function(data) {
//           $('.new_comment').append(data);
//         };
