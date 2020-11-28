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
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Courses')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm" style="padding: 0;">
        <div class="buttonSave">
                <a href="#" id="New" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('New')}</a>           
        </div>
    </div>
</div> 
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">               
            <div class="table-responsive pt-3">
                <table id="PaymentRequests" class="table table-bordered table-striped">
                    <thead class="">
                        <tr role="row">
                            <th>#</th>                              
                            <th>{__('Ref.')}           
                            </th>
                             <th>{__('Language')}</th> 
                            <th>{__('Date')} 

                            </th>          
                            <th>{__('Title')}
                            </th>                            
                            <th>{__('Price')}</th> 
                            <th>{__('Committed at')}</th> 
                            <th>{__('Published at')}</th> 
                            <th>{__('State')}</th>
                            <th>{__('Actions')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>                           
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                    
                            <td></td>
                             <td></td>
                             <td></td>
                              <td></td>
                        </tr>
                    </tbody>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>  
                                <td>
                                   {$item->get('reference')} 
                                </td>
                                 <td>
                                   {$item->getFormatter()->getLanguage()->getText()->ucfirst()} 
                                </td>
                                <td>
                                     {$item->getFormatter()->getCreatedAt()->getText()} 
                                </td> 
                                <td>
                                    <a href="{$item->getUrl()}">{$item->getFormatter()->getTitle()->ucfirst()}</a>
                                </td>                                                               
                                <td>
                                    {$item->getFormatter()->getPrice()->getAmount()} 
                                </td>  
                                <td class="CustomerAcademyCourse" id="{$item->get('id')}" name="committed">
                                      {if $item->hasCommittedAt()}
                                            {$item->getFormatter()->getCommittedAt()->getText()}
                                        {/if}   
                                </td>
                                <td>
                                    {if $item->hasPublishedAt()}
                                            {$item->getFormatter()->getPublishedAt()->getText()}
                                        {/if}   
                                </td>                               
                                <td class="CustomerAcademyCourse" id="{$item->get('id')}" name="state">
                                    {if $item->hasPublishedAt()}
                                            {__('Approved')}
                                        {elseif !$item->hasRefusedAt() && $item->hasCommittedAt()}
                                            {__('Approval')}
                                        {elseif $item->hasRefusedAt()}
                                            {__('Refused')}     
                                        {elseif $item->get('state')=='DRAFT'}
                                            {__('Draft')}
                                        {/if}
                                </td>
                                <td> 
                                    <a href="#" class="list-action text-info View" {if $item->hasCommittedAt()}style="display:none"{/if} id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-edit"></i></a>                                                                                                                                                                                                
                                    <a href="#" class="list-action text-info Display" {if !$item->hasCommittedAt()}style="display:none"{/if} id="{$item->get('id')}" title="{__('Display')}"><i class="fa fa-search"></i></a>                                                                                                                                                                                                
                                    <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('reference')}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                     
                                    &nbsp;
                                    {if !$item->hasCommittedAt()}
                                        <button type="button" class="btn btn-primary btn-sm Commit" id="{$item->get('id')}" title="{__('Commit')}"><i class="fa fa-check icon-sm" style="font-size: 1.00rem;"></i>{__('Commit')}</button>
                                        {/if}
                                </td>                                   
                            </tr>  

                        {/foreach}
                        {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="13">{__('No course')}</td>
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
    
           
     
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('customers_academy_teacher_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
         
       
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                            
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });
            $(".equal.Status.Selected").each(function () { params.filter.equal.status=$(this).attr('name'); });
            $(".range.Date").each(function () {
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
                            url:"{url_to('customers_academy_teacher_ajax',['action'=>'ListPartialCourse'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function() {                   
            return $.ajax2({ 
                      data : { filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                                                    
                                selection : $("#PaymentRequests").data('selection'),
                                token:'{$formFilter->getCSRFToken()}'
                         } },
                      url:"{url_to('customers_academy_teacher_ajax',['action'=>'ListPartialCourse'])}",                                    
                      target: "#actions"}); 
        }); 

       $('.order').click(function() {           
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             return updateFilter();
        });
                    
        $("#filter").click(function() { return updateFilter(); });                                             
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_academy_teacher_ajax',['action'=>'ListPartialCourse'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
       
        
        $("#New").click( function () {                 
                return $.ajax2({ url :"{url_to('customers_academy_teacher_ajax',['action'=>'NewCourseI18n'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
         $(".View").click( function () {                 
                return $.ajax2({ data :{ CustomerAcademyCourseI18n: $(this).attr('id') },
                                 url :"{url_to('customers_academy_teacher_ajax',['action'=>'ViewCourseI18n'])}",                               
                                 target :"#actions"
                     });                                        
            });  
    
 $('.Commit').click(function(){                                       
          return $.ajax2({ data :{ CustomerAcademyCourseI18n: $(this).attr('id') },
                           url: "{url_to('customers_academy_teacher_ajax',['action'=>'CommitCourseI18n'])}",                           
                           success : function (resp)
                                {
                                    if (resp.action != 'CommitCourseI18n') return ;
                                    $(".Commit[id="+resp.id+"]").remove();
                                    $(".CustomerAcademyCourse[name=committed][id="+resp.id+"]").html(resp.committed_at);
                                    $(".CustomerAcademyCourse[name=state][id="+resp.id+"]").html(resp.state);                                 
                                    $(".Display[id="+resp.id+"]").show();
                                    $(".View[id="+resp.id+"]").hide();
                                }
              
                         }); 
        }); 
      
      $(".Delete").click( function () { 
                if (!confirm('{__("Course \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ CustomerAcademyCourseI18n: $(this).attr('id') },
                                 url :"{url_to('customers_academy_teacher_ajax',['action'=>'DeleteCourseI18n'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCourseI18n') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();                                          
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
      
        $(".Display").click( function () {                 
                return $.ajax2({ data :{  CustomerAcademyCourseI18n: $(this).attr('id') },
                                 url :"{url_to('customers_academy_teacher_ajax',['action'=>'DisplayCourseI18n'])}",                               
                                 target :"#actions"
                     });                                        
            });
</script> 
 
   