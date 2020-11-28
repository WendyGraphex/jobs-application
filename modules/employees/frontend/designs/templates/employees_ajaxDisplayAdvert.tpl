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
            <a id="List"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My jobs')}</p></a>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Display job')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-display-advert"}
    </div>
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
                <div class="tab-pane fade show" id="categories" role="tabpanel" aria-labelledby="categories-tab" tyle="padding-top: 20px;">  
                       {foreach $advert->getAdvertCategories()->getCategories() as $category} 
                            <div style="display: inline-block;margin: 8px;">                                              
                                  <div class="btn btn-outline-primary EmployeeAdvertCategories">
                                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                                                                                                                      
                                </div> 
                            </div>
                        {/foreach}                  
                </div>
                                                
                {* ==================================== DOCUMENTS  ====================================*}
                <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab">                                                                                    
                      <div class="row portfolio-grid">      
                          {if $advert->getDocuments()->isEmpty()}
                              <div>{__('No document')}</div>
                          {else}    
                                {foreach $advert->getDocuments() as $document}
                                     <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">   
                                        <figure class="effect-text-in classBorderSolid">
                                            <div class="div-img h-100 dz-image">
                                                 {if  $document->getFile()->isPicture()}
                                                  <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                                  {else}
                                                      <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                                  {/if}                                                  
                                                   {if $document->isOpened()}
                                                    <label class="PublicPrivate btn btn-success">{__('Public')}</label>
                                                    {else}
                                                  <label class="PublicPrivate btn btn-danger">{__('Private')}</label>                                            
                                                  {/if}
                                                  </div>
                                            <figcaption class="text-left">
                                                <div class="row">
                                                    <div class="col-md-1">
                                                        <div class="pr-1">
                                                            <h6 class="PicturesCount">{$document@iteration}</h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-11">
                                                        <div class="pic-title text-left">
                                                            <h6 class="picture-title w-100">                                                                          
                                                              <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                                           </h6>
                                                        </div>
                                                    </div>
                                                </div>                                             
                                            </figcaption> 
                                        </figure>        
                                      </div> 
                                {/foreach}   
                          {/if}
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
   
       $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        });  
      
       $('#List').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'ListPartialAdvert'])}",                           
                           target: "#actions"}); 
        }); 
</script>

{else}
    {__('Advert is invalid.')}
{/if}  