
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Employers')}</h3>
              <h3 class="admin-header-small-text">{__('Employer users management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">             
                  <a class="btn btn-danger admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New user')}</a>
                  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <a href="#">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <a href="#" id="List"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Users for employer [%s]',(string)$company)}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
{if $company->isLoaded()}
          <!-- Begin Add User -->
<div class="table-responsive bg-white px-2 py-2">
             <div class="col-md-12 padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                 </div> 
                  <div class="float-right w-50">                   
                        <button  id="filter" class="btn btn-primary btn-color btn-f" >{__("Filter")}</button>   
                        <button  id="init" class="btn-init btn btn-primary btn-color btn-f">{__("Init")}</button>
                 </div>
             </div>
    <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col">
      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead class="bg-info thead-color">
        <tr role="row">
            <th  class="sorting_asc">ID</th>          
            <th class="sorting">{__('Firstname/Lastname')}</th>           
            <th class="sorting">{__('Email')}</th>
            <th class="sorting">{__('Phone')}</th>
            <th class="sorting">{__('Mobile')}</th>
            <th class="sorting">{__('Fax')}</th>          
             <th class="sorting">{__('Created at')}</th>
              <th class="sorting">{__('Updated at')}</th>
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>              
              <td><input class="form-control form-control-sm ml-1 search" name="firstname" value="{$formFilter.search.firstname}"></td>                    
              <td><input class="form-control form-control-sm ml-1 search" name="email" value="{$formFilter.search.email}"></td>
              <td><input class="form-control form-control-sm ml-1 search" name="email" value="{$formFilter.search.phone}"></td>
              <td></td>
              <td></td>           
              <td></td>
              <td></td>             
               <td></td>    
             
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td>{$item->get('id')}</td>       
          <td>{$item->getFormatter()->getGender()} {$item->get('firstname')} {$item->get('lastname')}</td>
          <td>{$item->get('email')}</td>          
          <td>{$item->get('phone')}</td>
          <td>{$item->get('mobile')}</td>          
          <td>{$item->get('fax')}</td>                      
          <td>{$item->getFormatter()->getUpdatedAt()->getText()}</td>     
          <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>              
            <td>
              <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt icon-font"></i></a>              
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt icon-font" style="color: rgb(189, 33, 48);"></i></a>
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
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 

  </div>
<script type="text/javascript">
    
     function getFilterParameters()
        {
            var params={    EmployerCompany: '{$company->get('id')}',
                            filter: {  order : { }, 
                                    search : { },
                                    equal: {   },                                                                                                                                   
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");  
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
            $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });           
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
         $("#init").click(function () {                     
                return $.ajax2({ data : { EmployerCompany: '{$company->get('id')}' },
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}",                                
                                 target: "#actions"
                });
        });
        
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}",                                
                                 target: "#actions"
                });
        });

      $(".View").click( function () {                    
                  return $.ajax2({ data : { EmployerUser : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewUserForCompany'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {                    
                  return $.ajax2({ data : {  EmployerCompany: '{$company->get('id')}' },                               
                                  url:"{url_to('employers_ajax',['action'=>'NewUserForCompany'])}", 
                                  target: "#actions"});
          });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Employer user \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerUser: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteUser'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteUser') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });    
     
      $("#List").click( function () {                    
                  return $.ajax2({  url:"{url_to('employers_ajax',['action'=>'ListPartialCompany'])}", 
                                  target: "#actions"});
          });
</script>
{else}
    {__('Company is invalid.')}
{/if}    
