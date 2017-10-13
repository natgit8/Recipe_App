// #
// Place all the behaviors and hooks related to the matching controller here.#All this logic will automatically be available in application.js.#You can use CoffeeScript in this file: http: //coffeescript.org/
//
//   #$ - > #$('#recipes').imagesLoaded - > #$('#recipes').masonry# itemSelector: '.box'#
// isFitWidth: true


$(function() {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_recipes').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "recipes")
    fetch('/recipes.json')
      .then(res => res.json())
      .then(data => {
        $('#app-container').html('')
        data.data.forEach( recipe => {
          let newRecipe = new Recipe(recipe)
          // console.log(newRecipe)
          let postHtml = newRecipe.formatIndex()
          $('#app-container').append(postHtml)
        })
      })
    })
    $(document).on('click', ".show_link", function(e) {
      e.preventDefault();
      $('#app-container').html('')
      let id = $(this).attr('data-id')
      fetch(`/recipes/${id}.json`)
      // alert("YOU CLICKED SHOW LINK")
      .then(res => res.json())
      .then(data => {
        // console.log(data)
        let newRecipe = new Recipe(data.data)

        let postHtml = newRecipe.formatShow()
        $('#app-container').append(postHtml)
      })
    })

    $(document).on("click", ".next-recipe", function() {
      let id = $(this).attr('data-id')
      fetch(`recipes/${id}/next`)
      //   .then((resp) => resp.json())
      //   // debugger
      // $('.next-recipe').append()
    })
  }

//constructor function
function Recipe(recipe) {
  this.id = recipe.id
  this.name = recipe.attributes.name
  this.image = recipe.attributes.image
  this.description = recipe.attributes.description
  this.directions = recipe.attributes.directions
  this.ingredients = recipe.attributes.ingredients
}



Recipe.prototype.formatIndex = function(){
  let postHtml = `
      <a href="/recipes/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
      <h4>${this.description}</h4>
      `
  return postHtml
}

Recipe.prototype.formatShow = function(){
  console.log(this)
  let postHtml = `
    <h2>${this.name}</h2>
    <img src="${this.image}" height="250" width="300">
    <h4> ${this.ingredients.map(function(element){return `<li>${element.name}</li>` }).join('')} </h4>
    `

  return postHtml
}



//adding next button from API <button class="next-recipe" data-id="${this.id}">Next</button>
