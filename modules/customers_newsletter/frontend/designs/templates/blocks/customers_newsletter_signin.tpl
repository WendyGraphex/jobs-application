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



<section class="ftco-section-parallax">
        <div class="parallax-img d-flex align-items-center">
          <div class="container">
            <div class="row d-flex justify-content-center">
              <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                <h2>{__('Subscribe to our Newsletter')}</h2>
                <h4 class="msg-has-been-send" style="display:none;">{__('Your email has been created for newsletter.')}</h4>
                <div class="row d-flex justify-content-center mt-4 mb-4">
                  <div class="col-md-8">                  
                      <div class="form-group d-flex">
                        <input type="text" class="form-control CustomerNewsletter" name="email" placeholder="{__('Enter email address')}" style="border-radius: 0px;"/>
                        <button id="NewletterSignin" class="submit px-3 btn">{__('Subscribe')}</button>
                      </div>                     
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>
                        
 {* <div class="modal" id="NewsletterModal">
        <div class="modal-dialog">
          <div class="modal-content">              
            <div class="modal-header">
              <h4 class="modal-title">{__('Newletter')}</h4>
              <button type="button" class="close" id="NewsletterModal-close" data-dismiss="modal">&times;</button>
            </div>                
            <div class="modal-body">
              {__('Your email has been created for newsletter.')}
            </div>               
          </div>
        </div>
      </div> *}        
            
    <script type="text/javascript">
           $(function(){

                $("#NewletterSignin").click(function () {  
                  
                    return $.ajax2({  data : { CustomerNewsletter: { email : $(".CustomerNewsletter[name=email]").val(), token :'{mfForm::getToken('CustomerNewsletterSigninForm')}' } },                               
                                      url:"{url_to('customers_newsletter_ajax',['action'=>'Signin'])}", 
                                      success : function (resp)
                                            {             
                                                if (resp.action !='Signin') return ;
                                                if (resp.errors) {
                                                  $('.CustomerNewsletter').keyup(function () { 
                                                        $(".CustomerNewsletter").removeClass('intro');
                                                    });
                                                  $(".CustomerNewsletter").addClass("intro");
                                                  return ;
                                                }
                                                //$("#NewsletterModal").show();
                                                $(".msg-has-been-send").show();
                                                $(".CustomerNewsletter[name=email]").val("");
                                            }
                    });
                });

                {*$("#NewsletterModal-close").click(function () {  $("#NewsletterModal").hide(); });*}
            });
    </script>