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

$(function() {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_recipes').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "recipes")
    fetch(`/recipes.json`)
      .then(res => res.json())
      .then(data => {
        $('#app-container').html('')
        // debugger
        data.data.forEach( recipe => {
          let newRecipe = new Recipe(recipe)
          // console.log(newRecipe)
          let postHtml = newRecipe.formatIndex()
          // console.log(postHtml)
          $('#app-container').append(postHtml)
        })
      })
    })
  }

function Recipe(recipe) {
  this.id = recipe.id
  this.name = recipe.attributes.name
  this.image = recipe.attributes.image
  // this.description = recipe.description
  // this.directions = recipe.directions
  // this.ingredients = recipe.ingredients
  // this.comments = recipe.comments
}

Recipe.prototype.formatIndex = function(){
  // debugger
  console.log(this)
  let postHtml = `
      <div class="container center"><a href="/recipes/${this.id}"><h1>${this.name}</h1></a>
      <img src="${this.image}" height="250" width="300"></div>
      `
  return postHtml
}

//
//
// const htmlGenerator = (response) =>{
//   let allRecipes = response.data.map((recipe)=>`<li>${recipe.attributes.name}</li>`)
//   // document.getElementById("messingAround").innerHTML=(allRecipes)
// }
