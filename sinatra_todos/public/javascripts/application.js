// $(function() {

// 	$("form.delete").submit(function(event) {
// 		event.preventDefault();
// 		event.stopPropagation();

// 		var ok = confirm("Are you double triple sure?");
// 		if (ok) {
// 			// this.submit();
// 			// wraps the object in question (in video example a form) in a jquery object
// 			var form = $(this);
// 			//this method calls ajax request on the jquery object represented by $. 
// 				//It then stores that value in variable request
// 			var request = $.ajax({
// 				//sets the url to the action attribute of the form variable
          //Where we send ajax request to
// 				url: form.attr("action"),
// 				//sets the method to the ,etjpd attribute of the form variable
// 				method: form.attr("method")
// 			});
// 				//This done method is fired whenever request is completed successfully
// 				request.done(function(data, textStatus, jqHXR) {
// 					//upon successful request, we find the form's parent <li> in the dom
// 					//and remove it from the page
// 					form.parent("li").remove()
// 				});
// 				//If the request fails, it can be handled here. Not in done.
// 				request.fail(function() {});
// 		}
// 	});
// });

// public/javascripts/application.js
$(function() {

  $("form.delete").submit(function(event) {
    event.preventDefault();
    event.stopPropagation();

    var ok = confirm("Are you sure? This cannot be undone!");
    if (ok) {
      var form = $(this);

      var request = $.ajax({
        url: form.attr("action"),
        method: form.attr("method")
      });

      request.done(function(data, textStatus, jqXHR) {
        if (jqXHR.status === 204) {
          form.parent("li").remove();
        } else if (jqXHR.status === 200) {
          //url coming back from todo.rb is in data 
          //document.location tells jquery to go to the url in data
          document.location = data;
        }
      });
    }
  });

});