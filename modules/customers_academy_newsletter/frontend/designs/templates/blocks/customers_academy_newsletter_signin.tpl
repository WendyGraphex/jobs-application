  {*  <section class="ftco-section-parallax">
        <div class="parallax-img d-flex align-items-center">
          <div class="container">
            <div class="row d-flex justify-content-center">
              <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                <h2>Subcribe to our Newsletter</h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                <div class="row d-flex justify-content-center mt-4 mb-4">
                  <div class="col-md-8">
                    <form action="#" class="subscribe-form">
                      <div class="form-group d-flex">
                        <input type="text" class="form-control" placeholder="Enter email address">
                        <input type="submit" value="Subscribe" class="submit px-3">
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section> *}



<section class="ftco-section-parallax bg-yellow suscribe">
    <div class="parallax-img d-flex align-items-center" style="background-color: transparent;padding: 0px;">
          <div class="container">
            <div class="row d-flex justify-content-center">
              <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                <h2 style="color: #0854ba;font-weight: 600 !important;">{__('Subscribe to our Newsletter')}</h2>
                <h4 class="msg-has-been-send" style="display:none;">{__('Your email has been created for newsletter.')}</h4>
                <div class="row d-flex justify-content-center mt-4 mb-4">
                  <div class="col-md-8">                  
                      <div class="form-group d-flex">
                        <input type="text" class="form-control CustomerAcademyNewsletter" name="email" placeholder="{__('Enter email address')}" style="border-radius: 0px;"/>
                        <button id="NewletterSignin" class="submit px-3 btn btn-primary" style="background-color: #102fdd;border-color: #102fdd;font-weight: bold;border-radius: 0px;">{__('Subscribe')}</button>
                      </div>                     
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>                      
            
    <script type="text/javascript">
        $(function(){
            
            $('.CustomerAcademyNewsletter').keyup(function () { 
                $(".CustomerAcademyNewsletter").removeClass('intro');
            });

             $("#NewletterSignin").click(function () { 
              return $.ajax2({  data : { CustomerAcademyNewsletter: { email : $(".CustomerAcademyNewsletter[name=email]").val(), token :'{mfForm::getToken('CustomerAcademyNewsletterSigninForm')}' } },                               
                                   url:"{url_to('customers_academy_newsletter_ajax',['action'=>'Signin'])}", 
                                   success : function (resp)
                                    {             
                                        if (resp.action !='Signin') return ;
                                        if (resp.errors) {                                          
                                            $(".CustomerAcademyNewsletter").addClass("intro");
                                            return ;
                                        }                                       
                                        $(".msg-has-been-send").show();
                                        $(".CustomerAcademyNewsletter[name=email]").val(""); 
                                    }
                 });
             });
         });
    </script>