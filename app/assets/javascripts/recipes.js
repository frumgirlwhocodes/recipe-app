$(() => {
    bindClickHandlers()
  })

function Comment(comment) {
this.id= comment.id 
this.body= comment.body 
this.user=comment.user 
}

Comment.prototype.addData= function() {
    var html= " "; 
    html += '<blockquote>' + "<div class=\'commentDetials\' id=\'comment-\' + comment.id + '\'>" + "<strong>" 
    + this.user.name + "</strong>" 
    + "commented" + this.body +  "</div>" + '</blockquote>';
    $("#submitted-comments").append(html);
    
}

 $(function() {
    $("form#new_comment").submit( function(event) {
      event.preventDefault();
      var $form = $(this);
      let values= $form.serilaize();
      var action = $form.attr("action");
      let posting= $.post( action, values);
      posting.done(function(data) {
      let comment = new Comment(data);
        comment.addData();
  
      })
    })
  })
