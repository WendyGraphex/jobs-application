<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
    </head>
    <body>   
        <div id="body">
            <div id="middle">
                <h4>{__('New Password')}</h4>
                <p>{__('hello')} {$user->get('firstname')|capitalize} {$user->get('lastname')|capitalize},</p>
                <p>{__('Username')}: [{$user->get('username')}]</p>    
                <p>{__('Password')}: [{$password}]</p>    
                <p>{__("Access to your administration")}</p>
                <a href="{url("/")}" target="_blank">{url("/")}</a>
            </div>
        </div>
    </body>    
</html>
