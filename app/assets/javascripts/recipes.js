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
      .then(data => {
        $('#app-container').html('')
        // debugger
        data.data.forEach( recipe => {
          let newRecipe = new Recipe(recipe)
          let postHtml = newRecipe.formatIndex()
          $('#app-container').append(postHtml)
          // console.log(newRecipe)
        })
      })
    })
  }

function Recipe(recipe) {
  this.id = recipe.id
  this.name = recipe.name
  this.image = recipe.image
  this.description = recipe.description
  this.directions = recipe.directions
  this.ingredients = recipe.ingredients
  this.comments = recipe.comments
}

Recipe.prototype.formatIndex = () => {
  let postHtml = `<h1>${this.name}</h1>`
  return postHtml
}
