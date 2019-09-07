<div class="login-panel">
	<div class="login-content">
		<div class="login-content-heading">Login</div>               	
        <form id="login-form" class="form" method="POST" action="../user/login">							
           <label>Email :</label>
           <input type="text" name="email" id="email">
           <label>Password :</label>
           <input type="password" name="password" id="password">
           <button type="submit" name="login" id="login">Sign In</button>
        </form>
        <br /><br /><br />
        <a href="../pages/forgot-password.jsp">Forgot Password</a><a style="float:right;" href="../pages/registration-page.jsp">Register</a>
    </div>
</div>

<script type="text/javascript">
   $("#login-form").submit(function(event){
   var formData = $(this).serializeArray();
   $.ajax({
        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url         : '../user/login', // the url where we want to POST
        data        : formData, // our data object
        dataType    : 'text', // what type of data do we expect back from the server
        encode      : true
    }).done(function(data) {
           // log data to the console so we can see
           console.log(data);
           if("0" == data){
           	window.location = '../pages/product-listing.jsp';
           } else {
           	$("#error-message").html(data);
           	$("#error-message").css('display', 'block');
           }
           // here we will handle errors and validation messages
       });
   event.preventDefault();
   });
</script>