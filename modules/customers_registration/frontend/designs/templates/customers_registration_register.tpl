<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="{__('Registration')}">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Registration')}</title>  
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">  
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        <section class="ftco-section sectionLandingForm">
            <div class="page-wrap">
                <img src="/web/pictures/registration-form.jpg" style="max-width: 100%;width: auto;margin: 0 auto;display: block;"/>
                <div class="container SecondContainerClass">  
                    <h1 style="color: rgb(224, 198, 0);font-weight: bold;">{__('RSVP for Graphex Technology October Grand Opening')}</h1>
                    <p>
                        {__('Dear Friends,<br/>Please join us on Saturday, October 17th, 2020, at 7:00 PM <br/>in this magnitude celebration; as we introduce this revolutionary<br/>movement toward greatness in our ever‒evolving virtual technological world.<br/>Please RSVP by Thursday, October 15th, 2020. <br/>We are looking forward to hearing from you. <br/>')}
                    </p>
                    <div class="row">
                        <div class="col-md-6" style="padding-bottom: 30px;">
                            <span>{__('First Name')} {if $form->firstname->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="firstname"/>
                        </div>
                        <div class="col-md-6" style="padding-bottom: 30px;">
                            <span>{__('Last Name')} {if $form->lastname->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="lastname"/>
                        </div>
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <span>{__('Please Enter Your Email Address')} {if $form->email->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="email"/>
                        </div>
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <span>{__('Please Enter Your Phone Number')} {if $form->phone->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="phone"/>
                        </div>
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <span>{__('Please enter your location? City, State and/or Country')} {if $form->city->getOption('required')}*{/if}</span>
                            <div class="row">
                                <div class="col-md-4" style="margin-bottom: 10px;">
                                    <input type="text" placeholder="{__('Please enter your city')}" class="form-control Input Registration" name="city"/>
                                </div>
                                <div class="col-md-4" style="margin-bottom: 10px;">
                                    <input type="text" placeholder="{__('Please enter your state')}" class="form-control Input Registration" name="state"/>
                                </div>
                                <div class="col-md-4" style="margin-bottom: 10px;">
                                    {select_country name="country" class="Registration form-control Fields Select" preferred=['US'] options=$form->country->getOption('choices') selected=$country} 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <span>{__('Please Indicate Your Race/Ethnicity')} {if $form->race->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="race"/>
                        </div>
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <div>{__('Please Indicate If You Are Attending As Any Of The Following')} {if $form->attending->getOption('required')}*{/if}</div>
                            {foreach $form->attending->getChoices() as $key=>$value}
                                <div class="form-check" style="display: inline-block;padding-right: 40px;">
                                    <input class="form-check-input Registration Radio" type="radio" name="attending" id="{$key}" value="{$key}">
                                    <label class="form-check-label" for="{$key}">{$value}</label>
                                </div>
                            {/foreach}                
                            <input type="text" class="form-control Registration Input" name="other_attending"/>
                        </div>
                        {*=================================================================================*}
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <div>{__('Please Indicate Your Level Of Education')} {if $form->level->getOption('required')}*{/if}</div>
                            {foreach $form->level->getChoices() as $key=>$value}
                                <div class="form-check" style="display: inline-block;padding-right: 40px;">
                                    <input class="form-check-input Registration Radio" type="radio" name="level" id="{$key}" value="{$key}">
                                    <label class="form-check-label" for="{$key}">{$value}</label>
                                </div>
                            {/foreach}
                            <input type="text" class="form-control Registration Input" name="other_level"/>
                        </div>
                        {*=========================================================================*}    
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <span>{__('Please Enter Your Profession')} {if $form->profession->getOption('required')}*{/if}</span>
                            <input type="text" class="form-control Input Registration" name="profession"/>
                        </div>
                        {*=========================================================================*}
                        <div class="col-md-12" style="padding-bottom: 30px;">
                            <div>{__('Do you have any experience working as a freelancer?')}</div>
                            {foreach $form->has_experience->getChoices() as $key=>$value}
                                <div class="form-check" style="display: inline-block;padding-right: 40px;">
                                    <input class="form-check-input Registration Radio" type="radio" name="has_experience" id="{$key}" value="{$key}">
                                    <label class="form-check-label" for="{$key}">{$value}</label>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div style="text-align: center;padding: 25px;">
                        <button id="submitForm" class="btn btn-primary">{__('Submit Form')}</button>
                    </div>
                </div>   
            </div>
            {component name="/social_networks/SocialNetworksDisplay" tpl="landing"}
        </section>
        
        <div id="ModalLandingForm" class="modal fade" role="dialog" aria-modal="true">
            <div class="ModalMessage modal-dialog modal-lg">
                <div class="modal-content" style="background-image: url('/web/pictures/image1.jpg');background-size: cover;">
                    <div class="modal-header">
                        <button type="button" class="Modal-close close" data-dismiss="modal" style="color: #fff;">×</button>
                    </div>              
                    <div class="modal-body" style="color: #fff;font-family: Georgia;font-size: 17px;line-height: 19px;">
                        <img src="/web/pictures/DialogSuccessLogo.jpg" style="width: auto;margin: 0 auto;display: block;padding: 10px;"/>
                        <img src="/web/pictures/DialogSuccessImage2.jpg" style="width: auto;margin: 0 auto;display: block;max-width: 100%;"/>
                        <h3 class="WelcomeModalStyleTitle">{__('Welcome to Graphex Technology')}!</h3>  
                        <p style="text-align: center;">{__('We’re so happy you’re here!')}</p>
                        <div class="WelcomeModalStyleDiv">
                            <div>
                                {__('
                            Graphex Technology is a three dimensional web application that links Employees ,<br/>
                            Employers ,Businesses and The communities around theworld; <br/>
                            To provide business technology solutions to clients to develop the full potential of their enterprises.<br/>
                            Graphex has a wide array of experts, their main focus is to increase the presence of your business online,<br/>
                            Enhance faster operational efficiency, collaborate and meet new clients everyday <br/>
                            Building this platform, it’s adream comes true in awillingness to link people all around the world,To empower<br/>
                            every one to become their own boss, and reinvent them selves;<br/>
                            By using their skills and abilities to sell services in the comfort of their home')}
                            </div>
                            <div style="margin-top: 40px;">
                                {__('Thanks for signing up to keep in touch with Graphex Technology.<br/>
                            From now on ,you will get update on Graphex Technology Grand Opening<br/>
                            On October 17th,2020 at 07:00PM, Eastern Time.<br/>
                            Since you will be the first to know, we are asking to please help us by sharing <br/>
                            the good news with your friends,family,coworkers,and your employer<br/>
                            just so they can benefit from it as well.<br/><br/><br/>
                            ')}
                            </div>                       
                            <div class="sincerely">{__('Sincerely')},</div> 
                        </div>
                        <div style="text-align: left;">
                            <div style="width: 100px;">
                                <img src="/web/pictures/graphex-owner.jpg" class="imageOwner"/>
                            </div>
                            <div>Wendy Pierre</div>
                            <div>CEO/ Graphex Technology</div>
                        </div>
                        <div style="text-align: center;color: #c18a1a;font-weight: bold;padding: 10px;">
                            {__('Follow us on: Fb,Twitter,Instagram,LinkedIn')}
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        

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
            {*  $('#ModalLandingForm').modal('show');   *}
             
            $('.Registration').keyup(function () { 
                 $(".Registration").removeClass('intro').removeClass('introRadio');
            });
            
             $('.Registration').click(function () { 
                 $(".Registration").removeClass('intro').removeClass('introRadio');
            });
            
            $('#submitForm').click(function () {
                if ($(this).hasClass('isBusy')) return ;
                $(this).addClass('isBusy');
                $(".Registration").removeClass('intro');
                $(".Registration.Radio").removeClass('introRadio');
                var params= { CustomerRegistration: {                                        
                        token :'{$form->getCSRFToken()}' 
                    } };
                    $(".Registration.Input").each(function() { params.CustomerRegistration[this.name]=$(this).val(); });  
                    $(".Registration.Radio:checked").each(function() { params.CustomerRegistration[this.name]=$(this).val(); });
                    $(".Registration.Select").each(function() { params.CustomerRegistration[this.name]=$(this).val(); });

                return $.ajax2({    
                    data:params   , 
                    url: "{url_to('customers_registration_ajax',['action'=>'SendMessage'])}",               
                    target: "#actions",
                    success : function (resp)
                    {             
                        $("#submitForm").removeClass('isBusy');
                        if (resp.errors) {                                                    
                          $.each(resp.errors,function (field,error) {
                            $(".Registration.Input[name="+field+"]").addClass("intro");
                            $(".Registration.Select[name="+field+"]").addClass("intro");
                            if (!$(".Registration.Radio[name="+field+"]:checked").length)                               
                                $(".Registration.Radio[name="+field+"]").addClass("introRadio");                            
                          });
                          return ;
                        }
                        $(".Registration").val("");
                        $('#ModalLandingForm').modal('show');
                    }
               });
            });

        </script>
    </body>
</html>


