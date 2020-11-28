<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Academy')}</h3>
        <h3 class="admin-header-small-text">{__('Academy Courses management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            {if !$course_i18n->hasPublishedAt()}                
                <a href="#" id="Publish" class="btn btn-info admin-header-button"><i class="fa fa-reply"/>{__('Publish')}</a>                              
            {/if}
            {if !$course_i18n->hasRefusedAt()}                      
                <a href="#" id="Refuse" class="btn btn-warning admin-header-button"><i class="fa fa-times-circle"/>{__('Refuse')}</a>               
            {/if}         
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>       
        </div> 
    </div>
</div>        
<div class="breadcrumb-title">
    <p>      
        <i class="fa fa-home" style="color: #37bc9b;"></i>     
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Academy')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Courses')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Display')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
    {if $course_i18n->isLoaded()}

        <div class="col-lg-12 pt-2 stretch-card">
            <div class="card classMargin">
                <div class="card-body">             
                    <ul class="nav nav-tabs" id="myTab" role="tablist">                        
                        <li class="nav-item">            
                            <a class="nav-link  active"  id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="true">
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

                    <div class="tab-content">   
                        <div class="tab-pane fade show active content" id="content" role="tabpanel" aria-labelledby="content-tab">     
                            <div class="row mt-3">    
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Language")}</label>                               
                                        <input type="text" readonly="" class="form-control" value="{$course_i18n->getFormatter()->getLanguage()->getText()->ucfirst()}"/>
                                    </div>                    
                                </div> 
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Reference")}</label>                               
                                        <input type="text" readonly="" class="form-control" value="{$course_i18n->get('reference')}"/>
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Title")}</label>                               
                                        <input type="text" readonly="" class="form-control" value="{$course_i18n->get('title')}">
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Short description")}</label>                                
                                        <textarea cols="40" rows="5"  readonly=""  class="form-control">{$course_i18n->get('short_description')}</textarea>
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Content")}</label>                                 
                                        <textarea cols="40" rows="10" readonly="" class="form-control">{$course_i18n->getFormatter()->getContent()->stripTags()}</textarea>
                                    </div>                    
                                </div>  
                            </div>                  
                        </div> 

                        {* ==================================== CATEGORIES  ====================================*}
                        <div class="tab-pane fade" id="categories" role="tabpanel" aria-labelledby="categories-tab">    

                            {foreach $course_i18n->getCourseCategories()->getCategories() as $category} 

                                <div class=""> 
                            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                                                                                                                      
                        </div>                            
                    {/foreach}                 
                </div>
                {* ==================================== DOCUMENTS  ====================================*}
                <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab" style="margin-top:10px;"> 

                    <div class="row">
                        {foreach $course_i18n->getDocuments() as $document}
                            <div class="col-lg-2 col-md-3">
                                <div class="classBorderDisplay">
                                    <div class="divImageDisplay">
                                        {if  $document->getFile()->isPicture()}
                                            <img height="24px" width="24px" class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                        {else}
                                            <img height="24px" width="24px" class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                        {/if}                                       
                                    </div>
                                    <div style="position: relative;">
                                        <span class="PicturesCount">{$document@iteration}</span>
                                        <span><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>
                                        <span>
                                            <span class="conf-icons classFloatLast">
                                                <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action EmployerDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                            </span> 
                                        </span>
                                    </div>
                                </div>
                            </div>
                        {/foreach} 
                    </div>           
                </div> 
                {* ==================================== DETAILS  ====================================*}
                <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">     
                    DETAIL
                    <div class="row mt-3">                       
                        <div class="form col-md-3">                                   
                            <div class="form-group">                          
                                <label>{__("Price")}</label>                                 
                                <input type="text" readonly="" class="form-control" value="{$course_i18n->getFormatter()->getPrice()}">
                            </div>                    
                        </div>  
                    </div>                               
                </div>
            </div>
        </div>
    </div>         
</div>
</div>    
</div>
<script level="text/javascript">
   
       
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({   url : "{url_to('customers_academy_ajax',['action'=>'ListPartialCourse'])}",                                                 
                              target: "#actions"}); 
      });
           
      $('#Publish').click(function(){                
             return $.ajax2({ data : { CustomerAcademyCourseI18n : '{$course_i18n->get('id')}' },  
                              url : "{url_to('customers_academy_ajax',['action'=>'PublishCourseI18n'])}",                                                 
                               success : function(resp)
                                {
                                    $("#Publish").hide();
                                    $("#Refuse").show();
                                }
        }); 
      });     
      
      $('#Refuse').click(function(){                
             return $.ajax2({ data : { CustomerAcademyCourseI18n : '{$course_i18n->get('id')}' },  
                              url : "{url_to('customers_academy_ajax',['action'=>'RefuseCourseI18n'])}",                                                 
                              success : function(resp)
                                {
                                     $("#Refuse").hide();
                                      $("#Publish").show();
                                }
                    }); 
      }); 
</script>

{else}
    {__('Course is invalid.')}
{/if}  

