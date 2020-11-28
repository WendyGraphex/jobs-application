
<div class="row admin-header-container">
    <div class="col-sm">       
        <h3 class="admin-header-big-text">{__("Academy Course Category Management")}</h3>
         <h3 class="admin-header-small-text">{__("New")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Academy Course Category')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Academy Course Category')}
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
           <li class="nav-item">
           <a class="nav-link" id="picture-tab" data-toggle="tab" href="#picture" role="tab" aria-controls="picture" aria-selected="false">{__('Picture')} </a>
         </li>
           <li class="nav-item">
           <a class="nav-link" id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="false">{__('Content')} </a>
         </li>
      </ul>
         
      <div class="tab-content" id="myTabContent">         
          <div class="tab-pane fade show active" id="referencement" role="tabpanel" aria-labelledby="referencement-tab">
                <div class="row">                                                                              
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.url->hasError()}<div class="alert alert-{if $form.category_i18n.url->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.url->getError()}</div>{/if}
                      <label for="url">{__('Url')}{if $form->category_i18n.url->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CustomerCourseCategoryI18n form-control Fields Input" type="text" value="{if $item_i18n->get('url')}{$item_i18n->get('url')}{else}{$node->getUrlPathI18n()}{/if}" name="url" id="url"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.title->hasError()}<div class="alert alert-{if $form.category_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.title->getError()}</div>{/if}
                      <label for="title">{__('Title')}{if $form->category_i18n.title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CustomerCourseCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_title->hasError()}<div class="alert alert-{if $form.category_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_title->getError()}</div>{/if}
                      <label for="meta_title">{__('Meta title')}{if $form->category_i18n.meta_title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CustomerCourseCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_title')}" name="meta_title" id="meta_title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_description->hasError()}<div class="alert alert-{if $form.category_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_description->getError()}</div>{/if}
                      <label for="meta_description">{__('Description')}{if $form->category_i18n.meta_description->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CustomerCourseCategoryI18n form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_keywords->hasError()}<div class="alert alert-{if $form.category_i18n.meta_keywords->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_keywords->getError()}</div>{/if}
                      <label for="meta_keywords">{__('Keywords')}{if $form->category_i18n.meta_keywords->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CustomerCourseCategoryI18n form-control Fields Input" type="text" name="meta_keywords" id="meta_keywords">{$item_i18n->get('meta_keywords')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_robots->hasError()}<div class="alert alert-{if $form.category_i18n.meta_robots->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_robots->getError()}</div>{/if}
                      <label for="meta_robots">{__('Robots')}{if $form->category_i18n.meta_robots->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CustomerCourseCategoryI18n form-control Fields Input" type="text" name="meta_robots" id="meta_robots">{$item_i18n->get('meta_robots')}</textarea></div>
                    </div>
                </div>
          </div>  
         
          <div class="tab-pane fade" id="control" role="tabpanel" aria-labelledby="control-tab">              
                  <div class="row">
                     <div class="form-group col-md-6">             
                        {if $form.category.name->hasError()}<div class="alert alert-{if $form.category.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category.name->getError()}</div>{/if}
                      <label for="name">{__('Name')}{if $form->category.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CustomerCourseCategory form-control Fields Input" type="text" value="{$item_i18n->getCategory()->get('name')}" name="name" id="name">
                      </div>
                    </div>                                                                        
                  </div>
          </div>
                      
          <div class="tab-pane fade tab-pic" id="picture" role="tabpanel" aria-labelledby="picture-tab">  
              <div class="row portfolio-grid">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
                     <figure class="effect-text-in ModeDisplay">
                        <div id="DropZonePicture" class="dropzone dp-addFile pt-0 ModeDisplay"> 
                            <i class="fa fa-plus plus-icon plus-icon1"></i> 
                            <div class="div-img h-100">
                               <img id="Picture-img" {if !$item_i18n->getCategory()->hasPicture()}style="display:none"{/if} class="img-dpzone img-product" {if $item_i18n->getCategory()->hasPicture()}src="{$item_i18n->getCategory()->getPicture()->getMedium()->getUrl()}"{/if} alt="image">
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
          </div>                 
        {*  <div class="tab-pane fade tab-pic" id="pictures" role="tabpanel" aria-labelledby="pictures-tab">
             <div class="row portfolio-grid">
                 <div class="Pictures col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
                  <figure class="effect-text-in">
                     <div id="DropZone" class="dropzone dp-addFile"> 
                       <i class="fa fa-plus plus-icon" ></i>
                     </div>
                    <figcaption>                             
                    </figcaption>                          
                  </figure>
                 </div>
             </div>
            
          </div> *}
          
      <div class="tab-pane fade tab-pic" id="content" role="tabpanel" aria-labelledby="content-tab">  
          <textarea  name="content" rows="15" cols="80" style="margin-top: 15px;" class="CustomerCourseCategoryI18n Input Fields form-control">{$item_i18n->get('content')}</textarea>
    </div>          
</div>
</div>                           
<script type="text/javascript">  
     
       $("#DialogCustomerCourseCategorys").click(function () { 
             return $.ajax2({      
                         data : { CustomerCourseCategory : { lang: $("#SelectListLanguages option:selected").attr('id'), 
                                            selection : $("#CategoryCustomerCourseCategorys").data('selection'), 
                                            token : '{mfForm::getToken('DialogCustomerCourseCategoryFormFilter')}' } },
                         url:"{url_to('customers_academy_ajax',['action'=>'ListPartialDialogCustomerCourseCategoryForCategory'])}",                                              
                         success : function () { $("#Modal-CustomerCourseCategorys").show(); },
                         target: "#Modal-CustomerCourseCategorys-ctn"
                       });     
     });  
     
     $("#Modal-CustomerCourseCategorys-Close").click(function () {  $("#Modal-CustomerCourseCategorys").hide(); });
     
     $(".CustomerCourseCategoryI18n.Input[name=title]").keyup(function () { 
         $(".CustomerCourseCategoryI18n.Input[name=url]").val("{$node->getUrlPathI18n()}"+$(this).val().cleanup());
     });
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerCourseCategory : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerCourseCategoryForm')}' } },                                 
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialCategory'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function() {
            var  params= {      CustomerCourseCategory: '{$node->get('id')}',
                                CustomerCourseCategoryI18n: { 
                                   category_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   category : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerCourseCategoryI18n.Input").each(function() { params.CustomerCourseCategoryI18n.category_i18n[this.name]=$(this).val(); });
          $(".CustomerCourseCategory.Input").each(function() {  params.CustomerCourseCategoryI18n.category[this.name]=$(this).val();  });  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                           
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveNewCategoryI18n'])}",
                           target: "#actions"}); 
        });  
    
        if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
          $("#DropZone").dropzone({
            url: "{url_to("customers_academy_ajax",['action'=>'UploadPictureCustomerCourseCategoryNewCategoryI18n'])}",
            clickable: false,
            params: { "CustomerCourseCategoryI18n[lang]" : $("#SelectListLanguages option:selected").attr('id') ,
                      "UploadPictureCustomerCourseCategory[token]" : '{mfForm::getToken('UploadPictureCustomerCourseCategoryNewForm')}' 
                    },   
            paramName: "UploadPictureCustomerCourseCategory[file]",
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPictureCustomerCourseCategory[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPictureCustomerCourseCategory[number_of_files]',this.files.length);
            },  */                  
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".Pictures:last").after(response); 
            }                  
    }); 
    
    
    $("#CustomerCourseCategorys tbody").sortable({
        cursor: 'move',        
        stop: function () {
            $(".count").each(function (id) {  $(this).html(id + 1);  });           
        },      
         helper: function (e, tr) {           
            var $helper = tr.clone();
            $helper.children().each(function (index) {
              $(this).width(tr.children().eq(index).outerWidth(true));
            });          
            return $helper;
            } 
        });
        
     $("#AddCustomerCourseCategorys").click(function () {           
           var params = { AddCustomerCourseCategorysForCategory : {  lang : '{$item_i18n->get('lang')}' ,selection: $("#DialogCustomerCourseCategoryList").data('selection'), token : '{mfForm::getToken('AddCustomerCourseCategorysForViewCategoryForm')}' } };                    
           return $.ajax2({  
                         data : params,
                         url:"{url_to('customers_academy_ajax',['action'=>'AddCustomerCourseCategorysForNewCategory'])}",                                              
                          success : function () {   $("#Modal-CustomerCourseCategorys").hide(); },
                          target: "#CustomerCourseCategorys-ctn"
                       }); 
     });  
     
     $(".Mode").click(function () {
               if ($(this).attr('name')=='NORMAL')
               {
                   $(this).attr('name','INVERSE');
                   $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                   $(".ModeDisplay").css('background-color','#000');
                   
                   
               }
               else
               {
                    $(this).attr('name','NORMAL');
                   $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                   $(".ModeDisplay").css('background-color','');
                 // $(".dz-message").css('color','#ffff');
               }
          });
</script>
{else}
    {__('Node is invalid.')}
{/if}    