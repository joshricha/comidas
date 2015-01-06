$(document).ready(function() {

  console.log('page read');

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
              //what to do in error
           },
           timeout : 15000//timeout of the ajax call
      });

    });

  });
