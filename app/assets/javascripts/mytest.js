$(function() {
    console.log('test.js is loaded')
     clickDelete()
  
    });
  



function clickDelete() {
    $(".js-delete").on("click", function(event) {
        event.preventDefault();
      let id = $(this).attr("data-id");
      let token = $("meta[name='csrf-token']").attr("content");
    const linkElement = event.target
      $.ajax(
        {
            url: "/recipes/" + id + ".json" ,
            type: 'DELETE',
            data: {
                "id": id,
                "_token": token,
            },
            success: function ( ){
                linkElement.parentElement.remove()
            }
        });
    }
    ) 
  } 
  


