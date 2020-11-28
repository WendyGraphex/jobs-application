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
                            <th>{__('Phone')}</th> 
                            <th>{__('Race')}</th>          
                            <th>{__('Has experience')}</th>  
                            <th>{__('Other attending')}</th>                                                                               
                            <th>{__('Attending')}</th> 
                            <th>{__('Level')}</th> 
                            <th>{__('Profession')}</th> 
                            <th>{__('Other level')}</th> 
                            <th>{__('Post code')}</th> 
                            <th>{__('City')}</th> 
                            <th>{__('State')}</th> 
                            <th>{__('Country')}</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                                                                  
                            <td>{$registration.firstname}</td>                             
                            <td>{$registration.lastname}</td> 
                            <td>{$registration.email}</td> 
                            <td>{$registration.phone}</td> 
                            <td>{$registration.race}</td>          
                            <td>{$registration.has_experience}</td>  
                            <td>{$registration.other_attending}</td>                                                                               
                            <td>{$registration.attending}</td> 
                            <td>{$registration.level}</td> 
                            <td>{$registration.profession}</td> 
                            <td>{$registration.other_level}</td> 
                            <td>{$registration.postcode}</td> 
                            <td>{$registration.city}</td> 
                            <td>{$registration.state}</td> 
                            <td>{$registration.country}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
                            {/if}     
    </body>
</html>
