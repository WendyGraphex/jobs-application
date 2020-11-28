<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Articles')}</h3>
        <h3 class="admin-header-small-text">{__('Article management')}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Article')}
    </p>
</div>
{alerts}
<div id="Article-ctn" class="tablewhiteback" style="padding: 20px;">
    <div class="row">
        <div class="form-group col-md-6">                                                              
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form->getLanguage()}
        </div>  
    </div>
    <ul class="nav nav-tabs" id="myTab" role="tablist">    
        <li class="nav-item">
            <a class="nav-link active" id="t-control-tab" data-toggle="tab" href="#t-control" role="tab" aria-controls="t-control" aria-selected="true">{__('Control')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-referencement-tab" data-toggle="tab" href="#t-referencement" role="tab" aria-controls="t-referencement" aria-selected="false">{__('Referencement')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-activity-tab" data-toggle="tab" href="#t-activity" role="tab" aria-controls="t-activity" aria-selected="false">{__('Activities')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-picture-tab" data-toggle="tab" href="#t-picture" role="tab" aria-controls="t-picture" aria-selected="false">{__('Picture')}</a>
        </li>          
        <li class="nav-item">
            <a class="nav-link " id="t-description-tab" data-toggle="tab" href="#t-description" role="tab" aria-controls="t-description" aria-selected="false">{__('Description')}</a>
        </li>         
        <li class="nav-item">
            <a class="nav-link" id="t-content-tab" data-toggle="tab" href="#t-content" role="tab" aria-controls="t-content" aria-selected="false">{__('Content')} </a>
        </li>
    </ul>
    {* ============== C O N T R O L ========================================= *}
    <div class="tab-content" id="myTabContentViewArticle" style="margin-top: 10px;">         
        <div class="tab-pane fade show active" id="t-control" role="tabpanel" aria-labelledby="t-control-tab">  
            <table cellpadding="0" cellspacing="0">                   
                <tr style="height: 60px;">
                    <td>{__('Started at')}:{if $form->article.started_at->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.article.started_at->getError()}</div> 
                        <input id="last_time_from" class="CustomerBlogArticle Input form-control" type="text" name="started_at" size="10" value="{if $form->hasErrors()}{$form.article.started_at}{else}{format_date($article_i18n->getArticle()->get('started_at'),'a')}{/if}"/></td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Expired at')}:{if $form->article.expired_at->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.article.expired_at->getError()}</div> 
                        <input class="CustomerBlogArticle Fields Input form-control" id="last_time_to" type="text" name="expired_at" size="10" value="{if $form->hasErrors()}{$form.article.expired_at}{else}{format_date($article_i18n->getArticle()->get('expired_at'),'a')}{/if}"/></td>
                </tr>   
                <tr style="height: 60px;">
                    <td>{__('Author')}:{if $form->article.author->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.article.author->getError()}</div> 
                        <input class="CustomerBlogArticle Fields Input form-control" type="text" name="author" size="10" value="{$article_i18n->getArticle()->get('author')|escape}"/></td>
                </tr>
            </table>
        </div>
        {* ============== R E F E R E N C E M E N T ========================================= *}
        <div class="tab-pane fade" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
            <table cellpadding="0" cellspacing="0">
                <tr style="height: 60px;">
                    <td style="width: 150px;">{__('Url')}:{if $form.article_i18n.url->getValidator()->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.article_i18n.url->getError()}</div> 
                        <input class="CustomerBlogArticleI18n Fields Input form-control" type="text" name="url" value="{$article_i18n->get('url')}"/>
                    </td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Title')}:</td>
                    <td><input class="CustomerBlogArticleI18n Fields Input form-control" type="text" name="meta_title" value="{$article_i18n->get('meta_title')}"/></td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Description')}:</td>
                    <td><textarea class="CustomerBlogArticleI18n Fields Input form-control" name="meta_description" rows="5" cols="40" style="margin-bottom: 20px;">{$article_i18n->get('meta_description')}</textarea></td>
                </tr>               
                <tr style="height: 60px;">
                    <td>{__('Keywords')}:</td>
                    <td><textarea class="CustomerBlogArticleI18n Fields Input form-control" name="meta_keyword" rows="5" cols="40">{$article_i18n->get('meta_keyword')}</textarea>
                    </td>
                </tr> 
            </table>
        </div>
        {* ============== ACTIVITY ========================================= *}
        <div class="tab-pane fade" id="t-activity" role="tabpanel" aria-labelledby="t-activity-tab">
            <div class="row mt-3" style="height: 20px;">                       
                <div class="form col-md-12">                                   
                    <div class="form-group">                                                    
                        <a href="javascript:void();" id="DialogActivities"><i class="fa fa-plus"></i></a>
                    </div>                    
                </div>  
            </div>

            <div id="activities-ctn">
                <div id="CustomerBlogActivities">                               
                    {foreach $form->getActivities() as $activity} 
                        <div class="CustomerBlogActivities-list" id="{$activity->get('id')}">                                              
                            <div class="btn btn-outline-primary CustomerBlogActivities" id="{$activity->get('id')}">
                        {if $activity->hasI18n()}{$activity->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                        <a href="javascript:void(0);" title="{__('Delete')}" class="CustomerBlogActivity-Delete" id="{$activity->get('id')}"  name="{if $activity->hasI18n()}{$activity->getI18n()->get('title')}{else}{$activity->get('name')}{/if}">
                            <i  class="fa fa-times icon-font delete-color"></i>
                        </a>                                                       
                    </div> 
                </div>
            {/foreach} 
        </div>
    </div>
    <div id="Modal-Activities" class="modal " role="dialog">
        <div class="modal-dialog modal-lg model-cat-product">    
            <div class="modal-content">
                <div class="px-2"><span class="close" style="cursor: pointer;" id="Modal-Activities-Close">&times;</span></div>
                <div id="Modal-Activities-ctn">            
                </div>
                <div class="col-md-12" style="padding: 0;">
                    <div class="Addbtn px-2"> 
                        <div style="width: 163px;margin: 0 auto;">
                            <a href="#" id="AddActivities" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add activities')}</a>                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</div>
{* ============== PICTURE ========================================= *}
<div class="tab-pane fade" id="t-picture" role="tabpanel" aria-labelledby="t-picture-tab">           
    <div class="row portfolio-grid">
        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
            <figure class="effect-text-in ModeDisplay" id="Picture">
                <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                                                  
                    {if $form->hasArticle()}
                        {if $form->getArticle()->hasPicture()}
                            <div class="PictureExist" id="Picture"> 
                                <div class="div-img h-100">
                                    <img id="Picture-img" class="img-dpzone img-product" src="{$form->getArticle()->getPicture()->getMedium()->getUrl()}"/>
                                </div> 
                                <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                            </div>                               
                        {/if}
                    {else}
                        <div id="NoPicture" style="position: absolute;width: 96%;top: 25%;" {if $article_i18n->getArticle()->hasPicture()}style= "display:none;"{/if}>
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
            <a href="#" style="display:none" id="DeletePicture" name="{$article_i18n->getArticle()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
        </div>           
    </div>
</div>         
{* ============== DESCRIPTION ========================================= *}
<div class="tab-pane fade" id="t-description" role="tabpanel" aria-labelledby="t-description-tab">           
    <textarea id="ShortDescription" class="CustomerBlogArticleI18n Fields Input form-control Editor" name="short_description" rows="5" cols="40" style="margin-bottom: 20px;">{$article_i18n->get('description')}</textarea>           
</div>                
{* ============== C O N T E N T ========================================= *}
<div class="tab-pane fade" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
    <textarea  id="Content" name="content" rows="15" cols="80" style="margin-top: 15px;" class="CustomerBlogArticleI18n Editor Input Fields form-control">{$article_i18n->get('content')}</textarea>
</div>
</div>
</div>  

<script type="text/javascript">
           
        $('#Content').ckeditor({
            height: $(window).height(),
        });
        
        $('#ShortDescription').ckeditor({
           
        });
           
         $(".CustomerBlogArticleI18n.Input[name=meta_title]").keyup(function () { 
                $(".CustomerBlogArticleI18n.Input[name=url]").val($(this).val().cleanup());
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
         
        var dates = $( "#last_time_from, #last_time_to" ).datepicker({
                            minDate : 0,
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "last_time_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    dates.not( this ).datepicker( "option", option, date );
                            }
                          });
        
        
     
        $('#Cancel').click(function(){ 
                var params={ filter: {  
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                                
                                   token:'{mfForm::getToken('CustomerBlogArticleFormFilter')}'
                       } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialArticle'])}",
                                 target: "#actions"});             
        });
        
        $('#Save').click(function(){          
          var params= { CustomerBlogArticleI18n : { 
                               activities : [ ],
                               article :{ },
                               article_i18n: {  
                                    article_id: $("#Article-ctn").attr('data-id'),
                                    lang: $("#SelectListLanguages option:selected").attr('id')                              
                                         },
                               token :'{$form->getCSRFToken()}'
                              } };
          $(".CustomerBlogArticleI18n.Input").each(function() { params.CustomerBlogArticleI18n.article_i18n[$(this).attr('name')]=$(this).val(); });
          $(".CustomerBlogArticle.Input").each(function() { params.CustomerBlogArticleI18n.article[$(this).attr('name')]=$(this).val(); });
          $(".CustomerBlogArticle.Select option:selected").each(function() { params.CustomerBlogArticleI18n.article[$(this).parent().attr('name')]=$(this).val(); });
          $(".CustomerBlogActivities").each(function () { params.CustomerBlogArticleI18n.activities.push($(this).attr('id')); });
         // alert("Params="+params.toSource());   return;
          return $.ajax2({ 
                            data : params,
                            url: "{url_to('customers_blog_ajax',['action'=>'SaveNewArticleI18n'])}",
                            target: "#actions",
                            success : function (resp) { 
                                    if (resp.action !='SaveNewArticleI18n') return ;
                                    if (resp.errors)
                                    {                                    
                                        $('.Input').keyup(function () { 
                                            $(".CustomerBlogArticleI18n").removeClass('intro');
                                        });
                                        $.each(resp.errors,function (name,error) { $(".CustomerBlogArticleI18n[name="+name+"]").addClass('intro'); });
                                        return ;
                                    }
                                }
               }); 
        
        });
        
   $("#DeletePicture").click( function () { 
            if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            return $.ajax2({ data :{ CustomerBlogArticle: {if $article_i18n->getArticle()->isLoaded()}'{$article_i18n->get('article_id')}'{else}$("#Article-ctn").attr('data-id'){/if} },
                             url :"{url_to('customers_blog_ajax',['action'=>'DeletePictureArticle'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeletePictureArticle') return ;                                          
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

if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
           
            
     $("#DropZonePicture").dropzone({
      url: "{url_to("customers_blog_ajax",['action'=>'UploadPictureNewArticle'])}",
     // clickable: false,
      params: {                      
                "UploadPictureArticle[token]" : '{mfForm::getToken('UploadPictureArticleNewForm')}' 
              },   
      paramName: "UploadPictureArticle[file]",
      parallelUploads : 20,
      maxFiles : 24,
      maxFilesize : 24,   
      sending : function (file, xhr, formData) {                               
          if ( !$("#Article-ctn").attr('data-id')) return ;                                  
          formData.append('UploadPictureArticle[id]', $("#Article-ctn").attr('data-id'));                                 
      },                   
      success : function (file,resp)
      {              
          // console.log("Status="+response.status);
           if (resp.errors || resp.status)                 
               return ;                                               
          $("#DropZonePicture").find('.dz-preview').remove();                
          $("#Picture-img").attr('src',resp.url).show(); 
          $("#Article-ctn").attr('data-id',resp.id);
          $('#DeletePicture').show();
      }                  
    });      
    
    
     $("#Modal-Activities-Close").click(function () {  $("#Modal-Activities").hide(); });     
      
       $("#DialogActivities").click(function () { 
              return $.ajax2({      
                          data : { CustomerBlogActivity : {  
                                            selection : $("#CustomerBlogActivities").data('selection'), 
                                            token : '{mfForm::getToken('CustomerBlogActivity')}' } },
                         url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}",                                              
                         success : function () { $("#Modal-Activities").show(); },
                         target: "#Modal-Activities-ctn"
                       });     
     });  
     
     
       $("#AddActivities").click(function () { 
            var params = { AddActivitiesForArticle : {  selection: $("#DialogActivityList").data('selection'), token : '{mfForm::getToken('AddActivitiesForNewArticleForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('customers_blog_ajax',['action'=>'AddActivitiesForNewArticle'])}",    
                  success : function () {   $("#Modal-Activities").hide(); },
                  target: "#activities-ctn"
              });
     });
      
     $(".CustomerBlogActivity-Delete").click(function () {                
            $(".CustomerBlogActivities-list[id="+$(this).attr('id')+"]").remove();
     }); 
      
      
</script>