<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
    <head>
        <link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" />	
    </head>
    <body>      
        {if $model_i18n && $model_i18n->isLoaded()}
            {eval $model_i18n->get('body')}
         {else}                                                
        <div class="container-email" style="font-size:16px;width: 95%;margin: 0 auto;padding-top: 40px;">
            <div class="table-responsive pt-3">
                <table class="table table-bordered table-striped" border="1" style="border-top: 1px solid #f3f3f3;width: 100%;color: #212529;border-collapse: collapse;">
                    <thead class="">
                        <tr role="row">                                                              
                            <th>{__('First name')}</th>                             
                            <th>{__('Last name')}</th> 
                            <th>{__('Email')}</th> 
                            <th>{__('Friend First name')}</th>                             
                            <th>{__('Friend Last name')}</th> 
                            <th>{__('Friend Email')}</th> 
                             <th>{__('Message')}</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                                                                  
                            <td>{$invitation.firstname}</td>                             
                            <td>{$invitation.lastname}</td> 
                            <td>{$invitation.email}</td>                                              
                            <td>{$invitation.friend_firstname}</td>                             
                            <td>{$invitation.friend_lastname}</td> 
                            <td>{$invitation.friend_email}</td>  
                            <td>{$invitation.message}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
                            {/if}     
    </body>
</html>
