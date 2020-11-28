{alerts} 
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
            
              {if $formFilter.equal.sender->getValue() !='EMPLOYEE'}     
                <a href="#" id="Sent" class="btn btn-primary admin-header-button"><i class="fa fa-list mr-2"></i>{__('Sent messages')}</a> 
              {else}  
                 <a href="#" id="Received" class="btn btn-primary admin-header-button Init"><i class="fa fa-list mr-2"></i>{__('Messages')}</a> 
              {/if}   
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
                            <th>{__('#')}</th> 
                            <th>
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">...</button>
                                    <div class="dropdown-menu" x-placement="top-start">
                                        <a class="dropdown-item" href="#"><i class="fa fa-trash"></i>{__('Delete')}</a>                     
                                    </div>
                                </div>                                
                            </th>
                            <th>{__('From')}</th> 
                            <th>{__('To')}</th> 
                            <th>{__('Subject/Message')}</th>                            
                            <th>{__('Received At')}</th> 
                            <th>{__('Read?')}</th>
                            <th>{__('Actions')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>  
                                <td>
                                    <div class="form-check form-check-flat form-check-primary">
                                        <label class="form-check-label"><input type="checkbox" class="form-check-input"><i class="input-helper"></i></label>
                                    </div>
                                </td>
                                <td>
                                    {if $item->isSender()}
                                        {$user->getGuardUser()->getFormatter()->getFirstname()->ucfirst()}  {$user->getGuardUser()->getFormatter()->getLastname()->ucfirst()}
                                    {else}
                                        {if $item->hasEmployerUser()}
                                            {$item->getEmployerUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployerUser()->getFormatter()->getlastname()->ucfirst()}
                                        {else}
                                            {__('Administrator')}
                                        {/if}    
                                    {/if}    
                                </td>   
                                <td>   
                                    {if !$item->isSender()}                                        
                                        {$user->getGuardUser()->getFormatter()->getFirstname()->ucfirst()}  {$user->getGuardUser()->getFormatter()->getLastname()->ucfirst()}
                                    {else}                                   
                                        {if $item->hasEmployerUser()}
                                            {$item->getEmployerUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployerUser()->getFormatter()->getlastname()->ucfirst()}
                                        {else}
                                            {__('Administrator')}
                                        {/if} 
                                    {/if}   
                                </td>
                                <td><div>{$item->get('subject')|escape}</div>
                                    <div>{$item->get('message')|escape|truncate:80}</div>                                     
                                    {if $item->hasFiles()}
                                        {$item->getFormatter()->getNumberOfFiles()->getChoicesText('[0]no file|[1]one file|(1,Inf]%s files')}
                                    {/if}    
                                </td>                                           
                                <td>{$item->getCreatedAt()->getText()}</td>                                                       
                                <td class="CustomerEmployeeMessage Read" id="{$item->get('id')}">
                                    {if !$item->isRead()}
                                        <i class="fa fa-circle text-danger"></i>
                                    {/if}    
                                </td>  
                                <td>  
                                    {if !$item->isSender()}       
                                        <a href="#" class="list-action text-info Reply" id="{$item->get('id')}"  title="{__('Reply')}"><i class="fa fa-reply" aria-hidden="true"></i></a>                                      
                                        {/if}
                                    <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('View')}"><i class="fa fa-search" aria-hidden="true"></i></a>
                                    <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('subject')} {$item->getCreatedAt()->getText()}" title="{__('Delete')}"><i class="fa fa-trash" aria-hidden="true"></i></a>

                                </td>
                            </tr>
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

<div id="Modal-Message" class="modal" role="dialog">
    <div class="modal-dialog modal-lg">    
        <div class="modal-content">
            <div class="px-2">
                <span class="close" id="Modal-Message-Close" style="cursor: pointer;">&times;</span>   
            </div>  
            <div id="Modal-Message-ctn" class="tab-content" style="padding: 20px;">            
            </div>
        </div>
    </div>
</div> 
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}                        
 <script type="text/javascript">
              
        $("#Modal-Message-Close").click(function () {  $("#Modal-Message").hide();   });
          
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },   
                                    notequal: { },                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employees_messager_ajax',['action'=>'ListPartialMessage'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });
        
        $(".equal").change(function() { return updateFilter(); });
        
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_messager_ajax',['action'=>'ListPartialMessage'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $(".filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_messager_ajax',['action'=>'ListPartialMessage'])}",
                                 target: "#actions"
                });
        });
        
          $("#init,#Received").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('employees_messager_ajax',['action'=>'ListPartialMessage'])}",               
                    target: "#actions"
              });
            });
        
        function updatePager(n)
        {
          /* page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());*/
        }
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Message \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployeeMessage: $(this).attr('id') },
                                 url :"{url_to('employees_messager_ajax',['action'=>'DeleteMessage'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteMessage') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
        
        $(".Reply").click( function () {                 
                return $.ajax2({  data :{ EmployeeMessage: $(this).attr('id') },
                                  url :"{url_to('employees_messager_ajax',['action'=>'ReplyMessage'])}",                               
                                  target :"#Modal-Message-ctn",
                                  success: function () { $("#Modal-Message").show(); },
                     });                                        
            });  
            
         $(".View").click( function () {                 
                return $.ajax2({ data :{ EmployeeMessage: $(this).attr('id') },
                                 url :"{url_to('employees_messager_ajax',['action'=>'ViewMessage'])}",                               
                                 target :"#Modal-Message-ctn",
                                 success: function () { $("#Modal-Message").show(); },
                     });                                        
            });  
            
            
     $("#Sent").click(function () { 
        var params = { filter: {  order : { created_at : 'desc' }, 
                                    search : { },
                                    equal: { sender : 'EMPLOYEE' },   
                                    notequal: { sender : '' },                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                            } };      
        return $.ajax2({    
                    data : params,
                    url: "{url_to('employees_messager_ajax',['action'=>'ListPartialMessage'])}",               
                    target: "#actions"
              });
   });
</script> 
