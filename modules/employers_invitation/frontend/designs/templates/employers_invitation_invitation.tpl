<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="{__('Invitation')}">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Invitation')}</title>   
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">  
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        {include file="./includes/header-nav.tpl"}

        <section class="ftco-section bg-light sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
                <div class="container">
                    <div>
                        <div><img src="/web/files/banners/en/employer.jpg" style="height:100%; width:100%"></div>

                        {component name="/cms_pages/pageDisplay" page="paragraph-invitation"}

                        <div class="row" style="background-color: #e1e1e1;padding: 30px;">
                            <div class="col-md-6" style="margin: 0 auto;text-align: center;border: 3px solid #007de8;padding-left: 0px;padding-right: 0px;">
                                <h2 style="background-color: #00aeef;color: #fff;padding: 10px;">{__('Invite an Employer')}</h2>
                                <div style="padding: 20px;text-align: left;color: #00aeef;font-size: 20px;">
                                    <div>
                                        <label>{__('Your first Name')}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="firstname" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <div>
                                        <label>{__('Your last Name')}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="lastname" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <div>
                                        <label>{__('Your e-mail')}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="email" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <div>
                                        <label>{__("Your friend's First Name")}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="friend_firstname" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <div>
                                        <label>{__("Your friend's Last Name")}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="friend_lastname" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <div>
                                        <label>{__("Your friend's e-mail")}</label>
                                        <input type="text" class="form-control Invitation Input Clear" name="friend_email" style="margin: 0 auto;border: 2px solid #00aeef;border-radius: 0px;"/>
                                    </div>
                                    <p style="color: #777575;line-height: 21px;font-size: 15px;margin-top: 15px;font-family: calibri;">
                                        <textarea class="Invitation Input" placeholder="{__('Enter your comment')}" name="message" style="width: 100%; color: rgb(73, 80, 87); background-color: rgb(255, 255, 255); background-clip: padding-box; border: 2px solid rgb(0, 174, 239); border-radius: 0.25rem; height: 67px;"></textarea>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <button class="btn btnJoin" id="submitForm">{__('Send')}</button>
                                        </div>   
                                    </div>
                                  {*  <div style="text-align: right;">
                                        <a href="{link_i18n('employees_signin')}" class="text-primary" style="color: #4ac7ea !important;font-size: 16px;font-weight: bold;">{__('Sign up employer')}</a>
                                    </div> *}
                                </div>
                            </div>
                        </div>
                        {component name="/cms_pages/pageDisplay" page="why_graphex_block"}
                    </div>
                </div>   
            </div>
        </section>  

        <div id="ModalLandingForm" class="modal fade" role="dialog" aria-modal="true">
            <div class="ModalMessage modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="Modal-close close" data-dismiss="modal">×</button>
                    </div>              
                    <div class="modal-body" style="text-align: center;color: green;">
                        <i class="mdi mdi-check-circle" style="font-size: 45px;"></i>
                        <p style="font-size: 19px;">{__('Your Message has been sent')}</p>
                    </div>
                </div>
            </div> 
        </div>                   

        {include file="./includes/footer.tpl"}

        <script src="{url('js/jquery-migrate-3.0.1.min.js','web','frontend')}"></script>  
        <script src="{url('js/popper.min.js','web','frontend')}"></script>
        <script src="{url('js/bootstrap.min.js','web','frontend')}"></script>
        <script src="{url('js/jquery.waypoints.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.stellar.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.magnific-popup.min.js','web','frontend')}"></script>
        <script src="{url('js/aos.js','web','frontend')}"></script>
        <script src="{url('js/jquery.animateNumber.min.js','web','frontend')}"></script> 
        <script src="{url('js/scrollax.min.js','web','frontend')}"></script>  
        <script src="{url('js/main.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web')}"></script> 
        {component name="/google_analytics/tag"}

        <script type="text/javascript">
             
        $("textarea").keyup(function(e) {
            while($(this).outerHeight() < this.scrollHeight + parseFloat($(this).css("borderTopWidth")) + parseFloat($(this).css("borderBottomWidth"))) {
                $(this).height($(this).height()+1);
            };
        });
        
            $('.Invitation').keyup(function () { 
                 $(".Invitation").removeClass('intro').removeClass('introRadio');
            });
            
             $('.Invitation').click(function () { 
                 $(".Invitation").removeClass('intro').removeClass('introRadio');
            });
            
            $('#submitForm').click(function () {
                if ($(this).hasClass('isBusy')) return ;
                $(this).addClass('isBusy');
                $(".Invitation").removeClass('intro');
                $(".Invitation.Radio").removeClass('introRadio');
                var params= { EmployerInvitation: {                                        
                        token :'{$form->getCSRFToken()}' 
                    } };
                    $(".Invitation.Input").each(function() { params.EmployerInvitation[this.name]=$(this).val(); });  
                    $(".Invitation.Radio:checked").each(function() { params.EmployerInvitation[this.name]=$(this).val(); });
                    $(".Invitation.Select").each(function() { params.EmployerInvitation[this.name]=$(this).val(); });

                return $.ajax2({    
                    data:params   , 
                    url: "{url_to('employers_invitation_ajax',['action'=>'SendMessage'])}",                              
                    success : function (resp)
                    {             
                        $("#submitForm").removeClass('isBusy');
                        if (resp.errors) {                                                    
                          $.each(resp.errors,function (field,error) {
                            $(".Invitation.Input[name="+field+"]").addClass("intro");
                            $(".Invitation.Select[name="+field+"]").addClass("intro");
                            if (!$(".Invitation.Radio[name="+field+"]:checked").length)                               
                                $(".Invitation.Radio[name="+field+"]").addClass("introRadio");                            
                          });
                          return ;
                        }
                        $(".Invitation.Clear").val("");
                        $('#ModalLandingForm').modal('show');
                    }
               });
            });

        </script>
    </body>
</html>


