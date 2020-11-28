<div class="ModalGetQuote modal-dialog modal-lg" style="width: 50%;">
    <div class="modal-content">
        <div class="modal-header">         
            <button type="button" class="ModalGetQuote-close close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="row row-imageText-modal">
                <div class="">
                    <div class="ImageAtModal">
                        <span class="is-online-on-modal"></span>
                        <span class="spanImage-on-modal">
                            {if $item_i18n->getAdvert()->getEmployeeUser()->hasAvatar()}
                                <img height="32px" src="{$item_i18n->getAdvert()->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
                            {else}
                                <img height="32px" src="/web/pictures/inconnu-profile.jpg"/>
                            {/if}
                        </span>
                    </div>
                </div>
                <div class="name-salut">
                    <a href="{$item_i18n->getAdvert()->getEmployeeUser()->getUrl()}">
                        <h5>{$item_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getUsername()->ucfirst()}</h5>
                    </a>
                    <p class="parag-1-modal">{__('Hi! please provide you details under below. Wait for feed-back')}</p>
                </div>
            </div>
            <p class="parag-2-modal" style="margin-top: 14px;color: #4a4747;font-weight: 600;">{__("Hi! Please provide in the box below some details on how you can help me getting the job done, and I will get back to you ASAP.” Et puis dans la partie où les lettres sont écrites en grasses “ Please be as detailed as possible. how much can you do job and in how many days can you complete the job?”")}</p>
            <div style="position: relative;">
                <textarea id="Description" placeholder="{__('Describe your service')}" class="" style="height: 150px !important;position: relative;"></textarea>
                <label id="NbCharText" class="charNum">{__('Max characters is %s',$max_characters)}</label>
                <label class="MinChar">{__('Min characters is 200')}</label>
            </div>

            {component name="/employers_project/ListProjectsDialog"}

            <div style="text-align: center;">
                <button type="button" id="SendRequest" class="btn btn-success">{__('Send a request')}</button>
            </div>  
        </div>
    </div>
</div>
                                   
<script type="text/javascript">
        
    $('#Description').keyup(function () {                         
      $('#NbCharText').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });       
       
    $(".ModalGetQuote-close").click(function(){  $("#DialogEmployeeQuote").modal('hide');  });
            
       
    $("#SendRequest").click(function () { 
         var params = { EmployerAdvertRequest :  { description:  $("#Description").val(), projects : [], token :'{mfForm::getToken('EmployerAdvertRequestForm')}' }  };
         $(".EmployerProject").each(function () { params.EmployerAdvertRequest.projects.push($(this).attr('id')); });
         return $.ajax2({ data : params,               
                          url :"{url_to('sales_quotation_ajax',['action'=>'SendRequest'])}",   
                          success : function (resp) { 
                            if (resp.action !='SendRequest') return ;
                            if (resp.errors)
                            {
                                $('#Description').keyup(function () { 
                                    $("#Description").removeClass('intro');
                                });
                               $("#Description").addClass('intro');
                                return ;
                            }
                            $("#DialogEmployeeQuote").modal('hide'); 
                            $("#myModalMO").modal('show');
                            $("#EmployeeRequestDialog-text").html("{$item_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getUsername()->ucfirst()}");
                          }                         
          }); 
     });
</script> 