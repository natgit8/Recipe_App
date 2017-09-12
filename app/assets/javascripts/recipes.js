// #
// Place all the behaviors and hooks related to the matching controller here.#All this logic will automatically be available in application.js.#You can use CoffeeScript in this file: http: //coffeescript.org/
//
//   #$ - > #$('#recipes').imagesLoaded - > #$('#recipes').masonry# itemSelector: '.box'#
// isFitWidth: true


// $(document).ready(function() {
//   $("#button").click(function(event) {
//     $("#new-form").append(newForm);
//     event.preventDefault();
//   })
// })

$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_recipes').on('click', (e) => {
    e.preventDefault()
    fetch(`/recipes.json`)
      .then(res => res.json())
      .then(data => console.log(data))
  })
}
