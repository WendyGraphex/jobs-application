            
    <p>{$employer.courtesy} {$employer.gender.short} {$employer.firstname} {$employer.lastname},</p><br/>
    <p>Please click in the link below, and we'll send you a password for resetting your password.</p>            
    <p><a href='{$forgotpassword.uri}' style="font-weight: bold;text-decoration: underline;color:#000;">Get your new password</a></p>

    {include file="./includes/footer-email.tpl"}
