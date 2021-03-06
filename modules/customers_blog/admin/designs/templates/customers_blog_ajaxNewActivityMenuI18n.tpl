
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New")}</h3>
        <h3 class="admin-header-small-text">{__("Work ActivityMenu menu Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Work ActivityMenu menu')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New ActivityMenu menu')}
    </p>
</div>
        
{alerts}

{if $node->isLoaded()}    
<div class="tablewhiteback" style="padding: 20px;">
      <div class="row">
            <div class="form-group col-md-6">                                                   
             {component name="/site_languages/selectListLanguagesFrontend" selected=$item_i18n->get('lang')}
            </div>  
      </div>
      <ul class="nav nav-tabs" id="myTab" role="tablist">     
         <li class="nav-item">
           <a class="nav-link active" id="referencement-tab" data-toggle="tab" href="#referencement" role="tab" aria-controls="referencement" aria-selected="false">{__('Referencement')} </a>
         </li>        
             <li class="nav-item">
           <a class="nav-link " id="control-tab" data-toggle="tab" href="#control" role="tab" aria-controls="control" aria-selected="true">{__('Control')}</a>
         </li>
        {*   <li class="nav-item">
           <a class="nav-link" id="picture-tab" data-toggle="tab" href="#picture" role="tab" aria-controls="picture" aria-selected="false">{__('Picture')} </a>
         </li>*}
          <li class="nav-item" style="display: block ruby;">
           <span class="nav-link" id="activity-tab" data-toggle="tab" href="#activity" role="tab" aria-controls="activity" aria-selected="false" style="color: #2f7bff;cursor: pointer;">{__('Activity')}
               <a href="#" id="CustomerBlogActivityList" title="{__('Select a activity')}"> <i class="fa fa-list-ul" aria-hidden="true"></i></a>
           </span>          
         </li>
      </ul>
         
      <div class="tab-content" id="myTabContent" style="margin-top: 20px;">         
          <div class="tab-pane fade show active" id="referencement" role="tabpanel" aria-labelledby="referencement-tab">
                <div class="row">                                                                              
                    <div class="form-group col-md-12">
                      {if $form.menu_i18n.title->hasError()}<div class="alert alert-{if $form.menu_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu_i18n.title->getError()}</div>{/if}
                      <label for="title">{__('Title')}{if $form->menu_i18n.title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CustomerBlogActivityMenuI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title"></div>
                    </div>
                </div>                              
          </div>  
         
          <div class="tab-pane fade" id="control" role="tabpanel" aria-labelledby="control-tab">              
                  <div class="row">
                     <div class="form-group col-md-6">             
                        {if $form.menu.name->hasError()}<div class="alert alert-{if $form.menu.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu.name->getError()}</div>{/if}
                      <label for="name">{__('Name')}{if $form->menu.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CustomerBlogActivityMenu form-control Fields Input" type="text" value="{$item_i18n->getMenu()->get('name')}" name="name" id="name">
                      </div>
                    </div>                                                                        
                  </div>
          </div>
                      
         {* <div class="tab-pane fade tab-pic" id="picture" role="tabpanel" aria-labelledby="picture-tab">  
              <div class="row portfolio-grid">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
                     <figure class="effect-text-in ModeDisplay">
                        <div id="DropZonePicture" class="dropzone dp-addFile pt-0 ModeDisplay"> 
                            <i class="fa fa-plus plus-icon plus-icon1"></i> 
                            <div class="div-img h-100">
                               <img id="Picture-img" {if !$item_i18n->getMenu()->hasPicture()}style="display:none"{/if} class="img-dpzone img-product" {if $item_i18n->getMenu()->hasPicture()}src="{$item_i18n->getMenu()->getPicture()->getMedium()->getUrl()}"{/if} alt="image">
                           </div> 
                        </div>
                       <figcaption>                             
                       </figcaption>                          
                     </figure>
                </div>
                <div class="col-2">  
                    <a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>
                </div>           
              </div>
          </div>   *}              
        
       <div class="tab-pane fade tab-pic" id="activity" role="tabpanel" aria-labelledby="activity-tab">  
        <div id="activity-ctn">
            {if $item_i18n->getMenu()->hasActivity()}                
                <div class="CustomerBlogActivityMenu" name="activity_id" id="{$item_i18n->getMenu()->get('activity_id')}">
                    {$item_i18n->getMenu()->getActivity()->getI18n()}
                    <i class="deleteActivity fa fa-times" aria-hidden="true"></i>
                </div>
            {else}
                {__('No activity')}
            {/if}    
        </div>
    </div> 
            
</div>
</div>
        
        
<div class="modal fade" id="CustomerBlogActivityListDialog" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="CustomerBlogActivityListDialog-ctn" class="modal-body">
                
            </div>
            
             <div style="text-align: center;padding-bottom: 10px;">
                <button type="button" id="dialog-Select" class="btn btn-success" style="width: 120px;">{__('Select')}</button>
             </div>
        </div>
    </div>
</div>        
<script type="text/javascript">  
    
    $(".deleteActivity").click(function () { 
        $(".CustomerBlogActivityMenu").remove();
    }); 
    
    
    
     
       $("#DialogPartnerWorks").click(function () { 
             return $.ajax2({      
                         data : { CustomerBlogActivityMenu : { lang: $("#SelectListLanguages option:selected").attr('id'), 
                                            selection : $("#ActivityMenuPartnerWorks").data('selection'), 
                                            token : '{mfForm::getToken('DialogPartnerWorkFormFilter')}' } },
                         url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogPartnerWorkForActivityMenu'])}",                                              
                         success : function () { $("#Modal-PartnerWorks").show(); },
                         target: "#Modal-PartnerWorks-ctn"
                       });     
     });  
     
     $("#Modal-PartnerWorks-Close").click(function () {  $("#Modal-PartnerWorks").hide(); });
     
     $(".CustomerBlogActivityMenuI18n.Input[name=title]").keyup(function () { 
         $(".CustomerBlogActivityMenuI18n.Input[name=url]").val("{$node->getUrlPathI18n()}"+$(this).val().cleanup());
     });
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerBlogActivityMenuNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityMenuForm')}' } },                                 
                              url : "{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function() {
            var  params= {      CustomerBlogActivityMenu: '{$node->get('id')}',
                                CustomerBlogActivityMenuI18n: { 
                                   menu_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   menu : { activity_id : $(".CustomerBlogActivityMenu[name=activity_id]").attr('id') },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerBlogActivityMenuI18n.Input").each(function() { params.CustomerBlogActivityMenuI18n.menu_i18n[this.name]=$(this).val(); });
          $(".CustomerBlogActivityMenu.Input").each(function() {  params.CustomerBlogActivityMenuI18n.menu[this.name]=$(this).val();  });  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                           
                           url: "{url_to('customers_blog_ajax',['action'=>'SaveNewActivityMenuI18n'])}",
                           target: "#actions"}); 
        });  
    
        
    $("#CustomerBlogActivityList").click(function () { 
             return $.ajax2({    data : { CustomerBlogActivityNode : {  
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             selected:  '{$item_i18n->getMenu()->get('activity_id')}',
                                             token : '{mfForm::getToken('CustomerBlogActivityNodeDialogForm')}' } },
                                 url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}",
                                 target: "#CustomerBlogActivityListDialog-ctn",
                                 success : function () {  $("#CustomerBlogActivityListDialog").modal('show'); }
                });
               
        });
        
        
        $("#dialog-Select").click(function () {            
            return $.ajax2({    data : { CustomerBlogActivityNode : $("#DialogCustomerBlogActivityList").data('selected') },
                                 url:"{url_to('customers_blog_ajax',['action'=>'SelectActivity'])}",
                                 target: "#activity-ctn",
                                 success : function () {  $("#CustomerBlogActivityListDialog").modal('hide'); }
                });
        });
</script>
{else}
    {__('Node is invalid.')}
{/if}    