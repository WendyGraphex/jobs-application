
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Customers')}</h3>
              <h3 class="admin-header-small-text">{__('Customer management|Newsletter')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                   
                  <a class="btn btn-danger admin-header-button btn-color"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Newsletter')}</a>
                  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
{alerts}
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <a href="/admin">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Newsletter')}
            </p>
          </div>
          <!-- End breadcrumb -->

          <!-- Begin Add User -->
<div class=" bg-white px-2 py-2">
             <div class="col-md-12 padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}
                       
                 </div>
                 <div class="float-right w-50">                   
                        <button style="float: right; background-color: #c8c8c8; color: black; border-radius: 0; border: 0;" id="filter" class="btn btn-primary btn-color" >{__("Filter")}</button>   
                        <button style="float: right; margin-right: 5px; background-color: #c8c8c8; color: black; border-radius: 0; border: 0;padding-left: 15px;padding-right: 15px;" id="init" class="btn btn-primary btn-color">{__("Init")}</button>
                 </div>
             </div>
      <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
       <thead class="bgSpec">{*<thead class="bg-info thead-color">*}
        <tr role="row">
            <th  class="sorting_asc">#</th>
            <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting" ><span>{__('Username')}</span>  
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('asc','_active')}" id="asc" name="username"><i class="fas fa-sort-up {if $formFilter.order.username->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('desc','_active')}" id="desc" name="username"><i class="fas fa-sort-down {if $formFilter.order.username->getValue()=='desc'}text-dark{/if}"></i></a>                              
                </div>  
            </th>   
            <th class="sorting"><span>{__('First Name')}</span>
                <div style="float: right;"> 
                    <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><i class="fas fa-sort-up {if $formFilter.order.firstname->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><i class="fas fa-sort-down {if $formFilter.order.firstname->getValue()=='desc'}text-dark{/if}"></i></a>                              
                </div>
            </th>   
            <th class="sorting"><span>{__('Last Name')}</span>
               <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><i class="fas fa-sort-up {if $formFilter.order.lastname->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><i class="fas fa-sort-down {if $formFilter.order.lastname->getValue()=='desc'}text-dark{/if}"></i></a>                              
               </div>
            </th>   
            <th class="sorting"><span>{__('Email')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><i class="fas fa-sort-up {if $formFilter.order.email->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><i class="fas fa-sort-down {if $formFilter.order.email->getValue()=='desc'}text-dark{/if}"></i></a>                              
                </div>
            </th>   
            <th class="sorting">{__('Phone')}</th>
            <th class="sorting">{__('Fax')}</th>
            <th class="sorting">{__('Adress1')}</th>
            <th class="sorting">{__('Adress2')}</th>
            <th class="sorting">{__('City')}</th>
            <th class="sorting">{__('State')}</th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Updated At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down  {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}" ></i></a>           
                </div>
            </th>
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
            <td></td>
            <td></td>
            <td><input class="form-control form-control-sm ml-1 search" name="username" value="{$formFilter.search.username}"></td>
            <td><input class="form-control form-control-sm ml-1 search" name="firstname" value="{$formFilter.search.firstname}"></td>
            <td><input class="form-control form-control-sm ml-1 search" name="lastname" value="{$formFilter.search.lastname}"></td>
             <td><input class="form-control form-control-sm ml-1 search InputTexte" name="email" value="{$formFilter.search.email}"></td>
            <td><input class="form-control form-control-sm ml-1 search" name="phone" value="{$formFilter.search.phone}"></td>
            <td></td>
            <td><input class="form-control form-control-sm ml-1 search" name="adress1" value="{$formFilter.search.adress1}"></td>
            <td><input class="form-control form-control-sm ml-1 search" name="adress2" value="{$formFilter.search.adress2}"></td>
            <td><input class="form-control form-control-sm ml-1 search" name="city" value="{$formFilter.search.city}"></td>
            <td></td>
            <td>
                <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
            </td>
            <td> 
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
            </td>
              <td></td>
          </tr>
     
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
        <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        <td class="list">{$item->get('id')}</td>
        <td>{$item->get('username')}</td>
        <td>{$item->get('firstname')}</td>
        <td>{$item->get('lastname')}</td>
        <td>{$item->get('email')}</td>
        <td>{$item->get('phone')}</td>
        <td>{$item->get('fax')}</td>
        <td>{$item->get('adress1')}</td>
        <td>{$item->get('adress2')}</td>
        <td>{$item->get('city')}</td>
        <td>{$item->get('state')}</td>
        <td>       
                     {$item->getFormatter()->getCreatedAt()->getFormatted()}
             </td> 
             <td>                
                     {$item->getFormatter()->getUpdatedAt()->getFormatted()}
             </td>
         <td>
              <a href="#" class="list-action text-info View" id="{$item->get('id')}"   data-target="#page-wrapper" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
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
     {* </div>*}
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
  </div>
  </div>
<script type="text/javascript">
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },                                                                                                                                   
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('customers_newsletter_ajax',['action'=>'ListPartial'])}" ,                          
                            target: "#page-wrapper"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_newsletter_ajax',['action'=>'ListPartial'])}?page="+$(this).attr('data-page'),                                
                                 target: "#page-wrapper"
                });
        });
          
       $("#init").click(function () {                     
                return $.ajax2({ url:"{url_to('customers_newsletter_ajax',['action'=>'ListPartial'])}",                                
                                 target: "#actions"
                });
        });    
      $(".View").click( function () {                    
                  return $.ajax2({ data : { Customer : $(this).attr('id') },                               
                                  url:"{url_to('customers_newsletter_ajax',['action'=>'View'])}",                                                       
                                  target: "#page-wrapper"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('customers_newsletter_ajax',['action'=>'New'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Newsletter \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ CustomerNewsletter: $(this).attr('id') },
                                 url :"{url_to('customers_newsletter_ajax',['action'=>'DeleteEmail'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEmail') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });    
     
</script>

