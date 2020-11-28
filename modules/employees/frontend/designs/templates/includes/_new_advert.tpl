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
                                    <input type="text" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.adverts[$index].title|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('title')|escape}{/if}">
                                </div>                    
                            </div>  
                        </div>
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Short description")}{if $form->adverts[$index].short_description->getOption('required')}*{/if}</label>
                                    <div class="alert alert-danger" style="display:none;{if $form.adverts[$index].short_description->hasError()}display:block;{/if}">{$form.adverts[$index].short_description->getError()}</div>
                                    <textarea cols="40" rows="5" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.adverts[$index].short_description|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('short_description')|escape}{/if}</textarea>
                                </div>                    
                            </div>  
                        </div>
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Content")}{if $form->adverts[$index].content->getOption('required')}*{/if}</label>
                                    <div class="alert alert-danger" style="display:none;{if $form.adverts[$index].content->hasError()}display:block;{/if}">{$form.adverts[$index].content->getError()}</div>
                                    <textarea cols="40" rows="10" class="EmployeeAdvertI18n Textarea Input form-control" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.adverts[$index].content|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('content')|escape}{/if}</textarea>
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
                        <div id="EmployeeAdvertCategories">                               
                            {foreach $form->getCategories() as $category} 
                                <div class="EmployeeAdvertCategories-list" id="{$category->get('id')}">                                              
                                    <div class="btn btn-outline-primary EmployeeAdvertCategories" id="{$category->get('id')}">
                                {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                                <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeAdvertCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
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
                        <div class="px-2"><span class="close" style="cursor: pointer;" id="Modal-Categories-Close">&times;</span></div>
                        <div id="Modal-Categories-ctn">            
                        </div>
                        <div class="col-md-12" style="padding: 0;">
                            <div class="Addbtn px-2"> 
                                <div style="width: 163px;margin: 0 auto;">
                                    <a href="#" id="AddCategories" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add categories')}</a>                
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
                <div class="EmployeeDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                    <figure class="effect-text-in">
                        <div id="DropZone" class="dropzone dp-addFile"> 
                            <i class="fa fa-plus plus-icon"></i>
                            <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                        </div>
                        <figcaption>                             
                        </figcaption>                          
                    </figure>
                </div>
                {foreach $form->getAdvert()->getDocuments() as $document}
                    <div class="EmployeeDocuments-list col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
                        <figure class="effect-text-in classBorderSolid">
                            <div class="div-img h-100 dz-image">
                                {if  $document->getFile()->isPicture()}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                {else}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                {/if}
                            </div>
                            <figcaption class="text-left">
                                <div class="pr-1">
                                    <h6 class="PicturesCount">{$document@iteration}</h6>
                                </div>
                                <div class="pic-title text-left">
                                    <h6 class="picture-title w-100">                                                                          
                                        <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                    </h6>
                                </div>
                                <div class="conf-icons">
                                    <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action EmployeeDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
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
                        <input type="text" class="EmployeeAdvert Input form-control" name="budget" value="{if $form->hasErrors()}{$form.budget}{else}{$form->getAdvert()->getFormatter()->getBudget()}{/if}">
                        <span style="position: absolute;top: 41px;right: 20px;">$</span>
                    </div>                    
                </div>  
            </div>                               
        </div> 
    </div>                   
</div>         
</div>
</div>
      