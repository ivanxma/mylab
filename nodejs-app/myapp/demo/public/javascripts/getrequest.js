$( document ).ready(function() {
  
  // GET REQUEST
  $("#allCustomers").click(function(event){
    event.preventDefault();
    ajaxGet();
  });
  
  // DO GET
  function ajaxGet(){
    $.ajax({
      type : "GET",
      url : "/api/demo/all",
      success: function(result){
        $('#list-group').empty();
        var custList = "";
        $.each(result, function(i, customer){
          $('#list-group').append('<tr><td>' + customer[0] + '</td><td>' + customer[1] + '</td><td>' + customer[2] + '</td></tr>');
        });
        console.log("Success: ", result);
      },
      error : function(e) {
        $("#getResultDiv").html("<strong>Error</strong>");
        console.log("ERROR: ", e);
      }
    });  
  }
})
