<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New")}</h3>
        <h3 class="admin-header-small-text">{__("Work Activity Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Work Activity')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Activity')}
    </p>
</div>

{alerts}

{if $node->isLoaded()}    
    <div id="Activity-ctn" {if $form->hasActivity()}data-id="{$form->getActivity()->get('id')}"{/if} class="tablewhiteback" style="padding: 20px;">
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
                <a class="nav-link" id="icon-tab" data-toggle="tab" href="#icon" role="tab" aria-controls="icon" aria-selected="false">{__('Icon')} </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="false">{__('Content')} </a>
            </li>
        </ul>

        <div class="tab-content" id="myTabContent">         
            <div class="tab-pane fade show active" id="referencement" role="tabpanel" aria-labelledby="referencement-tab">
                <div class="row">                                                                              
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.url->hasError()}<div class="alert alert-{if $form.activity_i18n.url->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.url->getError()}</div>{/if}
                        <label for="url">{__('Url')}{if $form->activity_i18n.url->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors"><input class="CustomerBlogActivityI18n form-control Fields Input" type="text" value="{if $item_i18n->get('url')}{$item_i18n->get('url')}{else}{$node->getUrlPathI18n()}{/if}" name="url" id="url"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.title->hasError()}<div class="alert alert-{if $form.activity_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.title->getError()}</div>{/if}
                        <label for="title">{__('Title')}{if $form->activity_i18n.title->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors"><input class="CustomerBlogActivityI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.meta_title->hasError()}<div class="alert alert-{if $form.activity_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.meta_title->getError()}</div>{/if}
                        <label for="meta_title">{__('Meta title')}{if $form->activity_i18n.meta_title->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors"><input class="CustomerBlogActivityI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_title')}" name="meta_title" id="meta_title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.meta_description->hasError()}<div class="alert alert-{if $form.activity_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.meta_description->getError()}</div>{/if}
                        <label for="meta_description">{__('Description')}{if $form->activity_i18n.meta_description->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors">
                            <textarea cols="80" rows="2" class="CustomerBlogActivityI18n form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.meta_keywords->hasError()}<div class="alert alert-{if $form.activity_i18n.meta_keywords->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.meta_keywords->getError()}</div>{/if}
                        <label for="meta_keywords">{__('Keywords')}{if $form->activity_i18n.meta_keywords->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors">
                            <textarea cols="80" rows="2" class="CustomerBlogActivityI18n form-control Fields Input" type="text" name="meta_keywords" id="meta_keywords">{$item_i18n->get('meta_keywords')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        {if $form.activity_i18n.meta_robots->hasError()}<div class="alert alert-{if $form.activity_i18n.meta_robots->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.meta_robots->getError()}</div>{/if}
                        <label for="meta_robots">{__('Robots')}{if $form->activity_i18n.meta_robots->getOption('required')}*{/if}</label>            
                        <div class="field_with_errors">
                            <textarea cols="80" rows="2" class="CustomerBlogActivityI18n form-control Fields Input" type="text" name="meta_robots" id="meta_robots">{$item_i18n->get('meta_robots')}</textarea></div>
                    </div>
                </div>
            </div>  

            <div class="tab-pane fade" id="control" role="tabpanel" aria-labelledby="control-tab">              
                <div class="row">
                    <div class="form-group col-md-6">             
                        {if $form.activity.name->hasError()}<div class="alert alert-{if $form.activity.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity.name->getError()}</div>{/if}
                        <label for="name">{__('Name')}{if $form->activity.name->getOption('required')}*{/if}</label>           
                        <div class="field_with_errors">
                            <input class="CustomerBlogActivity form-control Fields Input" type="text" value="{$item_i18n->getActivity()->get('name')}" name="name" id="name">
                        </div>
                    </div>                                                                        
                </div>
            </div>

            <div class="tab-pane fade tab-pic" id="picture" role="tabpanel" aria-labelledby="picture-tab">  
                <div class="row portfolio-grid">
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                        <figure class="effect-text-in ModeDisplay" id="Picture">
                            <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                                                  
                                {if $form->hasActivity()}
                                    {if $form->getActivity()->hasPicture()}
                                        <div class="PictureExist" id="Picture"> 
                                            <div class="div-img h-100">
                                                <img id="Picture-img" class="img-dpzone img-product" src="{$form->getActivity()->getPicture()->getMedium()->getUrl()}"/>
                                            </div> 
                                            <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                                        </div>                               
                                    {/if}
                                {else}
                                    <div id="NoPicture" style="position: absolute;width: 96%;top: 25%;" {if $item_i18n->getActivity()->hasPicture()}style= "display:none;"{/if}>
                                        <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                                        <img id="Picture-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product" alt="image">                                
                                        <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                                    </div>   
                                {/if}
                            </div>
                            <figcaption>                             
                            </figcaption>                          
                        </figure>
                    </div>
                    <div class="col-2">  
                        <a href="#" class="list-action Mode" id="Picture" name="NORMAL"><i id="Picture" class="ModeAwe far fa-square"></i></a>
                        <a href="#" style="display:none" id="DeletePicture" name="{$item_i18n->getActivity()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
                    </div>           
                </div>
            </div>

            <div class="tab-pane fade tab-icon" id="icon" role="tabpanel" aria-labelledby="icon-tab">  
                <div class="row portfolio-grid">
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                        <figure class="effect-text-in ModeDisplay" id="Icon">
                            <div id="DropZoneIcon" class="dropzone dp-addFile pt-1">                                                  
                                {if $form->hasActivity()}
                                    {if $form->getActivity()->hasIcon()}
                                        <div class="IconExist" id="Icon"> 
                                            <div class="div-img h-100">
                                                <img id="Icon-img" class="img-dpzone img-product" src="{$form->getActivity()->getIcon()->getMedium()->getUrl()}"/>
                                            </div> 
                                            <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                                        </div>                               
                                    {/if}
                                {else}
                                    <div id="NoIcon" style="position: absolute;width: 96%;top: 25%;left: 2%;" {if $item_i18n->getActivity()->hasIcon()}style= "display:none;"{/if}>
                                        <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                                        <img id="Icon-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product" alt="image">                                
                                        <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                                    </div>   
                                {/if}

                            </div>
                            <figcaption>                             
                            </figcaption>                          
                        </figure>
                    </div>
                    <div class="col-2">  
                        <a href="#" class="list-action Mode" id="Icon" name="NORMAL"><i id="Icon" class="ModeAwe far fa-square"></i></a>
                        <a href="#" style="display:none" id="DeleteIcon" name="{$item_i18n->getActivity()->get('icon')}" class="list-action"><i class="fa fa-trash"></i></a>
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
                <textarea id="Editor" name="content" rows="15" cols="80" style="margin-top: 15px;" class="CustomerBlogActivityI18n Input Fields form-control">{$item_i18n->get('content')}</textarea>
            </div>          
        </div>
    </div>                           
<script type="text/javascript">  
          $( '#Editor' ).ckeditor({
             height: $(window).height()
        }); 
     
     $("#DeletePicture").click( function () { 
            if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            return $.ajax2({ data :{ Activity: '{$item_i18n->get('activity_id')}' },
                             url :"{url_to('customers_blog_ajax',['action'=>'DeletePictureActivity'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeletePictureActivity') return ;                                          
                                   $(".PictureExist,#DeletePicture").hide();  
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
            return $.ajax2({ data :{ Activity: '{$item_i18n->get('activity_id')}' },
                             url :"{url_to('customers_blog_ajax',['action'=>'DeleteIconActivity'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeleteIconActivity') return ;                                          
                                   $(".IconExist,#DeleteIcon").hide();  
                                   $("#NoIcon").css({
                                        'display':'block',
                                        'position': 'absolute',
                                        'width': '96%',
                                        'top': '25%',
                                   });

                             }
                 });                                        
        }); 
     
     
       $("#DialogPartnerWorks").click(function () { 
             return $.ajax2({      
                         data : { CustomerBlogActivity : { lang: $("#SelectListLanguages option:selected").attr('id'), 
                                            selection : $("#ActivityPartnerWorks").data('selection'), 
                                            token : '{mfForm::getToken('DialogPartnerWorkFormFilter')}' } },
                         url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogPartnerWorkForActivity'])}",                                              
                         success : function () { $("#Modal-PartnerWorks").show(); },
                         target: "#Modal-PartnerWorks-ctn"
                       });     
     });  
     
     $("#Modal-PartnerWorks-Close").click(function () {  $("#Modal-PartnerWorks").hide(); });
     
     $(".CustomerBlogActivityI18n.Input[name=title]").keyup(function () { 
         $(".CustomerBlogActivityI18n.Input[name=url]").val("{$node->getUrlPathI18n()}"+$(this).val().cleanup());
     });
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerBlogActivityNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityForm')}' } },                                 
                              url : "{url_to('customers_blog_ajax',['action'=>'ListPartialActivity'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function() {
            var  params= {      CustomerBlogActivity: '{$node->get('id')}',
                                CustomerBlogActivityI18n: { 
                                   activity_i18n : { activity_id: $("#Activity-ctn").attr('data-id'), lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   activity : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerBlogActivityI18n.Input").each(function() { params.CustomerBlogActivityI18n.activity_i18n[this.name]=$(this).val(); });
          $(".CustomerBlogActivity.Input").each(function() {  params.CustomerBlogActivityI18n.activity[this.name]=$(this).val();  });  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                           
                           url: "{url_to('customers_blog_ajax',['action'=>'SaveNewActivityI18n'])}",
                           target: "#actions"}); 
        });                                                      
    
    
    $("#PartnerWorks tbody").sortable({
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
        
     $("#AddPartnerWorks").click(function () {           
           var params = { AddPartnerWorksForActivity : {  lang : '{$item_i18n->get('lang')}' ,selection: $("#DialogPartnerWorkList").data('selection'), token : '{mfForm::getToken('AddPartnerWorksForViewActivityForm')}' } };                    
           return $.ajax2({  
                         data : params,
                         url:"{url_to('customers_blog_ajax',['action'=>'AddPartnerWorksForNewActivity'])}",                                              
                          success : function () {   $("#Modal-PartnerWorks").hide(); },
                          target: "#PartnerWorks-ctn"
                       }); 
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
          
    if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
           
            
     $("#DropZonePicture").dropzone({
      url: "{url_to("customers_blog_ajax",['action'=>'UploadPictureNewActivity'])}",
     // clickable: false,
      params: {         
                "UploadPictureActivity[node_id]" : '{$node->get('id')}',
                "UploadPictureActivity[token]" : '{mfForm::getToken('UploadPictureActivityNewForm')}' 
              },   
      paramName: "UploadPictureActivity[file]",
      parallelUploads : 20,
      maxFiles : 24,
      maxFilesize : 24,   
      sending : function (file, xhr, formData) {                               
          if ( !$("#Activity-ctn").attr('data-id')) return ;                                  
          formData.append('UploadPictureActivity[id]', $("#Activity-ctn").attr('data-id'));                                 
      },                   
      success : function (file,resp)
      {              
          // console.log("Status="+response.status);
           if (resp.errors || resp.status)                 
               return ;                                               
          $("#DropZonePicture").find('.dz-preview').remove();                
          $("#Picture-img").attr('src',resp.url).show(); 
          $("#Activity-ctn").attr('data-id',resp.id);
          $('#DeletePicture').show();
      }                  
    });         
     
    if ($("#DropZoneIcon").find('.dz-default').length)
             $("#DropZoneIcon")[0].dropzone.off().destroy();
             
          
                                                 
    $("#DropZoneIcon").dropzone({
      url: "{url_to("customers_blog_ajax",['action'=>'UploadIconNewActivity'])}",
     // clickable: false,
      params: {         
                "UploadIconActivity[node_id]" : '{$node->get('id')}',
                "UploadIconActivity[token]" : '{mfForm::getToken('UploadIconActivityNewForm')}' 
              },   
      paramName: "UploadIconActivity[file]",
      parallelUploads : 20,
      maxFiles : 24,
      maxFilesize : 24,   
      sending : function (file, xhr, formData) {                               
          if ( !$("#Activity-ctn").attr('data-id')) return ;                                  
          formData.append('UploadIconActivity[id]', $("#Activity-ctn").attr('data-id'));                                 
      },                   
      success : function (file,resp)
      {              
          // console.log("Status="+response.status);
           if (resp.errors || resp.status)                 
               return ;                                               
          $("#DropZoneIcon").find('.dz-preview').remove();                
          $("#Icon-img").attr('src',resp.url).show(); 
          $("#Activity-ctn").attr('data-id',resp.id);
          $('#DeleteIcon').show();
      }                  
    }); 
</script>
{else}
    {__('Node is invalid.')}
{/if}    