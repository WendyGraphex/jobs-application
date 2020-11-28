<div class="row admin-header-container">
  <div class="col-sm">
    <h3 class="admin-header-big-text">{__('Employer')}</h3>
    <h3 class="admin-header-small-text">{__('Employer adverts management')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;"> 
         {if !$advert->hasPublishedAt()}
            {if $advert->getAdvertsI18n()->count()==1}
              <a href="#" id="Publish" class="btn btn-info admin-header-button"><i class="fa fa-reply"/>{__('Publish')}</a>            
            {else}
               <a href="#" id="Publish" class="btn btn-info admin-header-button"><i class="fa fa-reply-all"/>{__('Publish all')}</a>           
            {/if}    
          {/if}
          {if !$advert->hasRefusedAt()}
            {if $advert->getAdvertsI18n()->count()==1}          
              <a href="#" id="Refuse" class="btn btn-warning admin-header-button"><i class="fa fa-times-circle"/>{__('Refuse')}</a>
            {else}            
               <a href="#" id="Refuse" class="btn btn-warning admin-header-button"><i class="fa fa-times-circle"/>{__('Refuse all')}</a>
            {/if}    
          {/if}         
              <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>       
      </div> 
  </div>
</div>        
<div class="breadcrumb-title">
  <p>      
      <i class="fa fa-home" style="color: #37bc9b;"></i>     
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Adverts')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Display')}
  </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
{if $advert->isLoaded()}
  
       
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">             
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                {foreach $advert->getAdvertsI18n() as $i18n}
                <li class="nav-item">            
                    <a class="nav-link {if $i18n@first}active{/if}"  id="language-{$i18n->get('lang')}-tab" data-toggle="tab" href="#{$i18n->get('lang')}" role="tab" aria-controls="{$i18n->get('lang')}" aria-selected="true">
                        {$i18n->getLanguage()->getText()->ucfirst()}                      
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
                  </a>
                </li>
            </ul>
                  
            <div class="tab-content">                
                {foreach $advert->getAdvertsI18n() as $i18n}
                <div class="tab-pane fade show {if $i18n@first}active{/if} Languages" id="{$i18n->get('lang')}" role="tabpanel" aria-labelledby="language-{$i18n->get('lang')}-tab">                 
                     <div class="row mt-3">                     
                      {if !$advert->hasRefusedAt() && !$i18n->hasRefusedAt() && $advert->getAdvertsI18n()->count() > 1}                                                  
                         <a href="#" id="{$i18n->get('id')}" class="btn btn-warning admin-header-button Refuse"><i class="fa fa-reply"/>{__('Refuse')}</a>                                                                                           
                     {/if} 
                      {if !$advert->hasPublishedAt() && !$i18n->hasPublishedAt() && $advert->getAdvertsI18n()->count() > 1}                                                
                         <a href="#" id="{$i18n->get('id')}" class="btn btn-info admin-header-button Publish"><i class="fa fa-reply"/>{__('Publish')}</a>                                                                                             
                     {/if} 
                       </div>
                      <div class="row mt-3">                       
                       <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Reference")}</label>                               
                      <input type="text" readonly="" class="form-control" value="{$i18n->get('reference')}"/>
                         </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                       <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Title")}</label>                               
                                <input type="text" readonly="" class="form-control" value="{$i18n->get('title')}">
                            </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                 <label>{__("Short description")}</label>                                
                                 <textarea cols="40" rows="5"  readonly=""  class="form-control">{$i18n->get('short_description')}</textarea>
                            </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                 <label>{__("Content")}</label>                                 
                                <textarea cols="40" rows="10" readonly="" class="form-control">{$i18n->getFormatter()->getContent()->stripTags()}</textarea>                              
                            </div>                    
                        </div>  
                    </div>                  
                </div> 
                {/foreach}  
            
       
                {* ==================================== CATEGORIES  ====================================*}
                <div class="tab-pane fade show" id="categories" role="tabpanel" aria-labelledby="categories-tab">  
                     
                      {foreach $advert->getAdvertCategories()->getCategories() as $category} 
                            <div>                                              
                                 <div class="" style="display: inline-block;margin: 10px;">
                                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                                                                                                                      
                                </div> 
                            </div>
                        {/foreach}                   
                </div>
                                                
                {* ==================================== DOCUMENTS  ====================================*}
                <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab" style="margin-top:10px;">                                                                                    
                    <div class="row">
                        {foreach $advert->getDocuments() as $document}
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
                        <div class="row mt-3">                       
                         <div class="form col-md-3">                                   
                           <div class="form-group">                          
                                   <label>{__("Budget")}</label>                                 
                                   <input type="text" readonly="" class="form-control" value="{$advert->getFormatter()->getBudget()}">
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
             return $.ajax2({   url : "{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}",                                                 
                              target: "#actions" }); 
      });
      
      $('#Publish').click(function(){                
             return $.ajax2({ data : { EmployerAdvert : '{$advert->get('id')}' },  
                              url : "{url_to('employers_ajax',['action'=>'PublishAdvert'])}",                                                 
                              target: "#actions" }); 
      });     
      
      $('#Refuse').click(function(){                
             return $.ajax2({ data : { EmployerAdvert : '{$advert->get('id')}' },  
                              url : "{url_to('employers_ajax',['action'=>'RefuseAdvert'])}",                                                 
                              target: "#actions" }); 
      }); 
      
      
      $('.Publish').click(function(){                
             return $.ajax2({ data : { EmployerAdvertI18n : $(this).attr('id') },  
                              url : "{url_to('employers_ajax',['action'=>'PublishAdvertI18n'])}",                                                 
                               success : function(resp)
                                {
                                }
            }); 
      });     
      
      $('.Refuse').click(function(){                
             return $.ajax2({ data : { EmployerAdvertI18n : $(this).attr('id') },  
                              url : "{url_to('employers_ajax',['action'=>'RefuseAdvertI18n'])}",                                                 
                               success : function(resp)
                                {
                                }
            }); 
      }); 
</script>

{else}
    {__('Advert is invalid.')}
{/if}  