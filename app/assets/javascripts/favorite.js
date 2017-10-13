// $(document).on("click", ".btn.btn-heart", function(e) {
//   e.preventDefault();
//   alert("YOU CLICKED!");
//   $(this).toggleClass(".glyphicon.glyphicon-heart");
//   debugger;
// });


$(function(){
  $(".glyphicon.glyphicon-heart").click(function(){
      var input = $(this).siblings('.qty');
      console.log(this)
      input.val(parseFloat(input.val()) + 1);
  });
  $(".unfavorite").click(function(){
      var input = $(this).siblings('.qty');
      input.val(parseFloat(input.val()) - 1);
  });
});
