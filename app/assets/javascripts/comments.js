
// $(document).ready(function() {
//     $("a.delete-comment").on('click', function() {
//       $.ajax({
//         url: '/recipes/' + this.parentElement.id,
//         type: 'DELETE',
//         success: function(r) {
//           alert("You clicked delete!");
//         }
//       });
//     });
//   });

$(function(){
  $('.button_to').on('click', function(e) {
    console.log($(this))
    const recipeId = //the data attribute of the recipe id
    const commentId = //the data atrtribute of the comment id

    $.ajax({
      url: `recipes/${recipeId}/comments/${commentId}`,
      method: 'DELETE'
    })
    alert('you clicked delete button')
    e.preventDefault();
    e.stopPropagation();
  })
})
