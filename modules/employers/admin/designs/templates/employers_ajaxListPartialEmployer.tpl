<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Employers')}</h3>
        <h3 class="admin-header-small-text">{__('Accounts')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            {* <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Employer')}</a> *}
            <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
        </div> 
    </div>
</div>
<div class="breadcrumb-title">
    <p>              
        <i class="fa fa-home" style="color: #37bc9b;"></i>               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Accounts')}
    </p>
</div>
{alerts}              
<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
        </div> 
        <div class="float-right w-50">                   
            <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
            <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>
    </div>
    <table id="tableEmployer" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
            <tr class="list-header">    
                <th>#</th>
                <th>{__('ID')}           
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>
                <th>{__('Company')}           
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>
                <th class="NonBorder">
                    <label class="paddingLabel">
                        <span>{__('User Name')}</span>     
                        <div style="float: right;">
                            <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('asc','_active')}" id="asc" name="username"><i class="fas fa-sort-up {if $formFilter.order.username->getValue()=='asc'}text-dark{/if}"></i></a>
                            <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('desc','_active')}" id="desc" name="username"><i class="fas fa-sort-down {if $formFilter.order.username->getValue()=='desc'}text-dark{/if}"></i></a>            
                        </div>
                    </label>
                </th>
                <th class="NonBorder">
                    <label class="paddingLabel">
                        <span>{__('First Name')}</span>     
                        <div style="float: right;">
                            <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><i class="fas fa-sort-up {if $formFilter.order.firstname->getValue()=='asc'}text-dark{/if}"></i></a>
                            <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><i class="fas fa-sort-down {if $formFilter.order.firstname->getValue()=='desc'}text-dark{/if}"></i></a>            
                        </div>
                    </label>
                </th>
                <th class="NonBorder">
                    <label>
                        <span>{__('Last Name')}</span>   
                        <div style="float: right;">
                            <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><i class="fas fa-sort-up {if $formFilter.order.lastname->getValue()=='asc'}text-dark{/if}"></i></a>
                            <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><i class="fas fa-sort-down {if $formFilter.order.lastname->getValue()=='desc'}text-dark{/if}"></i></a>            
                        </div>   
                    </label>
                </th>
                <th class="NonBorder">
                    <label>
                        <span>{__('Online?')}</span>   
                    </label>
                </th>
                <th class="footable-first-column" data-toggle="true">
                    <span>{__('Is active')}</span>   
                </th>
                <th class="footable-first-column" data-toggle="true">
                    <span>{__('Is validated')}</span>   
                </th>
                <th class="footable-first-column" data-toggle="true">
                    <span>{__('Is completed')}</span>   
                </th>
                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                    <span>{__('Created at')}</span>   
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{*$formFilter.order.phone->getValueExist('asc','_active')*}" id="asc" name="created_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{*$formFilter.order.phone->getValueExist('desc','_active')*}" id="desc" name="created_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>
                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                    <span>{__('Updated at')}</span>   
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{*$formFilter.order.city->getValueExist('asc','_active')*}" id="asc" name="updated_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{*$formFilter.order.city->getValueExist('desc','_active')*}" id="desc" name="updated_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.updated_at->getValue()=='dsc'}text-dark{/if}"></i></a>            
                    </div>
                </th>
                <th data-hide="phone">{__('Actions')}</th>
            </tr>
        </thead>
        <tr class=" input-list">                
            <td></td>
            <td></td>                
            <td><input placeholder="{__('Company')}" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
            <td colspan="4">
                <input  placeholder="{__('Username, Firstname, Lastname, Email, Phone, Mobile, Address')}" class="search form-control" type="text" size="5" name="firstname" value="{$formFilter.search.firstname}" style="display: inline-block;width: 78%;">
                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_online" style="height: 31px;display: inline-block;width: 21%;padding-top: 4px;" options=$formFilter->equal.is_online->getOption('choices') selected=(string)$formFilter.equal.is_online}
            </td> 
            {*<td>
                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_online" options=$formFilter->equal.is_online->getOption('choices') selected=(string)$formFilter.equal.is_online}
            </td>*}
            <td>
                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}
            </td>
            <td>
                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_validated" options=$formFilter->equal.is_validated->getOption('choices') selected=(string)$formFilter.equal.is_validated}
            </td>
            <td>
                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_completed" options=$formFilter->equal.is_completed->getOption('choices') selected=(string)$formFilter.equal.is_completed}
            </td>
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
        <tbody>
            {foreach $pager as $item}
                <tr class="Type list" {if $item->hasI18n()}id="{$item->getI18n()->get('id')}"{/if}>
                    <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                    <td>{$item->get('id')}</td>
                    <td>{if $item->hasCompany()}
                        <a target="_blank" href="{$item->getCompany()->getUrl()}">{$item->getCompany()->getFormatter()->getName()}</a>
                        {else}
                            {__('---')}
                            {/if}    
                            </td>
                            <td colspan="4">
                                {if $item->hasAvatar()}
                                    <img class="classIcon" src="{$item->getAvatar()->getMedium()->getUrl()}" style="width: 45px;height: 45px;"/> 
                                {/if}                                
                                <a href="{$item->getUrl()}" target="_blank">{if $item->hasUserName()} {$item->getFormatter()->getUsername()}{/if}</a> <i class="fa fa-circle text-{if $item->isOnline()}success{else}danger{/if}"></i>
                                <div><i class="fa fa-address-card"></i> {$item->getFormatter()->getName()} {if $item->isFromInstagram()}(by Instagram){elseif $item->isFromLinkedin()}(by Linkedin){/if}</div>                                              
                                <div>{if $item->hasEmail()}<i class="fa fa-envelope"></i> {$item->get('email')}{/if}{if $item->hasMobile()} -- <i class="fa fa-mobile"></i> {$item->getFormatter()->getMobile()}{/if}</div>
                                <div>{if $item->hasPhone()}<i class="fa fa-phone"></i> {$item->getFormatter()->getPhone()}{/if}</div>
                                <div>{if $item->hasAddress1()}<i class="fa fa-map-marker"></i> {$item->get('address1')}{/if}{if $item->hasCountry()}-{$item->getFormatter()->getCountry()->getFormatted()->ucfirst()}{/if}</div>
                            </td>
                            {*<td>
                                <i class="fa fa-circle text-{if $item->isOnline()}success{else}danger{/if}"></i>
                            </td>*}
                            <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
                            </td>
                            <td class="align-middle text-center"> <a href="#" class="ChangeIsValidated" name="{$item->get('is_validated')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isValidated()}success{else}danger{/if}"></i></a>
                            </td>
                            <td class="align-middle text-center"> <a href="#" class="ChangeIsCompleted" name="{$item->get('is_completed')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isCompleted()}success{else}danger{/if}"></i></a>
                            </td>
                            <td>       
                                {$item->getFormatter()->getCreatedAt()->getFormatted()}
                            </td> 
                            <td>                
                                {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                            </td>
                            <td>
                                <a href="#" class="list-action text-info View" id="{$item->get('id')}"  data-toggle="modal"  data-target="#exampleModal" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
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
            </div>
            {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
        </div>

<script type="text/javascript">
    
{* =================================== METHODS ======================================================== *}
    
     function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
    }
    
    
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

    var updated_dates = $( " .Range.UpdatedAtDate#updated_at_from, .Range.UpdatedAtDate#updated_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "updated_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				updated_dates.not( this ).datepicker( "option", option, date );
    } } );
    
    
    
      function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { 
                                    name : $("[name=name] option:selected").val()  
                                    },
                                    range : { },
                                lang: $("img.Type").attr('id'),                                                                                                               
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialEmployer'])}" ,                          
                            target: "#actions"
                             });
        }
        
  {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialEmployer'])}",                                    
                         target: "#actions"}); 
           }); 
    
          $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
            $(".search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateFilter();
            });
            
          $("#filter").click(function() { return updateFilter(); }); 
          
          $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); }); 
          
         // $("[name=name]").change(function() { return updateFilter(); }); 
           
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialEmployer'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        }); 
                
{* =================================== ACTIONS ======================================================== *}
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialEmployer'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { EmployerUser : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewEmployer'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('employers_ajax',['action'=>'NewEmployer'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Employer \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Employer: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteEmployer'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEmployerUser') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });
        
        
        $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { Employer : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('employers_ajax',['action'=>'ChangeIsActiveEmployer'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveEmployer') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });
        $(".ChangeIsValidated").click(function () {
            return $.ajax2({
                 data : { Employer : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('employers_ajax',['action'=>'ChangeIsValidatedEmployer'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsValidatedEmployer') return ;
                    change('ChangeIsValidated',resp);
                }
            });
        });
        $(".ChangeIsCompleted").click(function () {
            return $.ajax2({
                 data : { Employer : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('employers_ajax',['action'=>'ChangeIsCompletedEmployer'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsCompletedEmployer') return ;
                    change('ChangeIsCompleted',resp);
                }
            });
        });
     
</script>