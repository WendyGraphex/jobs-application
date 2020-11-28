<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My jobs')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Cancel"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My jobs')}</p></a>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('View job')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employer-view-advert"}
    </div>
</div>
{component name="/site_warning/warning" warning="employer-view-advert"}

<div id="alertErrors" class="w-auto alert alert-danger" style="display:none;"></div>

{alerts}
{if $advert->isLoaded()}
    <div class="row admin-header-container btn-r">    
        <div class="col-sm p-0">
            <div class="pull-right">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
            </div>
        </div>
    </div>     

    <div class="col-lg-12 pt-2 stretch-card">
        <div class="card classMargin">
            <div class="card-body">             
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    {foreach $form->getLanguages() as $language}
                        <li class="nav-item">            
                            <a class="nav-link {if $language@first}active{/if}"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                                {$language->getFormatter()->getText()->ucfirst()}
                                {if $form.adverts[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                            </a>
                        </li>        
                    {/foreach}
                    <li class="nav-item">            
                        <a class="nav-link"  id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                            {__('Categories')}
                        </a>
                    </li>   
                    <li class="nav-item">            
                        <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="true">
                            {__('Documents')}
                        </a>
                    </li> 
                    <li class="nav-item">            
                        <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                            {__('Experience')}
                            {if $form.budget->hasError()}<span style="color:red">?</span>{/if}
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    {foreach $form->getLanguages()->byIndex() as $index=>$language}
                        <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Title")}{if $form->adverts[$index].title->getOption('required')}*{/if}</label>
                                        <div class="alert alert-danger" style="display:none;{if $form.adverts[$index].title->hasError()}display:block;{/if}">{$form.adverts[$index].title->getError()}</div>
                                        <input type="text" class="EmployerAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.adverts[$index].title|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('title')|escape}{/if}">
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Short description")}{if $form->adverts[$index].short_description->getOption('required')}*{/if}</label>
                                        <div class="alert alert-danger" style="display:none;{if $form.adverts[$index].short_description->hasError()}display:block;{/if}">{$form.adverts[$index].short_description->getError()}</div>
                                        <textarea cols="40" rows="5" class="EmployerAdvertI18n Input form-control Editor" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.adverts[$index].short_description|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('short_description')|escape}{/if}</textarea>
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Content")}{if $form->adverts[$index].content->getOption('required')}*{/if}</label>
                                        <div class="alert alert-danger" style="display:none;{if $form.adverts[$index].content->hasError()}display:block;{/if}">{$form.adverts[$index].content->getError()}</div>
                                        <textarea cols="40" rows="10" class="EmployerAdvertI18n Textarea Input form-control Editor" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.adverts[$index].content|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('content')|escape}{/if}</textarea>
                                    </div>                    
                                </div>  
                            </div>                  
                        </div> 
                    {/foreach}  


                    {* ==================================== CATEGORIES  ====================================*}
                    <div class="tab-pane fade show" id="categories" role="tabpanel" aria-labelledby="categories-tab">                       
                        <div class="row mt-3" style="height: 20px;">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                                                    
                                    <a href="javascript:void();" id="DialogCategories"><i class="fa fa-plus"></i></a>
                                </div>                    
                            </div>  
                        </div> 

                        <div id="categories-ctn">
                            <div id="EmployerAdvertCategories">                               
                                {foreach $advert->getAdvertCategories()->getCategories() as $category} 
                                    <div class="EmployerAdvertCategories-list" id="{$category->get('id')}">                                              
                                        <div class="btn btn-outline-primary EmployerAdvertCategories" id="{$category->get('id')}">
                                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                                    <a href="javascript:void(0);" title="{__('Delete')}" class="EmployerAdvertCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                                        <i  class="fa fa-times icon-font delete-color"></i>
                                    </a>                                                       
                                </div> 
                            </div>
                        {/foreach}    
                    </div>

                </div>

                <div id="Modal-Categories" class="modal " role="dialog">
                    <div class="modal-dialog modal-lg model-cat-product">    
                        <div class="modal-content">
                            <div class="px-2"><span class="close"  style="cursor: pointer;" id="Modal-Categories-Close">&times;</span></div>
                            <div id="Modal-Categories-ctn">            
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <div class="Addbtn px-2"> 
                                    <div style="width: 163px;margin: 0 auto;">
                                        <a href="#" id="AddCategories" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i><span style="vertical-align: text-top;">{__('Add categories')}</span></a>                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                     
            </div>

            {* ==================================== DOCUMENTS  ====================================*}
            <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab"> 
                <p>{__('Max size is')} {$form->getAdvert()->getFileMaxSize()}</p>
                <div class="row portfolio-grid">
                    <div class="EmployerDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                        <figure class="effect-text-in">
                            <div id="DropZone" class="dropzone dp-addFile"> 
                                <i class="fa fa-plus plus-icon"></i>
                                <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                            </div>
                            <figcaption>                             
                            </figcaption>                          
                        </figure>
                    </div>
                    {foreach $advert->getDocuments() as $document}
                        <div class="EmployerDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 stretch-card" id="{$document->get('id')}">   
                            <figure class="effect-text-in classBorderSolid">
                                <div class="div-img h-100 dz-image">
                                    {if  $document->getFile()->isPicture()}
                                        <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                    {else}
                                        <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                    {/if}
                                    <label class="PublicPrivate btn btn-success EmployerAdvertDocumentPublic-Text" id="{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Public')}</label>
                                    <label class="PublicPrivate btn btn-danger EmployerAdvertDocumentPrivate-Text" id="{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Private')}</label>
                                    <div class="dropdown DropPublicPrivate">
                                        <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                                        <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                                            <li><a href="javascript:void();" class="EmployerAdvertDocumentPublic-btn" {if $document->isOpened()}style="display:none"{/if} id="{$document->get('id')}">{__('Public')}</a></li>
                                            <li><a href="javascript:void();" class="EmployerAdvertDocumentPrivate-btn" {if !$document->isOpened()}style="display:none"{/if} id="{$document->get('id')}">{__('Private')}</a></li>
                                        </ul>
                                    </div> 
                                </div>
                                <figcaption class="text-left">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <div class="pr-1">
                                                <h6 class="PicturesCount">{$document@iteration}</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="pic-title text-left">
                                                <h6 class="picture-title w-100">                                                                          
                                                    <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <div class="conf-icons">
                                                <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action EmployerDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </figcaption> 
                            </figure>        
                        </div> 
                    {/foreach}    
                </div>              
            </div> 

            {* ==================================== DETAILS  ====================================*}
            <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                <div class="row mt-3">                       
                    <div class="form col-md-3">                                   
                        <div class="form-group">                          
                            <label>{__("Budget")}{if $form->budget->getOption('required')}*{/if}</label>
                            <div>{$form.budget->getError()}</div>
                            <input type="text" class="EmployerAdvert Input form-control" name="budget" value="{if $form->hasErrors()}{$form.budget}{else}{$form->getAdvert()->getFormatter()->getBudget()}{/if}">
                        </div>                    
                    </div>  
                </div>                               
            </div> 


        </div>
    </div>         
</div>
</div>   
                         
<script type="text/javascript">                  
      $( '.Textarea' ).ckeditor();
        
      $('#Cancel').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}",
                           target: "#actions"}); 
      }); 
     
      $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",
                           target: "#actions"}); 
      }); 
     
      $("#Save").click(function () { 
        var params = {  EmployerAdvert : '{$advert->get('id')}',
                        EmployerAdvertMultiple :  {  categories : [ ], adverts : [ ],token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerAdvertI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.EmployerAdvertMultiple.adverts.push(i18n);
        });    
        $(".EmployerAdvertCategories").each(function () { params.EmployerAdvertMultiple.categories.push($(this).attr('id')); });
        $(".EmployerAdvert.Input").each(function () { params.EmployerAdvertMultiple[$(this).attr('name')]=$(this).val(); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_ajax',['action'=>'SaveAdvert'])}",           
            target: "#actions"
        });
    
      });
      
      
       $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
      $("#DialogCategories").click(function () { 
           var params = { EmployerAdvertCategory : {   selection : [ ],  token : '{mfForm::getToken('EmployerPartnerWorkCategorySelectionForm')}' } };      
            $(".EmployerAdvertCategories-list").each(function() { params.EmployerAdvertCategory.selection.push($(this).attr('id'));  }); 
             return $.ajax2({      
                         data : params,
                         url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCategoryForAdvert'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     }); 
     
       $("#AddCategories").click(function () { 
            var params = { AddCategoriesForAdvert : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('EmployerAddCategoriesForNewAdvertForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employers_ajax',['action'=>'AddCategoriesForNewAdvert'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
     
      $(".EmployerAdvertCategory-Delete").click(function () {        
          $(".EmployerAdvertCategories-list[id="+$(this).attr('id')+"]").remove();           
      });
      
      
       if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
     $("#DropZone").dropzone({
            url: "{url_to("employers_ajax",['action'=>'UploadAdvertDocument'])}",
            clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadAdvertDocument[token]" : '{mfForm::getToken('EmployerUploadAdvertDocumentForm')}',
                      "UploadAdvertDocument[id]": '{$advert->get('id')}'
                    },   
            paramName: "UploadAdvertDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,                              
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                if (response.errors || response.status)  
                {
                    $("#alertErrors").css('display','block');
                    $("#alertErrors").html(response.errors.file);
                    return ; 
                }
                
                $("#DropZone").find('.dz-preview').remove();
                $("#DropZone").find('.dz-default').show();
                $(".dz-message").show();
                $(".EmployerDocuments-list:last").after(response);  
            }                  
    }); 
    
    
   {* $(".EmployerDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { EmployerAdvertDocument : $(this).attr('id') },
                         url:"{url_to('employers_ajax',['action'=>'DeleteAdvertDocument'])}",                                              
                         success : function (resp) { 
                            $(".EmployerDocuments-list[id="+resp.id+"]").remove();
                            }                          
                       });                      
     }); *} 
         
    $(".EmployerDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { EmployerAdvertDocument : $(this).attr('id') },
                         url:"{url_to('employers_ajax',['action'=>'DeleteAdvertDocument'])}",                                              
                         success : function (resp) { 
                              if (resp.action !='DeleteAdvertDocument') return ; 
                              $(".EmployerDocuments-list[id="+resp.id+"]").remove();
                            }
                          
                       });                      
    }); 
     
     $(".EmployerAdvertDocumentPublic-btn").click(function () {                     
           return $.ajax2({      
                          data : { EmployerAdvertDocument : $(this).attr('id') },
                         url:"{url_to('employers_ajax',['action'=>'PublicAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PublicAdvertDocument') return ;
                                $(".EmployerAdvertDocumentPrivate-btn[id="+resp.id+"]").show();
                                $(".EmployerAdvertDocumentPublic-btn[id="+resp.id+"]").hide(); 
                                $(".EmployerAdvertDocumentPrivate-Text[id="+resp.id+"]").hide();
                                $(".EmployerAdvertDocumentPublic-Text[id="+resp.id+"]").show(); 
                            }                          
                       });                      
     });   
     
     $(".EmployerAdvertDocumentPrivate-btn").click(function () {                     
           return $.ajax2({      
                          data : { EmployerAdvertDocument : $(this).attr('id') },
                         url:"{url_to('employers_ajax',['action'=>'PrivateAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PrivateAdvertDocument') return ;
                                $(".EmployerAdvertDocumentPrivate-btn[id="+resp.id+"]").hide();
                                $(".EmployerAdvertDocumentPublic-btn[id="+resp.id+"]").show(); 
                                $(".EmployerAdvertDocumentPrivate-Text[id="+resp.id+"]").show();
                                $(".EmployerAdvertDocumentPublic-Text[id="+resp.id+"]").hide();    
                            }                          
                       });                      
     });   
</script>           
{else}
    {__('Advert is invalid.')}
{/if}  