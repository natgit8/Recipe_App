$(function() {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.all_recipes').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, "recipes")
    //will change what url link is
    fetch('/recipes.json')
      .then(response => response.json())
      .then(data => {
        $('#app-container').html('')
        data.data
          .sort((a, b) => {
            const nameA = a.attributes.name.toUpperCase()
            const nameB = b.attributes.name.toUpperCase()
            if(nameA> nameB) {
              return 1;
            }

            if (nameB < nameA) {
              return -1;
            }
            return 0;

          })
          .forEach(recipe => {
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
      .then(res => res.json())
      .then(data => {
        let newRecipe = new Recipe(data.data)
        let postHtml = newRecipe.formatShow()
        $('#app-container').append(postHtml)
      })
    })
    $(document).on("click", ".next-recipe", function(e) {
      e.preventDefault();
      const id = $(this).attr('data-id')
      $.ajax({
        type: 'get',
        url: `recipes/${id}/next`,
        success: function(data){
          let newRecipe = new Recipe(data.data)
          let postHtml = newRecipe.formatShow()
          $('#app-container').html(postHtml)
          console.log(data)
        }
      })
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
  // console.log(this)
  let postHtml = `
    <h1>${this.name}</h1>
    <img src="${this.image}" height="250" width="300">
    <h4>Ingredients: </h4> </br>
    <h4>${this.ingredients.map(function(element){
      return `${element.name}</br>` }).join('') }
    </h4>
    <button class="next-recipe" data-id="${this.id}">Next</button>
    `

  return postHtml
}
