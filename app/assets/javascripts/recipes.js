$(function() {
   clickHandlers()
  });

  //Link to user show page
 const clickHandler = () => {

  $('.user').on('click', function(event) {
    event.preventDefault()
     history.pushState(null, null, `/user/page`)
    fetch(`/user/page.json`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(user => {
      $('#app-container').html('')
      let newUser = new User(user)
      let userHtml = newUser.userShow()
      $('#app-container').append(userHtml);
    })
  })


        $('.js-more').on('click', function( ) {
       let id = $(this).data("data-id");
       $.get("/recipes/" + id + ".json", function(data) { 
           var recipe= data;
           var descriptionText= "<p>" + recipe["description"] + "</p>";
      $("#description-" + id).text(descriptionText);
    });
  });
  };

function User(user) {
    this.id = user.id; 
    this.name = user.name;
    this.email= user.email;
    this.recipes = user.recipes;
  }
 User.prototype.userShow= function() {
    let userHtml= 
   
   <div class= "container"> 
    <div class="container name" style="border-bottom:1px solid black">
    <h1>  Welcome ${this.name}  </h1> 
    </div> 
    
    <h2>Email: ${this.email}</h2>
  
      <ul class= "container details "> 
    <p> You have ${this.recipes.length} Recipie(s)  </p>
     
    <p> < a href= "/users/${this.id}/recipes/new" > Add Recipe </a></p> 
    
    <p> < a href= "/recipes"> All Recipes </a> </p>
    
    <p> < a href= "/signout" data-id="${this.id}" > Log Out </a> </p> 
    </ul> 
    </div> 
    return userhml;
  }

  
  



 
  
 
