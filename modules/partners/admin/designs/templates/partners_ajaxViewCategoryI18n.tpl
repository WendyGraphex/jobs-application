<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Category")}</h3>
        <h3 class="admin-header-small-text">{__("PartnerWork Category Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('PartnerWork Category')}
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
           <a class="nav-link" id="icon-tab" data-toggle="tab" href="#icon" role="tab" aria-controls="icon" aria-selected="false">{__('Icon')} </a>
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
                      <div class="field_with_errors"><input class="PartnerWorkCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('url')}" name="url" id="url"></div>
                    </div>
                </div>
                  <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.title->hasError()}<div class="alert alert-{if $form.category_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.title->getError()}</div>{/if}
                      <label for="title">{__('Title')}{if $form->category_i18n.title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="PartnerWorkCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                    </div>
                  </div>
                     <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_title->hasError()}<div class="alert alert-{if $form.category_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_title->getError()}</div>{/if}
                      <label for="meta_title">{__('Meta title')}{if $form->category_i18n.meta_title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="PartnerWorkCategoryI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_title')}" name="meta_title" id="meta_title"></div>
                    </div>
                  </div>
                     <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_description->hasError()}<div class="alert alert-{if $form.category_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_description->getError()}</div>{/if}
                      <label for="meta_description">{__('Description')}{if $form->category_i18n.meta_description->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="PartnerWorkCategoryI18n form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea></div>
                    </div>
                  </div>
                    <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_keywords->hasError()}<div class="alert alert-{if $form.category_i18n.meta_keywords->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_keywords->getError()}</div>{/if}
                      <label for="meta_keywords">{__('Keywords')}{if $form->category_i18n.meta_keywords->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="PartnerWorkCategoryI18n form-control Fields Input" type="text" name="meta_keywords" id="meta_keywords">{$item_i18n->get('meta_keywords')}</textarea></div>
                    </div>
                  </div>
                      <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.category_i18n.meta_robots->hasError()}<div class="alert alert-{if $form.category_i18n.meta_robots->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.meta_robots->getError()}</div>{/if}
                      <label for="meta_robots">{__('Robots')}{if $form->category_i18n.meta_robots->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="PartnerWorkCategoryI18n form-control Fields Input" type="text" name="meta_robots" id="meta_robots">{$item_i18n->get('meta_robots')}</textarea></div>
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
                          <input class="PartnerWorkCategory form-control Fields Input" type="text" value="{$item_i18n->getCategory()->get('name')}" name="name" id="name">
                      </div>
                    </div>                                                                        
                  </div>
          </div>
                      
                      
    <div class="tab-pane fade tab-pic" id="picture" role="tabpanel" aria-labelledby="picture-tab">  
        <div class="row portfolio-grid">
            <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                <figure class="effect-text-in ModeDisplay" id="Picture">
                   <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                    
                       <div id="NoPicture" {if $item_i18n->getCategory()->hasPicture()}style= "display:none;"{else}style="position: absolute;width: 96%;top: 25%;"{/if}>
                           <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                               <img id="NoPicture-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product">                                
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                       </div>
                       <div class="PictureExist" id="Picture" {if !$item_i18n->getCategory()->hasPicture()}style="display:none"{/if} {*style="position: absolute;top: 0px;"*}> 
                           <div class="div-img h-100">
                              <img id="Picture-img" {*style="position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;"*} class="img-dpzone img-product" src="{$item_i18n->getCategory()->getPicture()->getMedium()->getUrl()}"/>
                           </div> 
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                       </div>
                   </div>
                   <figcaption>                             
                   </figcaption>                          
                </figure>
            </div> 
            <div class="col-2">  
                <a href="#" class="list-action Mode" id="Picture" name="NORMAL"><i id="Picture" class="ModeAwe far fa-square"></i></a>
                <a href="#" {if !$item_i18n->getCategory()->hasPicture()}style="display:none"{/if} id="DeletePicture" name="{$item_i18n->getCategory()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
            </div>            
        </div>
    </div>    
            
            
    <div class="tab-pane fade tab-icon" id="icon" role="tabpanel" aria-labelledby="icon-tab">  
        <div class="row portfolio-grid">
            <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                <figure class="effect-text-in ModeDisplay" id="Icon">
                   <div id="DropZoneIcon" class="dropzone dp-addFile pt-1">                    
                       <div id="NoIcon" {if $item_i18n->getCategory()->hasIcon()}style= "display:none;"{else}style="position: absolute;width: 96%;top: 25%;left: 2%;"{/if}>
                           <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                               <img id="NoIcon-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product">                                
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                       </div>
                       
                           <div class="IconExist" id="Icon" {if !$item_i18n->getCategory()->hasIcon()}style="display:none"{/if} {*style="position: absolute;top: 0px;"*}> 
                           <div class="div-img h-100">
                              <img id="Icon-img" {*style="position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;"*} class="img-dpzone img-product" src="{$item_i18n->getCategory()->getIcon()->getMedium()->getUrl()}"/>
                           </div> 
                           <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                       </div>
                   </div>
                   <figcaption>                             
                   </figcaption>                          
                </figure>
            </div> 
            <div class="col-2">  
                <a href="#" class="list-action Mode" id="Icon" name="NORMAL"><i id="Icon" class="ModeAwe far fa-square"></i></a>
                <a href="#" {if !$item_i18n->getCategory()->hasIcon()}style="display:none"{/if} id="DeleteIcon" name="{$item_i18n->getCategory()->get('icon')}" class="list-action"><i class="fa fa-trash"></i></a>
            </div>            
        </div>
    </div>
                      
         
      <div class="tab-pane fade tab-pic" id="content" role="tabpanel" aria-labelledby="content-tab">  
          <textarea  id="Editor" name="content" rows="40" cols="80" style="margin-top: 15px;" class="Editor PartnerWorkCategoryI18n Input Fields form-control">{$item_i18n->get('content')}</textarea>
    </div>            
</div>
<script type="text/javascript">       
    
     $( '#Editor' ).ckeditor({
             height: $(window).height()
        }); 
     
    
        
        function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
    }
    
    
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function() {                
             return $.ajax2({ data: { PartnerWorkCategoryNode : { node: '{if $item_i18n->getCategory()->isRoot()}{else}{$item_i18n->getCategory()->getFather()->get('id')}{/if}', 
                                             lang : '{$item_i18n->get('lang')}', 
                                             token : '{mfForm::getToken('PartnerWorkCategoryForm')}' }  },                              
                              url : "{url_to('partners_ajax',['action'=>'ListPartialCategory'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function() {
            var  params= {            
                                PartnerWorkCategoryI18n: { 
                                   category_i18n : { category_id: '{$item_i18n->getCategory()->get('id')}',lang: '{$item_i18n->get('lang')}'  },
                                   category : { },
                                   products : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".PartnerWorkCategoryI18n.Input").each(function() { params.PartnerWorkCategoryI18n.category_i18n[this.name]=$(this).val(); });
          $(".PartnerWorkCategory.Input").each(function() {  params.PartnerWorkCategoryI18n.category[this.name]=$(this).val();  });  
          $(".PartnerWorks-list").each(function() { params.PartnerWorkCategoryI18n.products.push($(this).attr('id'));  }); 
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                           
                           url: "{url_to('partners_ajax',['action'=>'SaveCategoryI18n'])}",
                           target: "#actions"}); 
        });                     
        
        
      $("#AddPartnerWorks").click(function () {           
           var params = { AddPartnerWorksForCategory : {  lang : '{$item_i18n->get('lang')}' ,selection: $("#DialogPartnerWorkList").data('selection'), token : '{mfForm::getToken('AddPartnerWorksForViewCategoryForm')}' } };                    
           return $.ajax2({  
                         data : params,
                         url:"{url_to('partners_ajax',['action'=>'AddPartnerWorksForViewCategory'])}",                                              
                          success : function () {   $("#Modal-PartnerWorks").hide(); },
                          target: "#PartnerWorks-ctn"
                       }); 
     }); 
     
       $("#Modal-PartnerWorks-Close").click(function () {  $("#Modal-PartnerWorks").hide(); });
       
       
       $(".PartnerWorkDelete").click(function () { 
          if (!confirm('{__("PartnerWork [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
          $(".PartnerWorks-list[id="+$(this).attr('id')+"]").remove();           
        });
                      
       
       $("#DialogPartnerWorks").click(function () { 
         var params = { filter: { lang: '{$item_i18n->get('lang')}', 
                                            selection : [ ], 
                                            token : "{mfForm::getToken('DialogPartnerWorkFormFilter')}" } };   
        $(".PartnerWorks-list").each(function() { params.filter.selection.push($(this).attr('id'));  }); 
        return $.ajax2({      
                         data : params,
                         url:"{url_to('partners_ajax',['action'=>'ListPartialDialogPartnerWorkForCategory'])}",                                              
                         success : function () { $("#Modal-PartnerWorks").show(); },
                         target: "#Modal-PartnerWorks-ctn"
                       });     
     });  
     
     
     $("#PartnerWorks tbody").sortable({
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
    
    $(".PartnerWorkCategoryPictureDelete").click(function () { 
          if (!confirm('{__("Picture [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;    
          return $.ajax2({      
                         data : { PartnerWorkCategoryPicture : $(this).attr('id') },
                         url:"{url_to('partners_ajax',['action'=>'DeleteCategoryPicture'])}",                                              
                         success : function (resp) { 
                             if (resp.action !='DeleteCategoryPicture') return ;
                             $(".Pictures[id="+resp.id+"]").remove(); 
                             $(".PicturesCount").each( function (id) { $(this).html(id+1); })
                         }                         
                       });            
        });
        
            
    $(".PartnerWorkCategoryPictureChangeIsActive").click(function () {
            return $.ajax2({
                 data: {  PartnerWorkCategoryPictureChangeIsActive : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('partners_ajax',['action'=>'ChangePartnerWorkCategoryPictureIsActive'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangePartnerWorkCategoryPictureIsActive') return ;
                    change('PartnerWorkCategoryPictureChangeIsActive',resp);
                }
            });
     });
     
    $(".PartnerWorkCategoryPictureView").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").hide();
            $(".picture-input[id="+$(this).attr('id')+"]").show();
            $(".PartnerWorkCategoryPictureActions[id="+$(this).attr('id')+"]").show();
            $(this).hide();            
    });
    
     $(".PartnerWorkCategoryPictureCancel").click(function () { 
            $(".picture-title[id="+$(this).attr('id')+"]").show();
            $(".picture-input[id="+$(this).attr('id')+"]").hide();
            $(".PartnerWorkCategoryPictureActions[id="+$(this).attr('id')+"]").hide();
            $(".PartnerWorkCategoryPictureView[id="+$(this).attr('id')+"]").show();                  
    });  
    
    $(".PartnerWorkCategoryPictureSave").click(function () { 
        var params = { PartnerWorkCategoryPictureI18n : { picture_id: $(this).attr('id'), 
                                              lang :'{$item_i18n->get('lang')}',
                                              token: '{mfForm::getToken('PartnerWorkCategoryPictureI18nViewForm')}' } };
        $(".PartnerWorkCategoryPictureI18n.Input[id="+$(this).attr('id')+"]").each(function () { params.PartnerWorkCategoryPictureI18n[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({
                 data : params,
                url: "{url_to('partners_ajax',['action'=>'SavePartnerWorkCategoryPictureI18n'])}",              
                success: function (resp) {
                      $(".PartnerWorkCategoryPictureActions[id="+resp.picture_id+"]").hide();
                      $(".PartnerWorkCategoryPictureView[id="+resp.picture_id+"]").show(); 
                      $(".picture-input[id="+resp.picture_id+"]").attr('placeholder',resp.title).hide();
                      $(".picture-title[id="+resp.picture_id+"]").html(resp.title).show();
                }
            });               
    });
     
        if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
                                                 
          $("#DropZonePicture").dropzone({
            url: "{url_to("partners_ajax",['action'=>'UploadPictureCategory'])}",
            clickable: false,
          //  dictDefaultMessage : "{if $item_i18n->getCategory()->hasPicture()}{__('Drop file to upload change')}{else}{__('Drop file to upload')}{/if}",
            params: { "PartnerWorkCategory[id]" : '{$item_i18n->get('category_id')}',                    
                      "UploadPictureCategory[token]" : '{mfForm::getToken('UploadPictureCategoryForm')}' 
                    },   
            paramName: "UploadPictureCategory[file]",
            parallelUploads : 1,
         //   maxFiles : 1,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPicturePartnerWork[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPicturePartnerWork[number_of_files]',this.files.length);
            },  */                  
            success : function (file,resp)
            {                                                                           
                 $("#DropZonePicture").find('.dz-preview').remove();                
                {if $item_i18n->getCategory()->hasPicture()}
                     $("#Picture-img").attr('src',resp.url).show();
                {else}
                    $("#NoPicture-img").attr('src',resp.url).show();
                    $("#NoPicture").show();
                {/if}            
            }                  
    }); 
    
                   
        $("#DeletePicture").click( function () { 
            if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            return $.ajax2({ data :{ Category: '{$item_i18n->get('category_id')}' },
                             url :"{url_to('partners_ajax',['action'=>'DeletePictureCategory'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeletePictureCategory') return ;                                          
                                   $(".PictureExist,#DeletePicture").hide();  
                                   $("#Picture-img").hide();
                                   //$("#NoPicture").show();
                                   $("#NoPicture").css({
                                        'display':'block',
                                        'position': 'absolute',
                                        'width': '96%',
                                        'top': '25%',
                                   });

                             }
                 });                                        
        }); 
            
            
        $("#DeleteIcon").click( function () { 
            if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            return $.ajax2({ data :{ Category: '{$item_i18n->get('category_id')}' },
                             url :"{url_to('partners_ajax',['action'=>'DeleteIconCategory'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeleteIconCategory') return ;                                          
                                   $(".IconExist,#DeleteIcon").hide();  
                                   //$("#NoPicture").show();
                                   $("#NoIcon").css({
                                        'display':'block',
                                        'position': 'absolute',
                                        'width': '96%',
                                        'top': '25%',
                                   });

                             }
                 });                                        
        }); 
            
            
{* ============== ICON ================================ *}
      if ($("#DropZoneIcon").find('.dz-default').length)
             $("#DropZoneIcon")[0].dropzone.off().destroy();
                                                 
          $("#DropZoneIcon").dropzone({
            url: "{url_to("partners_ajax",['action'=>'UploadIconCategory'])}",
           // clickable: false,
          //  dictDefaultMessage : "{if $item_i18n->getCategory()->hasIcon()}{__('Drop file to upload change')}{else}{__('Drop file to upload')}{/if}",
            params: { "PartnerWorkCategory[id]" : '{$item_i18n->get('category_id')}',                    
                      "UploadIconCategory[token]" : '{mfForm::getToken('UploadIconCategoryForm')}' 
                    },   
            paramName: "UploadIconCategory[file]",
            parallelUploads : 1,
         //   maxFiles : 1,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPicturePartnerWork[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPicturePartnerWork[number_of_files]',this.files.length);
            },  */           

            success : function (file,resp)
            {                                                                           
                $("#DropZoneIcon").find('.dz-preview').remove();                
                {if $item_i18n->getCategory()->hasIcon()}
                    $("#Icon-img").attr('src',resp.url).show();
                {else}
                    $("#NoIcon-img").attr('src',resp.url).show();
                    $("#NoIcon").show();
                {/if}            
            }              
    }); 
    
    
    
     $(".Mode").click(function () {
        if ($(this).attr('name')=='NORMAL')
        {
            $(this).attr('name','INVERSE');
            $(".ModeAwe[id="+$(this).attr('id')+"]").removeClass('far fa-square').addClass('fa fa-square-full');        
            $(".ModeDisplay[id="+$(this).attr('id')+"]").css('background-color','#000');                                      
        }
        else
        {
             $(this).attr('name','NORMAL');
             $(".ModeAwe[id="+$(this).attr('id')+"]").removeClass('fa fa-square-full').addClass('far fa-square');         
             $(".ModeDisplay[id="+$(this).attr('id')+"]").css('background-color','');                
        }
    });

</script>

{else}
    {__('Category is invalid.')}
{/if}    
