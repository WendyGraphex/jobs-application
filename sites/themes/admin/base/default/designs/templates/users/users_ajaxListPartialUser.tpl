
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Users')}</h3>
              <h3 class="admin-header-small-text">{__('Users accounts')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    {*<a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Gallery')}</a>*}
                    <a class="btn btn-success admin-header-button" href="#" id="New"><i class="fa fa-plus"></i> {__('Add user')}</a>
                    <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Users')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Accounts')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
        <div class="table-responsive bg-white px-1 py-2">
          <div class="col-md-12">
                
                <div class="float-left w-50">
                   {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                </div> 
                <button id="filterSecond" class="btn btn-primary filterbtn" >{__("Filter")}</button>
                <button id="initSecond" class="btn btn-primary initbtn">{__("Init")}</button>              
             </div>
        </div>
         <div class="table-responsive bg-white px-1 py-2">
      <div class="col-md-12">
      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead style="background-color: #37BC9B;color: white;">
        <tr role="row">
            <th class="sorting">#</th>
            <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting" >
                <span class="mr-1">{__('Email')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><i class="fas fa-sort-up {if $formFilter.order.email->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><i class="fas fa-sort-down {if $formFilter.order.email->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting" >
                <span class="mr-1">{__('Function')}</span>
                {*<div class="position-relative float-right mr-2">
                    <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.function->getValueExist('asc','_active')}" id="asc" name="function"><i class="fas fa-sort-up"></i></a>
                    <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.function->getValueExist('desc','_active')}" id="desc" name="function"><i class="fas fa-sort-down"></i></a>            
                </div>*}
            </th>
            <th class="sorting" >
                <span class="mr-1">{__('First name')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><i class="fas fa-sort-up {if $formFilter.order.firstname->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><i class="fas fa-sort-down {if $formFilter.order.firstname->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting" >
                 <span class="mr-1">{__('Last name')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><i class="fas fa-sort-up {if $formFilter.order.lastname->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><i class="fas fa-sort-down {if $formFilter.order.lastname->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>         
            <th class="sorting">
                <span class="mr-1">{__('Created At')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting">
                <span class="mr-1"> {__('Last Sign In')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>          
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
              <td></td>
              <td> <input class="form-control form-control-sm ml-1 search" name="email" value="{$formFilter.search.email}"></td>
              <td></td>
              <td> <input class="form-control form-control-sm ml-1 search" name="firstname" value="{$formFilter.search.firstname}"></td>
              <td> <input class="form-control form-control-sm ml-1 search" name="lastname" value="{$formFilter.search.lastname}"></td>             
              <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
              </td>
                <td> 
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date lastloginDate" id="lastlogin_from" date-id="from" placeholder="{__('From')}" name="lastlogin" value="{if $formFilter->hasErrors()}{$formFilter.range.lastlogin.from}{else}{format_date($formFilter.range.lastlogin.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date lastloginDate" id="lastlogin_to" date-id="to" placeholder="{__('To')}" name="lastlogin" value="{if $formFilter->hasErrors()}{$formFilter.range.lastlogin.to}{else}{format_date($formFilter.range.lastlogin.to,'a')}{/if}">
                </td>            
              <td></td>
          </tr>
      </tbody>
      <tbody>
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td class="sorting_1">{$item->get('id')}</td>
          <td>{$item->get('email')}</td>
          <td>admin</td>
          <td>{$item->getFormatter()->getFirstname()->ucfirst()}</td>
          <td>{$item->getFormatter()->getLastname()->ucfirst()}</td>          
          <td>{$item->getFormatter()->getCreatedAt()->getFormatted()}</td>
          <td>{if $item->hasLastLogin()}{$item->getFormatter()->getLastLogin()->getFormatted()}{/if}</td>        
            <td>
                  {if $user->hasCredential([['superadmin','admin','settings_user_password_creation']])}
                    <a href="#" title="{__('create password')}" class="CreatePassword" id="{$item->get('id')}"
                       name="{$item->get('firstname')} {$item->get('lastname')}"><i class="fa fa-lock"></i></a>
                {/if}
                {if $user->hasCredential([['superadmin','admin','settings_user_password_generation']])}
                    <a href="#" title="{__('regenerate password')}" class="RegeneratePassword" id="{$item->get('id')}"
                       name="{$item->get('firstname')} {$item->get('lastname')}"><img
                                src="{url('/icons/password.png','picture')}" alt='{__("regenerate password")}'/></a>
                {/if}
              <a href="#" class="list-action text-info View" id="{$item->get('id')}" data-toggle="tooltip" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
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
      </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
  </div><!--End list-->
      
  

<script type="text/javascript">
    
    
    var created_at_dates = $( ".Range.CreatedAtDate#created_at_from, .Range.CreatedAtDate#created_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "created_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				created_at_dates.not( this ).datepicker( "option", option, date );
    } } );

    var lastlogin_dates = $( ".Range.lastloginDate#lastlogin_from, .Range.lastloginDate#lastlogin_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "lastlogin_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				lastlogin_dates.not( this ).datepicker( "option", option, date );
    } } );
    
    
    
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },  
                                    range: { },  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}" ,                          
                            target: "#actions"
                             });
        }
        $("#filterSecond").click(function() { return updateFilter(); }); 
        $("#initSecond").click(function() {                   
               return $.ajax2({ url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}",                                    
                         target: "#actions"}); 
           }); 
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });
    
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
          
          
    $(".View").click( function () {                    
                return $.ajax2({ data : { User : $(this).attr('id') },                               
                                url:"{url_to('users_ajax',['action'=>'ViewUser'])}",                             
                                target: "#actions"});
         });
         
         
         $(".list").dblclick( function () {                    
                return $.ajax2({ data : { User : $(this).attr('id') },                               
                                url:"{url_to('users_ajax',['action'=>'ViewUser'])}",                             
                                target: "#actions"});
         });
   
   $("#New").click( function () {             
            return $.ajax2({                    
                url: "{url_to('users_ajax',['action'=>'NewUser'])}",               
                target: "#actions"
           });
         });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("User \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ User: $(this).attr('id') },
                                 url :"{url_to('users_ajax',['action'=>'DeleteUser'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteUser') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            }); 

     
        
        $(".equal").change(function() { return updateFilter(); });

     
        $(".CreatePassword").click(function () {
            return $.ajax2({
                data: { User: $(this).attr('id') },
                url: "{url_to('users_ajax',['action'=>'CreatePasswordUser'])}",            
                target: "#actions"
            });
        });
        
         $(".RegeneratePassword").click(function () {
            return $.ajax2({
                data: { id: this.id },            
                url: "{url_to('users_ajax',['action'=>'RegeneratePassword'])}",            
                success: function (resp) {
                    if (resp.action == 'RegeneratePasswordUser' && resp.params.id && resp.params.date)
                        $("#lastpasswordgen-" + resp.params.id).html(resp.params.date);
                }
            });
        });
</script>
  