<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Events')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Events')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="New" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('New')}</a>                
        </div>
    </div>
</div>        
        {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
        
    <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            {*<th> #</th> *}                                                
                            <th>{__('ID')}</th>                             
                            <th>{__('Event')}</th> 
                            <th>{__('Price')}</th> 
                            <th>{__('Created At')}</th>                                                                                
                             <th>{__('Committed At')}</th>                             
                            <th>{__('Published At')}</th>
                            <th>{__('State')}</th> 
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td><span class="SiteEvent" name="number_of_languages" id="{$item->get('id')}">
                                    {$item->getFormatter()->getNumberOfLanguages()->getChoicesText("[0]no language|[1]one language|(1,Inf]%s languages")}
                                    </span>
                                    {* ({$item->getEventsI18n()->getLanguages()->getText()->implode(', ')}) *}
                                </td> 
                                <td>{$item->getFormatter()->getBudget()->getAmount()}</td>                               
                                <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>                                                           
                                  <td class="SiteEvent" name="committed" id="{$item->get('id')}">
                                         {if $item->hasCommittedAt()}
                                        {$item->getFormatter()->getCommittedAt()->getText()}
                                    {else}
                                        {__('---')}
                                    {/if}
                                </td>
                                <td>
                                </td>                                  
                                  <td class="SiteEvent" name="state" id="{$item->get('id')}">
                                      {$item->getStateI18n()}
                                </td>
                                  <td>                                         
                                     <a href="#" class="list-action text-info View" {if $item->hasCommittedAt()}style="display:none"{/if} id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-edit"></i></a>                                                                                                                                                                                                
                                     <a href="#" class="list-action text-info Display" {if !$item->hasCommittedAt()}style="display:none"{/if} id="{$item->get('id')}" title="{__('Display')}"><i class="fa fa-search"></i></a>                                                                                                                                                                                                
                                     <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('reference')}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                     
                                     &nbsp;
                                     {if !$item->hasCommittedAt()}
                                      <button type="button" class="btn btn-outline-primary btn-sm Commit" id="{$item->get('id')}" title="{__('Publish')}"><i class="fa fa-check icon-sm" style="font-size: 1.00rem;"></i>{__('Publish')}</button>
                                      {/if}
                                  </td>
                            </tr>
                            {foreach $item->getEventsI18n() as $i18n}                                                                   
                            <tr class="list-i18n" id="{$i18n->get('id')}" data-advert="{$item->get('id')}" role="row">
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
                                     {if $i18n->hasPublishedAt()}
                                        {$i18n->getFormatter()->getPublishedAt()->getText()}
                                     {/if}   
                                </td>
                                 <td class="SiteEventI18n" name="state" id="{$item->get('id')}">
                                    {if $i18n->hasPublishedAt()}
                                        {__('Approved')}
                                    {elseif !$i18n->hasRefusedAt() && $item->hasCommittedAt()}
                                        {__('Approval')}
                                    {elseif $i18n->hasRefusedAt()}
                                        {__('Refused')}                                                                      
                                    {/if}
                                </td>                               
                                <td>
                                    <a href="#" class="list-action text-info DeleteI18n" id="{$i18n->get('id')}" name="{$i18n->get('reference')}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                     
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
                  </div>
                </div>
              </div>
            </div>
                {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}        

 <script type="text/javascript">
  
       function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },
                                    range : { },                                                                                                                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
                         return params; 
        }
     
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}" ,                          
                            target: "#actions"
                             });
        }
        
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
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Job \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteEvent: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'DeleteEvent'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEvent') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          $(".list-i18n[data-advert="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
            
            
         $(".DeleteI18n").click( function () { 
                if (!confirm('{__("Eventising \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteEventI18n: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'DeleteEventI18n'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEventI18n') return ;                                          
                                          $(".list-i18n[id="+resp.id+"]").remove();                                           
                                          $(".SiteEvent[name=number_of_languages][id="+resp.advert_id+"]").html(resp.number_of_languages);
                                 }
                     });                                        
            });  

        
        $("#New").click( function () {                 
                return $.ajax2({ 
                                 url :"{url_to('site_event_ajax',['action'=>'NewEvent'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
         $(".View").click( function () {                 
                return $.ajax2({ data :{ SiteEvent: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'ViewEvent'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
            
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('site_event_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
         $('.Commit').click(function(){                                       
          return $.ajax2({ data :{ SiteEvent: $(this).attr('id') },
                           url: "{url_to('site_event_ajax',['action'=>'CommitEvent'])}",                           
                           success : function (resp)
                                {
                                    if (resp.action != 'CommitEvent') return ;
                                    $(".Commit[id="+resp.id+"]").remove();
                                    $(".SiteEvent[name=committed][id="+resp.id+"]").html(resp.committed_at);
                                    $(".SiteEvent[name=state][id="+resp.id+"]").html(resp.state);
                                    $(".SiteEventI18n[name=state][id="+resp.id+"]").html(resp.state_i18n);
                                    $(".Display[id="+resp.id+"]").show();
                                    $(".View[id="+resp.id+"]").hide();
                                }
              
                         }); 
        }); 
      
        $(".Display").click( function () {                 
                return $.ajax2({ data :{ SiteEvent: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'DisplayEvent'])}",                               
                                 target :"#actions"
                     });                                        
            });
      
</script> 
   