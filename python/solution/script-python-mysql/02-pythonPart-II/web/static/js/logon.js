$(function() {
    $('#btnLogon').click(function() {
 
        $.ajax({
            url: '/Logon',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
		document.getElementById("mymessage").innerHTML=response;
            },
            error: function(error) {
		document.getElementById("mymessage").innerHTML=error;
            }
        });
    });
});