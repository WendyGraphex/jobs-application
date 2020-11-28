<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My Courses')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Courses"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My Courses')}</p></a>
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Display')}</p>
                </div>
            </div>      
        </div>
    </div>
</div>             
{alerts}
{if $course_i18n->isLoaded()}

    <div class="col-lg-12 pt-2 stretch-card">
        <div class="card classMargin">
            <div class="card-body">             
                <ul class="nav nav-tabs" id="myTab" role="tablist">               
                    <li class="nav-item">            
                        <a class="nav-link active"  id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="true">
                            {__('Content')}
                        </a>
                    </li>                       
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
                            {__('Details')}                       
                        </a>
                    </li>
                </ul>
                {* ==================================== CONTENT  ====================================*}
                <div class="tab-content" style="padding-top: 20px;">
                    <div class="tab-pane fade show active" id="content" role="tabpanel" aria-labelledby="content-tab">    
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    {$course_i18n->getFormatter()->getLanguage()->getText()->ucfirst()}
                                </div>                    
                            </div>  
                        </div>                    
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Title")} </label>
                                    <input type="text" class="CustomerAcademyCourseI18n Input form-control" disabled="" name="title" value="{$course_i18n->get('title')|escape}">
                                </div>                    
                            </div>  
                        </div>
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Short description")}</label>
                                        <textarea cols="40" rows="5" class="CustomerAcademyCourseI18n Input form-control" disabled="" name="short_description">{$course_i18n->get('short_description')|escape}</textarea>
                                </div>                    
                            </div>  
                        </div>   <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Content")}</label>                 
                                        <textarea cols="40" rows="10" class="CustomerAcademyCourseI18n Textarea Input form-control" disabled="" name="content">{$course_i18n->get('content')|escape}</textarea>
                                </div>                    
                            </div>  
                        </div>  
                    </div>         
                    {* ==================================== CATEGORIES  ====================================*}
                    <div class="tab-pane fade" id="categories" role="tabpanel" aria-labelledby="categories-tab">
                        <div id="categories-ctn">
                            <div id="CustomerAcademyCourseCategories">                               
                                {foreach $form->getCategories() as $category} 
                                    <div class="CustomerAcademyCourseCategories-list" id="{$category->get('id')}" style="display: inline-block;">                                              
                                        <div class="btn btn-outline-primary CustomerAcademyCourseCategories" id="{$category->get('id')}">
                                            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                                                                                     
                                        </div> 
                                    </div>
                                {/foreach}   
                            </div>  
                        </div>
                    </div>  
                    {* ==================================== DOCUMENTS  ====================================*}
                    <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">     
                        <div class="row portfolio-grid">

                            {foreach $course_i18n->getDocuments() as $document}
                                <div class="CustomerAcademyCourseDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
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
                    <div class="tab-pane fade" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                        <div class="row mt-3">                       
                            <div class="form col-md-3">                                   
                                <div class="form-group">                          
                                    <label>{__("Price")} </label>              
                                    <input type="text" class="CustomerAcademyCourseI18n Input form-control" disabled="" name="price" value="{$course_i18n->getFormatter()->getPrice()}">
                                    <span style="position: absolute;top: 41px;right: 20px;">$</span>
                                </div>                    
                            </div>  
                        </div>                              
                    </div> 
                </div>
            </div>                   
        </div>
    </div>
      
<script type="text/javascript">
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('customers_academy_teacher_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
        $("#Courses").click(function() {                   
            return $.ajax2({ url:"{url_to('customers_academy_teacher_ajax',['action'=>'ListPartialCourse'])}",                                    
                      target: "#actions"}); 
        }); 
 
 
      
</script> 
 
{else}
    {__('Course is invalid.')}
{/if}    