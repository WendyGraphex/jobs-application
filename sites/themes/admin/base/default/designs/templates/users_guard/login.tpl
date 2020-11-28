<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
<head>
{header}
	<title>MediConnect - Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
<!--===============================================================================================-->	
	<link rel="icon" media="all" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/bootstrap/css/bootstrap.min.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('fonts/font-awesome-4.7.0/css/font-awesome.min.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('fonts/Linearicons-Free-v1.0.0/icon-font.min.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/animate/animate.css','web','admin')}">
<!--===============================================================================================-->	
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/css-hamburgers/hamburgers.min.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/animsition/css/animsition.min.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/select2/select2.min.css','web','admin')}">
<!--===============================================================================================-->	
	<link rel="stylesheet" media="all" type="text/css" href="{url('vendor/daterangepicker/daterangepicker.css','web','admin')}">
<!--===============================================================================================-->
	<link rel="stylesheet" media="all" type="text/css" href="{url('css/util.css','web','admin')}">
	<link rel="stylesheet" media="all" type="text/css" href="{url('css/mainn.css','web','admin')}">
<!--===============================================================================================-->
</head>
<body>
	  
	<div class="limiter">
		<div class="container-login100">
		                 
                    
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" >
			
			<center>
                              {if $_request->getSite()->getSite()->hasPicture()}
                         <img title="Logo" class="logo" src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/> 
                         {else}
                              <img  title="Logo"  alt="Logo login" src="{url('pictures/noir.png','web','admin')}" width="150" height="90"/>
                     {/if}                            
                        </center>
			    <br/>
				<form class="login100-form validate-form flex-sb flex-w" id="new_user" name="f_authent" id="f_authent" action="/admin/" method="post">
		
					
					
					<span class="txt1 p-b-11">
						E-mail
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" autofocus="autofocus" type="text" placeholder="{__('E-mail')}"  value="" name="Signin[username]" id="user_email">
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" autofocus="autofocus" type="password" placeholder="{__('Password')}"  value="" name="Signin[password]" id="user_password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100"  type="checkbox"  name="Signin[remember]" id="user_remember_me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>
                   <input type="hidden" name="Signin[token]"  value="{$form->getCSRFToken()}" /> 
						<div>
							<a href="" class="txt3">
								{__('Forgot password ?')}
							</a>
								
    {component name="/services_mq_oauth/linkSignin"}   
    <br>
    {component name="/services_ac_oauth/linkSignin"}
    <br>
    {component name="/services_bhs_oauth/linkSignin"}
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" style="margin: auto;">
							Login
						</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="{url('vendor/jquery/jquery-3.2.1.min.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('vendor/animsition/js/animsition.min.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('vendor/bootstrap/js/popper.js','web','admin')}"></script>
	<script src="{url('vendor/bootstrap/js/bootstrap.min.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('vendor/select2/select2.min.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('vendor/daterangepicker/moment.min.js','web','admin')}"></script>
	<script src="{url('vendor/daterangepicker/daterangepicker.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('vendor/countdowntime/countdowntime.js','web','admin')}"></script>
<!--===============================================================================================-->
	<script src="{url('js/main.js','web','admin')}"></script>




   <script type="text/javascript">
            // ID=login[d56b699830e77ba53855679cb1d252da] {* mandatory md5(login) for iframe upload files not remove *}
            $(document).ready(function()
            {
                   $(".enter").click(function() {   
                       $('#f_authent').submit(); 
                   });
                   
                   $(document).keypress(function(event) {
                        if (event.keyCode==13)
                              $('#f_authent').submit();
                   }); 
            }); 
        </script>
</body>
</html>