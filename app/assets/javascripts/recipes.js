$(function() {
  console.log('recipe.js id loaded')
   clickHandlers()
listenForSubmit()
  });

  //Link to user show page
 const clickHandlers = () => {

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

  class Comment {
  constructor(comment) {
    this.id = comment.id;
    this.body = comment.body;
    this.user = comment.user;
  }
  addData() {
    var html = " ";
    html += '<blockquote>' + "<div class=\'commentDetials\' id=\'comment-\' + comment.id + '\'>" + "<strong>"
      + this.user.name + "</strong>"
      + "commented" + this.body + "</div>" + '</blockquote>';
    $("div#submitted-comments").append(html);
  }
}

function listenForSubmit() {
  $("form#new_comment").on("submit", function(event) {
    event.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json) {
    let comment = new Comment(json);
      comment.addData();

    })
  })
}


  
  



 
  
 
