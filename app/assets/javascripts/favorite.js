// $(document).on("click", ".btn.btn-heart", function(e) {
//   e.preventDefault();
//   alert("YOU CLICKED!");
//   $(this).toggleClass(".glyphicon.glyphicon-heart");
// });


$(function(){
  $(".glyphicon.glyphicon-heart").click(function(e){
      e.preventDefault();
    fetch('/recipes.json')
      var input = $(this).siblings('.qty');
      console.log(this)
      input.val(parseFloat(input.val()) + 1);
  });
  // $(".unfavorite").click(function(){
  //     var input = $(this).siblings('.qty');
  //     input.val(parseFloat(input.val()) - 1);
  // });
});
