          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Employer')}</h3>
              <h3 class="admin-header-small-text">{__('Employer Galleries management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Gallery')}</a>
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employer Galleries')}              
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class="table-responsive bg-white px-2 py-2">            
             <div class="col-md-12 padd-col">
                   <div>                    
                {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
             </div>
                  <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                  </div> 
                  <div class="float-right w-50">                   
                        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                        <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
                 </div>
             </div>

      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead class="bgGlobal"> {*class="bg-info thead-color"*}
        <tr role="row">
            <th  class="sorting_asc">#</th>
            <th  class="sorting_asc">
                <span>{__('ID')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                 </div>
            </th>
            <th class="sorting" ><span>{__('Name')}</span>  
                          <div style="float: right;">
                             <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                             <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
                          </div>
            </th>
            <th class="sorting" ><span>{__('Is active')}</span></th>
             <th class="sorting" ><span>{__('Title')}</span>
                 <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up {if $formFilter.order.title->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down {if $formFilter.order.title->getValue()=='desc'}text-dark{/if}"></i></a>            
                 </div>
                           
            </th>
            <th class="sorting" ><span>{__('Company')}</span>
                 {*<div class="position-relative float-right mr-2">
                    <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up {if $formFilter.order.title->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down {if $formFilter.order.title->getValue()=='desc'}text-dark{/if}"></i></a>            
                 </div>*}
                           
            </th>
             <th class="sorting" ><span>{__('Template')}</span> 
                <div style="float: right;">
                   <a href="#" class="position-absolute order{$formFilter.order.tpl->getValueExist('asc','_active')}" id="asc" name="tpl"><i class="fas fa-sort-up {if $formFilter.order.tpl->getValue()=='asc'}text-dark{/if}"></i></a>
                   <a href="#" class="position-absolute order{$formFilter.order.tpl->getValueExist('desc','_active')}" id="desc" name="tpl"><i class="fas fa-sort-down {if $formFilter.order.tpl->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
              </th>
              <th class="sorting" ><span>{__('Number of items')}</span>                             
            </th>
            <th style="width: 230px;" class="sorting date-width"><span>{__('Created at')}</span>  
                          <div style="float: right;">
                             <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                             <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                          </div>
            </th>
            <th style="width: 230px;" class="sorting date-width"><span>{__('Updated at')}</span>  
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
            <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Name')}" name="name" value="{$formFilter.search.name}"></td>  
            <td>{html_options style="height: 32px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}</td>
            <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Title')}" name="title" value="{$formFilter.search.title}"></td>
            <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Company')}" name="company" value="{*$formFilter.search.title*}"></td>
            <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Template')}" name="tpl" value="{$formFilter.search.tpl}"></td>
            <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Number of items')}" name="number_of_items" value="{$formFilter.search.number_of_items}"></td>
            <td>                  
               <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date createdAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{$formFilter.range.created_at.from}{/if}" >
               <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date createdAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{$formFilter.range.created_at.to}{/if}" >
            </td>
            <td>
               <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date updatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{$formFilter.range.updated_at.from}{/if}" >
               <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date updatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{$formFilter.range.updated_at.to}{/if}" >
            </td>
            <td></td>
          </tr>
    
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td class="list">{$item->get('id')}</td>
          <td>{$item->get('name')}</td>
          <td>
              <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a> 
          </td>
            <td>{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{__('---')}{/if}</td>
             <td>{*$item->getI18n()->get('company')*}</td>
          <td>{$item->get('tpl')}</td> 
          <td>{$item->getNumberOfEmployers()}</td>
          <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td> 
                <td>                
                        {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                </td>
            <td>             
                  <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                                <i class="fa fa-pencil-alt icon-font"></i></a>   
                                 <a href="#" title="{__('Employers')}" class="Employers" id="{$item->get('id')}">
                                <i class="fa fa-list icon-font"></i></a>  
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('name')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt icon-font"></i></a>
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
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },     
                                    range : { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),   
                                lang: $("#SelectListLanguages option:selected").attr('id'),  
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialGallery'])}" ,                          
                            target: "#actions"
                             });
        }
        
{* =================================== PAGER/FILTER ======================================================== *}
        
        $("#SelectListLanguages").change(function() {  updateFilter();   });
          
        $("#init").click(function () { 
                return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialGallery'])}",                                
                         target: "#actions"
                });
        });              
              
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialGallery'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialGallery'])}",                                
                                 target: "#actions"
                });
        });
        

{* =================================== ACTIONS ======================================================== *}
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Gallery \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerGallery: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteGallery'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteGallery') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });    
    
      $(".View").click( function () {                    
                  return $.ajax2({  data : { EmployerGalleryI18n : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                                                          
                                  url:"{url_to('employers_ajax',['action'=>'ViewGalleryI18n'])}", 
                                  target: "#actions"});
          });
          
           $(".list").dblclick( function () {                    
                  return $.ajax2({  data : { EmployerGalleryI18n : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                                                          
                                  url:"{url_to('employers_ajax',['action'=>'ViewGalleryI18n'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({       
                    data : { lang : { lang: $("#SelectListLanguages option:selected").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                    url: "{url_to('employers_ajax',['action'=>'NewGalleryI18n'])}",               
                    target: "#actions"
              });
            });
          
             $(".Employers").click( function () {                    
                  return $.ajax2({  data : { EmployerGalleryI18n : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                                                          
                                  url:"{url_to('employers_ajax',['action'=>'ListPartialCompanyForGalleryI18n'])}", 
                                  target: "#actions"});
          });   
          
          
         $(".ChangeIsActive").click(function () {
            return $.ajax2({
                data : { EmployerGallery: { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                              
                url: "{url_to('employers_ajax',['action'=>'ChangeIsActiveGallery'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveGallery') return ;
                    change('ChangeIsActive',resp);
                }
            });
         });
</script>
  
