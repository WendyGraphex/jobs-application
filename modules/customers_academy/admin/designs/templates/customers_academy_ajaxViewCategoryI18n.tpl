<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Category")}</h3>
        <h3 class="admin-header-small-text">{__("CustomerCourseCategory Category Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CustomerCourseCategory Category')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Category [%s]',$item_i18n->get('title'))}
    </p>
</div>
{alerts}    
    {if $item_i18n->getCategory()->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">
     <div class="row">
          <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
        </div>
                    
      <ul class="nav nav-tabs" id="myTab" role="tablist">
           <li class="nav-item">
           <a class="nav-link active" id="referencement-tab" data-toggle="tab" href="#referencement" role="tab" aria-controls="referencement" aria-selected="false">{__('Referencement')} </a>
         </li>     
         <li class="nav-item">
           <a class="nav-link" id="control-tab" data-toggle="tab" href="#control" role="tab" aria-controls="control" aria-selected="true">{__('Control')}</a>
         </li>            
           <li class="nav-item">
           <a class="nav-link" id="picture-tab" data-toggle="tab" href="#picture" role="tab" aria-controls="picture" aria-selected="false">{__('Picture')} </a>
         </li>
           <li class="nav-item">
           <a class="nav-link" id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="false">{__('Content')} </a>
         </li>
       {*  <li class="nav-item">
           <a class="nav-link" id="pictures-tab" data-toggle="tab" href="#pictures" role="tab" aria-controls="pictures" aria-selected="false">{__('Pictures')} </a>
         </li>*}
      </ul>
         
      <div class="tab-content" id="myTabContent">         
          <div class="tab-pane fade show active" id="referencement" role="tabpanel" aria-labelledby="referencement-tab">
                <div class="row">                                                                              
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.url->hasError()}<div class="alert alert-{if $form.category_i18n.url->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.url->getError()}</div>{/if}
                      <label for="url">{__('Url')}{if $form->category_i18n.url->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CustomerCourseCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('url')}" name="url" id="url"></div>
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
              {* <div class="row">
                    <div class="form-group col-md-6">                               
                     <label for="Language">{__('Language')}</label>    
                     <img src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{$item_i18n->getFormatter()->getLanguage()->getFormatted()}"/>                  
                    </div>
               </div> *}
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
            <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                <figure class="effect-text-in ModeDisplay">
                   <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                    
                       <div id="NoPicture" {if $item_i18n->getCategory()->hasPicture()}style= "display:none"{/if}>
                           <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                               <img id="Picture-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product" alt="image">                                
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                       </div>
                       <div id="Picture" {if !$item_i18n->getCategory()->hasPicture()}style="display:none"{/if} style="position: absolute;top: 0px;"> 
                           <div class="div-img h-100">
                              <img id="Picture-img" {*style="position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;"*} class="img-dpzone img-product" src="{$item_i18n->getCategory()->getPicture()->getMedium()->getUrl()}" alt="image">
                           </div> 
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                       </div>
                   </div>
                   <figcaption>                             
                   </figcaption>                          
                </figure>
            </div> 
            <div class="col-2">  
                <a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>
                <a href="#" {if !$item_i18n->getCategory()->hasPicture()}style="display:none"{/if} id="DeletePicture" name="{$item_i18n->getCategory()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
            </div>            
        </div>
    </div>    
                      
         
      <div class="tab-pane fade tab-pic" id="content" role="tabpanel" aria-labelledby="content-tab">  
          <textarea  name="content" rows="15" cols="80" style="margin-top: 15px;" class="CustomerCourseCategoryI18n Input Fields form-control">{$item_i18n->get('content')}</textarea>
    </div>            
</div>
<script type="text/javascript">              
        function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
    }
    
    
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function() {                
             return $.ajax2({ data: { CustomerCourseCategory : { node: '{$item_i18n->getCategory()->getFather()->get('id')}', 
                                             lang : '{$item_i18n->get('lang')}', 
                                             token : '{mfForm::getToken('CustomerCourseCategoryForm')}' }  },                              
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialCategory'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function() {
            var  params= {            
                                CustomerCourseCategoryI18n: { 
                                   category_i18n : { category_id: '{$item_i18n->getCategory()->get('id')}',lang: '{$item_i18n->get('lang')}'  },
                                   category : { },
                                   products : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerCourseCategoryI18n.Input").each(function() { params.CustomerCourseCategoryI18n.category_i18n[this.name]=$(this).val(); });
          $(".CustomerCourseCategory.Input").each(function() {  params.CustomerCourseCategoryI18n.category[this.name]=$(this).val();  });  
          $(".CustomerCourseCategorys-list").each(function() { params.CustomerCourseCategoryI18n.products.push($(this).attr('id'));  }); 
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                           
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveCategoryI18n'])}",
                           target: "#actions"}); 
        });                     
        
        
      $("#AddCustomerCourseCategorys").click(function () {           
           var params = { AddCustomerCourseCategorysForCategory : {  lang : '{$item_i18n->get('lang')}' ,selection: $("#DialogCustomerCourseCategoryList").data('selection'), token : '{mfForm::getToken('AddCustomerCourseCategorysForViewCategoryForm')}' } };                    
           return $.ajax2({  
                         data : params,
                         url:"{url_to('customers_academy_ajax',['action'=>'AddCustomerCourseCategorysForViewCategory'])}",                                              
                          success : function () {   $("#Modal-CustomerCourseCategorys").hide(); },
                          target: "#CustomerCourseCategorys-ctn"
                       }); 
     }); 
     
       $("#Modal-CustomerCourseCategorys-Close").click(function () {  $("#Modal-CustomerCourseCategorys").hide(); });
       
       
       $(".CustomerCourseCategoryDelete").click(function () { 
          if (!confirm('{__("CustomerCourseCategory [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
          $(".CustomerCourseCategorys-list[id="+$(this).attr('id')+"]").remove();           
        });
                      
       
       $("#DialogCustomerCourseCategorys").click(function () { 
         var params = { filter: { lang: '{$item_i18n->get('lang')}', 
                                            selection : [ ], 
                                            token : "{mfForm::getToken('DialogCustomerCourseCategoryFormFilter')}" } };   
        $(".CustomerCourseCategorys-list").each(function() { params.filter.selection.push($(this).attr('id'));  }); 
        return $.ajax2({      
                         data : params,
                         url:"{url_to('customers_academy_ajax',['action'=>'ListPartialDialogCustomerCourseCategoryForCategory'])}",                                              
                         success : function () { $("#Modal-CustomerCourseCategorys").show(); },
                         target: "#Modal-CustomerCourseCategorys-ctn"
                       });     
     });  
     
     
     $("#CustomerCourseCategorys tbody").sortable({
        cursor: 'move',        
        stop: function () {
            $(".count").each(function (id) {  $(this).html(id + 1);  });           
        },      
         helper: function (e, tr) {           
            var helper = tr.clone();
            helper.children().each(function (index) {
              $(this).width(tr.children().eq(index).outerWidth(true));
            });          
            return helper;
            } 
        });             
    
    $(".CustomerCourseCategoryPictureDelete").click(function () { 
          if (!confirm('{__("Picture [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;    
          return $.ajax2({      
                         data : { CustomerCourseCategoryPicture : $(this).attr('id') },
                         url:"{url_to('customers_academy_ajax',['action'=>'DeleteCategoryPicture'])}",                                              
                         success : function (resp) { 
                             if (resp.action !='DeleteCategoryPicture') return ;
                             $(".Pictures[id="+resp.id+"]").remove(); 
                             $(".PicturesCount").each( function (id) { $(this).html(id+1); })
                         }                         
                       });            
        });
        
            
    $(".CustomerCourseCategoryPictureChangeIsActive").click(function () {
            return $.ajax2({
                 data: {  CustomerCourseCategoryPictureChangeIsActive : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('customers_academy_ajax',['action'=>'ChangeCustomerCourseCategoryPictureIsActive'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeCustomerCourseCategoryPictureIsActive') return ;
                    change('CustomerCourseCategoryPictureChangeIsActive',resp);
                }
            });
     });
     
    $(".CustomerCourseCategoryPictureView").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").hide();
            $(".picture-input[id="+$(this).attr('id')+"]").show();
            $(".CustomerCourseCategoryPictureActions[id="+$(this).attr('id')+"]").show();
            $(this).hide();            
    });
    
     $(".CustomerCourseCategoryPictureCancel").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").show();
            $(".picture-input[id="+$(this).attr('id')+"]").hide();
            $(".CustomerCourseCategoryPictureActions[id="+$(this).attr('id')+"]").hide();
            $(".CustomerCourseCategoryPictureView[id="+$(this).attr('id')+"]").show();                  
    });  
    
    $(".CustomerCourseCategoryPictureSave").click(function () { 
        var params = { CustomerCourseCategoryPictureI18n : { picture_id: $(this).attr('id'), 
                                              lang :'{$item_i18n->get('lang')}',
                                              token: '{mfForm::getToken('CustomerCourseCategoryPictureI18nViewForm')}' } };
        $(".CustomerCourseCategoryPictureI18n.Input[id="+$(this).attr('id')+"]").each(function () { params.CustomerCourseCategoryPictureI18n[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({
                 data : params,
                url: "{url_to('customers_academy_ajax',['action'=>'SaveCustomerCourseCategoryPictureI18n'])}",              
                success: function (resp) {
                      $(".CustomerCourseCategoryPictureActions[id="+resp.picture_id+"]").hide();
                      $(".CustomerCourseCategoryPictureView[id="+resp.picture_id+"]").show(); 
                      $(".picture-input[id="+resp.picture_id+"]").attr('placeholder',resp.title).hide();
                      $(".picture-title[id="+resp.picture_id+"]").html(resp.title).show();
                }
            });               
    });
     
        if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
                                                 
          $("#DropZonePicture").dropzone({
            url: "{url_to("customers_academy_ajax",['action'=>'UploadPictureCategory'])}",
            clickable: false,
          //  dictDefaultMessage : "{if $item_i18n->getCategory()->hasPicture()}{__('Drop file to upload change')}{else}{__('Drop file to upload')}{/if}",
            params: { "CustomerCourseCategory[id]" : '{$item_i18n->get('category_id')}',                    
                      "UploadPictureCategory[token]" : '{mfForm::getToken('UploadPictureCategoryForm')}' 
                    },   
            paramName: "UploadPictureCategory[file]",
            parallelUploads : 1,
         //   maxFiles : 1,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPictureCustomerCourseCategory[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPictureCustomerCourseCategory[number_of_files]',this.files.length);
            },  */                  
            success : function (file,resp)
            {              
                // console.log("Status="+response.status);
                // if (response.errors || response.status)                 
                ///     return ;                                               
                 $("#DropZonePicture").find('.dz-preview').remove();
                 //$("#DropZonePicture").find('.dz-default').show();
                 $("#Picture-img").attr('src',resp.url).show(); 
            }                  
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

        $("#DeletePicture").click( function () { 
                if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Category: '{$item_i18n->get('category_id')}' },
                                 url :"{url_to('customers_academy_ajax',['action'=>'DeletePictureCategory'])}",                               
                                 success : function(resp) {                                     
                                       if (resp.action!='DeletePictureCategory') return ;                                          
                                       $("#Picture,#DeletePicture").hide();  
                                       $("#NoPicture").show();
                                          
                                 }
                     });                                        
            });  
</script>

{else}
    {__('Category is invalid.')}
{/if}    
