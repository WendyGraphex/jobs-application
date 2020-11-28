    <div class="ModalMakeOffer modal-dialog modal-lg" style="width: 50%;">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="ModalMakeOffer-close close" data-dismiss="modal">&times;</button>
            </div>              
            <div class="modal-body">       
                <h4>{$item_i18n->getFormatter()->getTitle()->ucfirst()}</h4>
                 <div class="row row-imageText-modal">
                    <div class="">
                        <div class="ImageAtModal">
                            <span class="is-online-on-modal"></span>
                            <span class="spanImage-on-modal">
                                {if $item_i18n->getAdvert()->getEmployerUser()->hasAvatar()}
                                    <img height="32px" src="{$item_i18n->getAdvert()->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
                                {else}
                                    <img height="32px" src="/web/pictures/inconnu-profile.jpg"/>
                                {/if}
                            </span>
                        </div>
                    </div>
                    <div class="name-salut">
                         <a href="{$item_i18n->getAdvert()->getEmployerUser()->getUrl()}">
                        <h5>{$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}</h5>
                         </a>
                        <p class="parag-1-modal">{__('Hi! please provide you details under below. Wait for feed-back')}</p>
                    </div>
                </div> 
                    {*<div>
                        {$item_i18n->getFormatter()->getTitle()->ucfirst()}
                    </div>*}
                 <p class="parag-2-modal" style="margin-top: 14px;color: #4a4747;font-weight: 600;">{__('Describe the service you re looking to purchase - please be as detailled as possible')}</p>              
                <div style="position: relative;">
                    <textarea id="Description" placeholder="{__('Describe your service')}" name="description" class="EmployeeAdvertOffer Input" style="height: 150px !important;position: relative;"></textarea>
                    <label id="NbCharText" class="charNum">{__('Max characters is 500')}</label>
                    <label class="MinChar">{__('Min characters is 200')}</label>
                </div>             
                 <div style="text-align: center;margin-top: 20px;">
                    <label style="position: relative;">
                        <input id="PriceOrder" type="text" class="form-control EmployeeAdvertOffer Input" name="price" placeholder="{__('Enter your price')}" style="height: 40px !important;"/>
                        <span style="position: absolute;top: 1px;right: 10px;font-size: 21px;">$</span>
                    </label>
                    <div>
                        <button type="button" id="SendOffer" class="btn btn-success">{__('Send my offer')}</button>
                    </div>
                </div>            
            </div>
          </div>
        </div>  
                    

            
            
<script type="text/javascript">
    
    $('#Description').keyup(function () {                         
      $('#NbCharText').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });      
        
    $(".ModalMakeOffer-close").click(function(){  $("#DialogEmployeeMakeOffer").modal('hide');  });
     
     
      $("#SendOffer").click(function () { 
         var params = { EmployeeAdvertOffer :  { token :'{mfForm::getToken('EmployeeAdvertOfferForm')}' }  }; 
         $(".EmployeeAdvertOffer.Input").each(function () { params.EmployeeAdvertOffer[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({ data : params,               
                          url :"{url_to('sales_quotation_ajax',['action'=>'SendOffer'])}",   
                          success : function (resp) { 
                                if (resp.action !='SendOffer') return ;
                                if (resp.errors)
                                {
                                    $('.Input').keyup(function () { 
                                        $(".EmployeeAdvertOffer").removeClass('intro');
                                    });
                                    $("#Description").addClass('intro');
                                    $("#PriceOrder").addClass('intro');
                                    return ;
                                }
                              
                                {*$("#DialogEmployeeMakeOffer").css("visibility", "hidden");
                                $('#DialogEmployeeMakeOffer').modal('hide');
                                $("#myModalMO").css("visibility", "visible"); 
                                $("#myModalMO").modal('show');*}
                              
                              
                              {*$('#DialogEmployeeMakeOffer').on('shown', function () {
                                    $('#DialogEmployeeMakeOffer').modal('hide');
                              });*}
                              
                            $("#DialogEmployeeMakeOffer").modal('hide'); 
                            $("#myModalMO").modal('show');
                            $("#EmployerRequestDialog-text").html("{$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}");
                          }                         
          }); 
     });
   
       
   
</script>        