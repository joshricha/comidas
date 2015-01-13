$(document).ready(function() {

  $('.add').click(function(e){
   e.preventDefault();
   console.log(e);

  var recipeId = this.getAttribute("recipe_id");

  $.ajax({
       url: "/recipes/" + recipeId,
       type: "GET",//type of posting the data
       success: function (data) {
         console.log("worked");
       },
       error: function(xhr, ajaxOptions, thrownError){
          window.location.replace("https://comidas2.herokuapp.com/users/sign_in");
       },
       timeout : 15000//timeout of the ajax call
  });

  });

});
