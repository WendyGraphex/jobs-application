{alerts}
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
                     {if $form.budget->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li> 
                {foreach $form->getLanguages() as $language}
                <li class="nav-item">            
                  <a class="nav-link" id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
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
                       </div>                                    
                </div>    
                                               
          </div> 
        </div>         
    </div>
</div>
      
        
