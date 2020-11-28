<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Freelancer")}</h3>
        <h3 class="admin-header-small-text">{__("Freelancer galleries Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">                               
                 <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i>
                  {if $item_i18n->getGallery()->hasEmployees()}{__('Add/Remove Freelancers')}{else}{__('Add Freelancers')}{/if}
                 </a>                
                  {if $item_i18n->getGallery()->getNumberOfEmployees()->getValue() > 1}
                <a href="#" class="btn btn-info admin-header-button btn-color" id="Positions" title="{__('Positions')}">
                <i class="fa fa-bars" style="margin-right: 5px;"></i>
                {__('Positions')}
            </a>            
            {/if}
                    <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancer Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Gallery [%s]',(string)$item_i18n)}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancers')}     
    </p>
</div>
{alerts}  
{if $item_i18n->getGallery()->isLoaded()}
<div class="table-responsive bg-white px-2 py-2">   
    <div class="col-md-12">  
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
        </div>
        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
        <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
    </div>    
                 
    <table  id="DialogCategoryList" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
        <tr class="list-header">
            <th>#</th>            
            <th>
                <span>{__('ID')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th>
                <span>{__('Position')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.position->getValueExist('asc','_active')}" id="asc" name="position"><i class="fas fa-sort-up {if $formFilter.order.position->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.position->getValueExist('desc','_active')}" id="desc" name="position"><i class="fas fa-sort-down {if $formFilter.order.position->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th> 
            <th><span class="mr-1">{__('Freelancer')}</span>
                <div class="d-inline-block">
                    {*<a href="#" class="dialog-order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up acs-desc"></i></a>
                    <a href="#" class="dialog-order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down"></i></a>   *}         
                 </div>
            </th>
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
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th data-hide="phone" style="display: table-cell; background-color: #36bc9a; color: white;">{__('Actions')}</th>
        </tr>
      </thead>
      <tbody class="tablebody">
          <tr role="row">
                <td></td>             
                <td></td> 
                <td><input class="form-control form-control-sm ml-1 dialog-search search" name="position" value="{$formFilter.search.position}"/></td>
                <td><input class="form-control form-control-sm ml-1 dialog-search search" name="title" value="{*$formFilter.search.position*}"/></td>
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
      </tbody>
       {foreach $pager as $item} 
      <tr class="DialogEmployeeList list {*if $formFilter->getSelection()->in($item->get('id'))}Selected{/if*}" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>          
          <td>{$item->get('id')}</td>    
         {* <td>{if $item->getEmployeeUser()->hasPicture()}<img src="{$item->getEmployeeUser()->getPicture()->getMedium()->getURL()}" height="64px" width="64px" alt="{__('Picture')}"/>{/if}</td>*}
          <td>{$item->get('position')}</td> 
          <td>{$item->getEmployeeUser()->getFormatter()->getUser()->ucfirst()}
          </td>    
          <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td> 
                <td>                
                        {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                </td>
            <td>               
                    <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
                    <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
                </td>  
             </tr>
        {/foreach}
         {if !$pager->hasItems()}
             <tr role="row" >
                 <td  colspan="6">{__('No employee')}</td>
             </tr>
        {/if}  
        </tbody>         
    </table>
      </div>
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
  </div>
</div>
  

<div id="Modal-Employees" class="modal" role="dialog">
       <div class="modal-dialog modal-lg model-cat-product">    
     <div class="modal-content">
        <div class="px-2"><span class="close" id="Modal-Employees-Close">&times;</span></div>  
         <div id="Modal-Employees-ctn">            
         </div>
         <div class="col-md-12" style="padding: 0;">
               <div class="Addbtn px-2"> 
                  <a href="#" id="AddEmployees" class="btn btn-success admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add employees')}</a>                
               </div>
          </div>
     </div>
       </div>
 </div>
      
<script type="text/javascript">   
    
    
    function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
    }
    
    var created_at_dates = $( ".Range.createdAtDate#created_at_from, .Range.createdAtDate#created_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "created_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				created_at_dates.not( this ).datepicker( "option", option, date );
    } } );  
  var updated_at_dates = $( ".Range.updatedAtDate#updated_at_from, .Range.updatedAtDate#updated_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "updated_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				updated_at_dates.not( this ).datepicker( "option", option, date );
    } } );  
    
    
    
    function getFilterParameters()
        {
            var params={  EmployeeGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
                          filter: {  order : { }, 
                                    search : { },
                                    equal: { },     
                                    range : { },                               
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                              
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");                   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')]) params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employees_ajax',['action'=>'ListPartialEmployeeForGalleryI18n'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function () { 
                return $.ajax2({ 
                         data : { EmployeeGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' } },
                         url:"{url_to('employees_ajax',['action'=>'ListPartialEmployeeForGalleryI18n'])}",                                
                         target: "#actions"
                });
        });
        
        $("#SelectListLanguages").change(function() {  updateFilter();   });
              
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_ajax',['action'=>'ListPartialEmployeeForGalleryI18n'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_ajax',['action'=>'ListPartialEmployeeForGalleryI18n'])}",                                
                                 target: "#actions"
                });
        });
         
     {* =================== A C T I O N S ================================ *}
 
      $(".Delete").click( function () { 
                if (!confirm('{__("Freelancer \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployeeForGalleryI18n: $(this).attr('id') },
                                 url :"{url_to('employees_ajax',['action'=>'DeleteEmployeeForGalleryI18n'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEmployeeForGalleryI18n') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });  
 
 
    $("#Modal-Employees-Close").click(function () {  $("#Modal-Employees").hide(); });
     
    $('#Cancel').click(function(){                
             return $.ajax2({ url : "{url_to('employees_ajax',['action'=>'ListPartialGallery'])}",                                                 
                              target: "#actions"}); 
    });
      
    $('#New').click(function(){                      
             return $.ajax2({ data : { EmployeeGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' }                                       
                                     },             
                              url : "{url_to('employees_ajax',['action'=>'ListPartialDialogEmployeeForGalleryI18n'])}",                                                 
                              success : function () { $("#Modal-Employees").show(); },
                              target: "#Modal-Employees-ctn"
                              }); 
    }); 
      
    $("#AddEmployees").click(function () {                            
          var params = { 
              EmployeeGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
              AddEmployees : {  selection: $("#DialogEmployeeList").data('selection'),token : '{mfForm::getToken('AddEmployeesForGalleryI18nForm')}' }
                       };          
          return $.ajax2({  
                         data : params,
                         url:"{url_to('employees_ajax',['action'=>'AddEmployeesForGalleryI18n'])}",                            
                         success : function (resp) { 
                             if (resp.errors)
                             {
                                 return ;
                             }    
                             $("#Modal-Employees").hide(); 
                             $("#actions").html(resp);
                         }
                         
                       }); 
    });  
   
    $("#Positions").click( function () {                
                return $.ajax2({ 
                                data : {  EmployeeGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' }  },
                                url:"{url_to('employees_ajax',['action'=>'PositionsEmployeeForGalleryI18n'])}",
                                target: "#actions"});
    }); 
</script>
{else}
    {__('Gallery is invalid.')}
{/if}          

