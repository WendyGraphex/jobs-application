<div class="row admin-header-container">
  <div class="col-sm">
    <h3 class="admin-header-big-text">{__('Employer')}</h3>
    <h3 class="admin-header-small-text">{__('Employer adverts management')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                                
                 <button id="GenerateRevivals" class="btn btn-info admin-header-button"><i class="fa fa-cog"></i> {__('Generate revivals')}</button> 
                 
                </div> 
            </div>
</div>

<!-- Begin breadcrumb -->
<div class="breadcrumb-title">
  <p>      
      <i class="fa fa-home" style="color: #37bc9b;"></i>     
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Adverts')}
  </p>
</div>
{alerts}
       
<div class=" bg-white px-2 py-2">
             <div class="col-md-12 padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}                       
                 </div>
                 <div class="float-right w-50">                   
                        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
                 </div>
             </div>

      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
            <thead class="bgSpec" {*class="bg-info thead-color"*}>
                <tr role="row">
                            {*<th> #</th> *}                                                
                             <th>{__('ID')}</th>    
                            <th>{__('User')}</th>      
                            <th>{__('Job')}</th> 
                             <th>{__('Budget')}</th> 
                            <th>{__('Created At')}</th>                                                      
                            <th>{__('Updated At')}</th>
                            <th>{__('Committed At')}</th>
                            <th>{__('Refused At')}</th>
                            <th>{__('Published At')}</th>                       
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                       <tbody>
                          <tr role="row">
                              <td></td>
                              <td>
                                   <input class="search form-control" name="lastname" placeholder="{__('Lastname,firstname,email,mobile')}" value="{$formFilter.search.lastname}"/>
                              </td>
                              <td>
                                   <input class="search form-control" name="reference" placeholder="{__('Reference')}" value="{$formFilter.search.reference}"/>
                              </td>
                              <td></td>
                               <td></td>
                              <td></td>
                               <td>
                                    {html_options class="equal form-control" name="committed_at" options=$formFilter->equal.committed_at->getChoices()  selected=$formFilter.equal.committed_at} 
                              </td>
                                <td>
                                  {html_options class="equal form-control" name="refused_at" options=$formFilter->equal.refused_at->getChoices()  selected=$formFilter.equal.refused_at} 
                              </td>
                              <td>
                                  {html_options class="equal form-control" name="published_at" options=$formFilter->equal.published_at->getChoices()  selected=$formFilter.equal.published_at} 
                              </td>
                              <td></td>                             
                          </tr>
                      </tbody>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>      
                                 <td>{$item->getEmployerUser()->getFormatter()->getName()} ({$item->getEmployerUser()->getFormatter()->getNumberOfAdverts()})
                                     <div>{$item->getEmployerUser()->get('email')} / {$item->getEmployerUser()->get('mobile')}</div>
                                     {if $item->getEmployerUser()->hasCompany()}
                                         <div><strong>{$item->getEmployerUser()->getCompany()} ({$item->getEmployerUser()->getCompany()->getFormatter()->getNumberOfAdverts()})</strong></div>
                                     {/if}    
                                 </td>
                                <td>{$item->getFormatter()->getNumberOfLanguages()->getChoicesText("[0]no language|[1]one language|(1,Inf]%s languages")} /
                                   {$item->getFormatter()->getNumberOfCategories()->getChoicesText("[0]no categorie|[1]one categorie|(1,Inf]%s categories")} /
                                   {$item->getFormatter()->getNumberOfDocuments()->getChoicesText("[0]no document|[1]one document|(1,Inf]%s documents")}
                                </td>     
                                   <td>{$item->getFormatter()->getBudget()->getAmount()}</td>
                                <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>  
                                <td>{$item->getFormatter()->getUpdatedAt()->getText()}</td>   
                                 <td>
                                     {if $item->hasCommittedAt()}
                                        {$item->getFormatter()->getCommittedAt()->getText()}
                                    {else}
                                        {__('---')}
                                    {/if}
                                </td>
                                   <td>
                                     {if $item->hasRefusedAt()}
                                        {$item->getFormatter()->getRefusedAt()->getText()}
                                    {else}
                                        {__('---')}
                                    {/if}
                                </td> 
                                <td>
                                     {if $item->hasPublishedAt()}
                                        {$item->getFormatter()->getPublishedAt()->getText()}
                                    {else}
                                        {__('---')}
                                    {/if}
                                </td>  
                                  <td>   
                                     <a href="#" class="list-action text-info Display" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-search" aria-hidden="true"></i></a>                                    
                                    
                                     {*if $item->isDeleteAvailable()}
                                     <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" title="{__('Delete')}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                     {/if*}
                                  </td>
                            </tr>
                            {foreach $item->getAdvertsI18n() as $i18n}                                                                   
                            <tr>
                                <td></td>
                                 <td></td>
                                <td>                                 
                                    <div>{__('Ref.')}: {$i18n->get('reference')}</div>
                                    <div>{$i18n->getFormatter()->getLanguage()->getText()->ucfirst()} - <a target="_blank" href="{$i18n->getUrl()}">{$i18n->get('title')}</a></div>   
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                    
                                </td>
                                 <td>
                                    {if $item->getNumberOfLanguages() > 1}
                                        {if $i18n->hasRefusedAt()}
                                            {$i18n->getFormatter()->getRefusedAt()->getText()}
                                        {else}
                                            {__('---')}
                                        {/if}
                                    {/if}
                                </td>
                                <td>
                                    {if $item->getNumberOfLanguages() > 1}
                                        {if $i18n->hasPublishedAt()}
                                            {$i18n->getFormatter()->getPublishedAt()->getText()}
                                        {else}
                                            {__('---')}
                                        {/if}
                                    {/if}
                                </td>
                                 <td>
                                    
                                </td>                              
                            </tr>
                             {/foreach}
                         {/foreach}
                         {if !$pager->hasItems()}
                             <tr role="row" >
                                 <td  colspan="13">{__('No result')}</td>
                             </tr>
                         {/if}  
                        </tbody>         
                    </table>
                 
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}  
  
  </div>

 <script type="text/javascript">
     
        
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
        
         function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  },
                                    range : { },                                                                                                                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); }); 
            $(".Range.Date").each(function () {
               // params.filter.range[$(this).attr('name')]= { }
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}" ,                          
                            target: "#actions"
                             });
        }
   
{* =================================== PAGER/FILTER ======================================================== *}             
        
        $("#init").click(function() {                   
              return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}",                                    
                         target: "#actions"}); 
        }); 
        
        $("#filter").click(function() { return updateFilter(); }); 
    
        $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
        });                  
                                                
        $(".equal").change(function() { return updateFilter(); });  
     
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Advertising \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Advertising: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteAdvert'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteAdvertising') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
        
     
         $(".Display").click( function () {                 
                return $.ajax2({ data :{ EmployerAdvert: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DisplayAdvert'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
       $("#GenerateRevivals").click(function() {                   
              return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'GenerateRevival'])}",                                    
                         target: "#actions"}); 
        }); 
      
</script> 
  