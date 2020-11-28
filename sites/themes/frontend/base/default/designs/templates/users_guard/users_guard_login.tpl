<!DOCTYPE html>
<html lang="{$_request->getCountry()}">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="{url('css/bootstrap.min.css','web')}"/>
    <!--[if lte IE 8]>
    <script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="{url('css/main2.css','web')}"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->
    {header}
    <script type="text/javascript" src="web/js/jquery.custom.js"></script>
</head>
<body>

<div id="body" class="CustomersSignin">

    <div id="middle">
        <div class="container-CustomersSignin">
            {*<img class="logo" src="{url('pictures/logoblan.png','web')}">*}
            {if $_request->getSite()->getSite()->hasLogo()}
                <img class="logo" src="{$_request->getSite()->getSite()->getLogo()->getUrl()}"/>
            {/if}
            <h2>{__('Thanks to login')}</h2>

        </div>
    </div>
    <button onclick="getInfo()">Get Info</button>
    <button onclick="login()" id="login">Login</button>
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
    </fb:login-button>

</div>
<script>
    // initialize and setup facebook js sdk
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1001496933318851',
            xfbml      : true,
            version    : 'v2.5'
        });
        FB.getLoginStatus(function(response) {
            if (response.status === 'connected') {
                console.log('We are connected.');
                document.getElementById('login').style.visibility = 'hidden';
            } else if (response.status === 'not_authorized') {
                console.log('We are not logged in.')
            } else {
                console.log('You are not logged into Facebook.');
            }
        });
    };
    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // login with facebook with extra permissions
    function login() {
        FB.login(function(response) {
            if (response.status === 'connected') {
                console.log('We are connected.');
                document.getElementById('login').style.visibility = 'hidden';
            } else if (response.status === 'not_authorized') {
                console.log('We are not logged in.')
            } else {
                console.log('You are not logged into Facebook.');
            }
        }, { scope: 'email, public_profile' });
    }

    // getting basic user info
    function getInfo() {
        FB.api('/me', 'GET', { fields: 'id,email,name,first_name,last_name,gender,age_range' }, function(response) {
            data = JSON.stringify(response);
            console.log(data);
            $.ajax2({
                data: data,
                url: "{url_to('facebook_auth',['action'=>'FacebookLogin'])}"
            });
        });
    }
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }
</script>
</body>
</html>
