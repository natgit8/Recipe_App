


$(function(){
  $('.button_to').on('click', function(e) {
    console.log($(this))
    // const recipeId = //the data attribute of the recipe id
    // const commentId = //the data atrtribute of the comment id
    //
    $.ajax({
      url: `recipes/${recipeId}/comments/${commentId}`,
      method: 'DELETE'
    })
    alert('you clicked delete button')
    e.preventDefault();
    e.stopPropagation();
  })
})


$(function(){
  $('.new_comment').on('submit', function(e) {
    // console.log(this)
    url = this.action
    console.log(url);
    $.ajax({
      type: 'POST',
      url: url,
      data: {'comment[body]': $('#comment_body').val(),
             'comment[rating]': $('#comment_rating').val(),
           },
      success: function(response) {
        // debugger;
        $('.new_comment').serialize(), function(data) {
          $('.new_comment').append(data);
        };
      }
    });
    e.preventDefault();
  })
})
