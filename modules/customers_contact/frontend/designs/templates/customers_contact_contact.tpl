<html lang="{$_request->getCountry()}">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Contact')}</title>  
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet" href="{url('/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" href="{url('vendors/base/vendor.bundle.base.css','web')}">
        <link rel="stylesheet" href="{url('/css/style.css','web')}">
        <link rel="shortcut icon" href="../../images/favicon.png" />
        <link rel="stylesheet" type="text/css" href="/web/css/font-awesome-4.1.0/css/font-awesome.min.css"/> 
        <link href="/web/css/bootstrap.min.css" rel="stylesheet"/>
        {*header*} 
    </head>  
    <body>
        <div id="page-wrapper" class="container-page30">
            <div class="p30-title request_title"> 
                {__('Formulaire de contact')}
            </div>
            <div class="formailer row">
                <div class="fomrmailer1 request_form1 ">
                    <div class="Errors" role="alert" name="firstname"></div>
                    <input class="item UserContact Fields Input" name="firstname" type="text" value="" placeholder="{__("Ajoutez votre prénom")}">
                    <div class="Errors" role="alert" name="lastname"></div>
                    <input class="item UserContact Fields Input" name="lastname" type="text" value="" placeholder="{__("Ajoutez votre nom")}">
                    <div class="Errors" role="alert" name="email"></div>
                    <input class="item UserContact Fields Input" name="email" autocomplete="off" type="text" value="" placeholder="{__("@ Ajouter une adresse e-mail")}">
                    <input class="item UserContact Fields Input" name="reemail" autocomplete="off" type="text" value="" placeholder="{__("@ comfirmer l'adresse e-mail")}">

                    <p>{__('Ces données ne seront utilisées à aucune fin commerciale.')}</p>
                </div>
                <div class="fomrmailer2">
                    <div class="txt-area-title form2-title">{__('Your message')}</div>
                    <div class="Errors err-width" name="message"></div>
                    <div class="txtarea text-div">
                        <textarea class="item-msg-Error UserContact Fields Editable text-pad"  name="message" contenteditable=""></textarea>
                    </div>
                    <div class="btn-envoye request_btn_envoye div-btn">
                        <button  id="SendMessageBtn" type="button" class="btn btn-primary btn-lg btn-block envoyer-btn">{__('Send')}</button>                                        
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

 <script type="text/javascript">
     
     

        
           // $(".navbar-toggler").click(function() {  $("#navbarSupportedContent").toggle("slide"); });

          //  $("#dropbtn-title").click(function() {  $("#myDropdown-title").toggle("slide");  });
            
            $("#SendMessageBtn").click(function () {
               if($(".Errors").hasClass("alert-danger alert")){
                  $(".Errors").removeClass("alert-danger alert");
               }
                $(".Errors").html('');
                 var params = { UserContactMessage : { 
                         token : '{$form->getCSRFToken()}'
                     } };
                 $(".UserContact.Fields.Input").each(function () { params.UserContactMessage[$(this).attr('name')]=$(this).val(); });
                 $(".UserContact.Fields.Editable").each(function () { params.UserContactMessage[$(this).attr('name')]=$(this).val(); });
                 return $.ajax2({ data: params, 
                            url:"{url_to('users_contact_ajax',['action'=>'SendMessage'])}" ,                                                      
                            success : function (resp)
                                    {
                                        if (resp.errors)
                                        {
                                            $.each(resp.errors,function (key,val) { $(".Errors[name="+key+"]").html(val);$(".Errors[name="+key+"]").addClass("alert-danger alert"); });
                                            return ;
                                        }   
                                        $("#page-wrapper").html(resp);
                                    }
                             });
            });
            
   
    </script>     
    
</div>
</body>

</html>

