
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
  $('a.delete-comment').on('click', function(e) {
    alert('you clicked delete button')
    e.preventDefault();
  })
})
