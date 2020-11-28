<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My projects')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <a id="Cancel"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My projects')}</p></a>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('View project')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}
{if $project->isLoaded()}
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
                 <li class="nav-item">            
                  <a class="nav-link active"  id="project-tab" data-toggle="tab" href="#project" role="tab" aria-controls="project" aria-selected="true">
                     {__('My project')}
                     {if $form.budget->hasError() || $form.name->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li>
                {foreach $form->getLanguages() as $language}
                <li class="nav-item">            
                    <a class="nav-link"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                        {$language->getFormatter()->getText()->ucfirst()}
                        {if $form.projects[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                    </a>
                </li>        
               {/foreach}                
                <li class="nav-item">            
                    <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="true">
                        {__('Documents')}
                    </a>
                </li>                 
            </ul>
                  
            <div class="tab-content">
                {* ==================================== PROJECT  ====================================*}
                <div class="tab-pane fade show active" id="project" role="tabpanel" aria-labelledby="project-tab">                                                                                    
                    <div class="row mt-3">   
                        <div class="form col-md-3">                                   
                            <div class="form-group">                          
                                    <label>{__("Name")}{if $form->name->getOption('required')}*{/if}</label>
                                    <div>{$form.name->getError()}</div>
                                    <input type="text" class="EmployerProject Input form-control" name="name" value="{$form->getProject()->getFormatter()->getName()}">
                            </div>                    
                        </div>  
                        <div class="form col-md-3">                                   
                            <div class="form-group">                          
                                <label>{__("Budget")}{if $form->budget->getOption('required')}*{/if}</label>
                                <div>{$form.budget->getError()}</div>
                                <input type="text" class="EmployerProject Input form-control" name="budget" value="{if $form->hasErrors()}{$form.budget}{else}{$form->getProject()->getFormatter()->getBudget()}{/if}">
                            </div>                    
                        </div>  
                    </div>                               
                </div> 
                       
                
                {foreach $form->getLanguages()->byIndex() as $index=>$language}
                <div class="tab-pane fade show Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                    <div class="row mt-3">                       
                       <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Title")}{if $form->projects[$index].title->getOption('required')}*{/if}</label>
                                <div>{$form.projects[$index].title->getError()}</div>
                                <input type="text" class="EmployerProjectI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.projects[$index].title|escape}{else}{$form->getProject()->getProjectsI18n()->getItemByIndex($index)->get('title')|escape}{/if}">
                            </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                 <label>{__("Short description")}{if $form->projects[$index].short_description->getOption('required')}*{/if}</label>
                                 <div>{$form.projects[$index].short_description->getError()}</div>
                                 <textarea cols="40" rows="5" class="EmployerProjectI18n Input form-control" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.projects[$index].short_description|escape}{else}{$form->getProject()->getProjectsI18n()->getItemByIndex($index)->get('short_description')|escape}{/if}</textarea>
                            </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                 <label>{__("Content")}{if $form->projects[$index].content->getOption('required')}*{/if}</label>
                                 <div>{$form.projects[$index].content->getError()}</div>
                                 <textarea cols="40" rows="10" class="EmployerProjectI18n Textarea Input form-control" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.projects[$index].content|escape}{else}{$form->getProject()->getProjectsI18n()->getItemByIndex($index)->get('content')|escape}{/if}</textarea>
                            </div>                    
                        </div>  
                    </div>                  
                </div> 
                {/foreach}  
                                                    
                {* ==================================== DOCUMENTS  ====================================*}
                <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab">                                                                                    
                       <div class="row portfolio-grid">
                            <div class="EmployerProjectDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                             <figure class="effect-text-in">
                                <div id="DropZone" class="dropzone dp-addFile"> 
                                    <i class="fa fa-plus plus-icon"></i>
                                    <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                                </div>
                               <figcaption>                             
                               </figcaption>                          
                             </figure>
                           </div> 
                          {foreach $project->getDocuments() as $document}
                               <div class="EmployerProjectDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
                                    <figure class="effect-text-in classBorderSolid">
                                        <div class="div-img h-100 dz-image">
                                           {if  $document->getFile()->isPicture()}
                                            <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                            {else}
                                                <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                            {/if}
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
                                                        <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action EmployerProjectDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </figcaption> 
                                    </figure>        
                                </div> 
                          {/foreach}    
                       </div>              
               </div>                                            
                       
            </div>
        </div>         
    </div>
</div>
      
        
                         
<script type="text/javascript">                  
        $( '.Textarea' ).ckeditor();
        
      $('#Cancel').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_project_ajax',['action'=>'ListPartialProject'])}",
                           target: "#actions"}); 
      }); 
     
      $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_project_ajax',['action'=>'Dashboard'])}",
                           target: "#actions"}); 
      }); 
     
      $("#Save").click(function () { 
        var params = {  EmployerProject : '{$project->get('id')}',
                        EmployerProjectMultiple :  {  projects : [ ],token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerProjectI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.EmployerProjectMultiple.projects.push(i18n);
        });          
        $(".EmployerProject.Input").each(function () { params.EmployerProjectMultiple[$(this).attr('name')]=$(this).val(); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_project_ajax',['action'=>'SaveProject'])}",           
            target: "#actions"
        });
    
      });
          
       if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
     $("#DropZone").dropzone({
            url: "{url_to("employers_project_ajax",['action'=>'UploadProjectDocument'])}",
             clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadProjectDocument[token]" : '{mfForm::getToken('EmployerUploadProjectDocumentForm')}',
                      "UploadProjectDocument[id]": '{$project->get('id')}'
                    },   
            paramName: "UploadProjectDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,                              
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();
                 $(".EmployerProjectDocuments-list:last").after(response);  
            }                  
    }); 
    
    
    $(".EmployerProjectDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { EmployerProjectDocument : $(this).attr('id') },
                         url:"{url_to('employers_project_ajax',['action'=>'DeleteProjectDocument'])}",                                              
                         success : function (resp) { 
                            $(".EmployerProjectDocuments-list[id="+resp.id+"]").remove();
                            }                          
                       });                      
     });   
</script>           
{else}
    {__('Project is invalid.')}
{/if}  