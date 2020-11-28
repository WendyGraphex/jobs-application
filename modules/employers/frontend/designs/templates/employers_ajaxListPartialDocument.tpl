{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="New" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('New')}</a>                
        </div>
    </div>
</div>        
    <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            {*<th> #</th> *}                                                
                            <th class="sorting">{__('ID')}</th> 
                            <th class="sorting">{__('Name')}</th> 
                            <th class="sorting">{__('Title')}</th> 
                            <th class="sorting">{__('Created At')}</th>                                                      
                            <th class="sorting">{__('Updated At')}</th>
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->get('name')}</td>
                                <td>{$item->get('title')}</td>
                                <td>{$item->get('created_at')}</td>  
                                <td>{$item->get('updated_at')}</td>                                
                                  <td>   
                                     {if $item->get('id') != $user->getGuardUser()->get('id')}
                                     <a href="#" class="list-action text-info View" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-edit" aria-hidden="true"></i></a>
                                     {/if}
                                     {*if $item->isDeleteAvailable()}
                                     <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" title="{__('Delete')}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                     {/if*}
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
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Document \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Document: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteDocument'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteDocument') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
        
        $("#New").click( function () {                 
                return $.ajax2({ url :"{url_to('employers_ajax',['action'=>'NewDocument'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
         $(".View").click( function () {                 
                return $.ajax2({ data :{ EmployerDocument: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'ViewDocument'])}",                               
                                 target :"#actions"
                     });                                        
            });  
</script> 
