function Comment(comment) {
this.id= comment.id 
this.body= comment.body 
this.user=comment.user 
}

Comment.prototype.addData= function() {
    var html= " "; 
    html += '<blockquote>' + "<div class=\'comment-detials\' id=\'comment-\' + comment.id + '\'>" + "<strong>" 
    + this.user.name + "</strong>" 
    + "commented" + this.body +  "</div>" + '</blockquote>';
    $("#submitted-comments").append(html);
    
}