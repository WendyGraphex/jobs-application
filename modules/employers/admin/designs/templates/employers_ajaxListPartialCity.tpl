          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Employer City Galleries')}</h3>
              <h3 class="admin-header-small-text">{__('Employer City Galleries management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i>  {__('New gallery')}</a>                    
                   
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
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employer City Galleries')}              
                </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class="table-responsive bg-white px-2 py-2">  
                 <div>                    
                {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
             </div>
             <div class="col-md-12 padd-col">
                
                  <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                  </div> 
                  <div class="float-right w-50">                   
                        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                        <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
                 </div>
             </div>

      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="bgGlobal">
        <tr role="row">
             <td>#</td>
            <th  class="sorting_asc"><span class="mr-1">{__('ID')}</span>
                <div class="d-inline-block">
                            <a  href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up acs-desc" ></i></a> 
                            <a  href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down" ></i></a>         
                </div> 
            </th>
            <th class="sorting" ><span class="mr-1">{__('Name')}</span>  
                          <div class="d-inline-block">
                             <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>
             <th class="sorting" ><span>{__('Title')}</span>  
                           
            </th>
              <th class="sorting" ><span>{__('Template')}</span>  
                           
            </th>
              <th class="sorting" ><span>{__('Number of items')}</span>  
                           
            </th>
            <th class="sorting date-width" style="width: 230px;"><span class="mr-1">{__('Created at')}</span>  
                           <div class="d-inline-block">
                             <a href="#" class="order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>
            <th class="sorting date-width" style="width: 230px;"><span class="mr-1">{__('Updated at')}</span>  
                           <div class="d-inline-block">
                             <a href="#" class="order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
               <td></td>
              <td><input class="form-control form-control-sm ml-1 search" name="name" value="{$formFilter.search.name}"></td>            
              <td></td>
               <td></td>
                 <td></td>
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
          <td>{$item->get('id')}</td>
          <td>{$item->get('name')}</td> 
          <td>{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{__('---')}{/if}</td>
          <td>{$item->get('tpl')}</td> 
          <td>{$item->getNumberOfCities()}</td>
          <td>       
                {$item->getFormatter()->getCreatedAt()->getFormatted()}
        </td> 
        <td>                
                {$item->getFormatter()->getUpdatedAt()->getFormatted()}
        </td>
            <td>             
                  <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                                <i class="fa fa-pencil-alt icon-font"></i></a>   
                                 <a href="#" title="{__('Cities')}" class="Cities" id="{$item->get('id')}">
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
                                lang: $("#SelectListLanguages option:selected").attr('id'),  
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialCity'])}" ,                          
                            target: "#actions"
                             });
        }            
           
        $("#init").click(function () { 
                return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialCity'])}",                                
                         target: "#actions"
                });
        });
         
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
         
        $("#SelectListLanguages").change(function() {  updateFilter();   });
              
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCity'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCity'])}",                                
                                 target: "#actions"
                });
        });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Gallery \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerGallery: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteCity'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCity') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                           updatePager(1);
                                 }
                     });                                        
            });             
          
{*   $(".list").dblclick( function () {                    
                  return $.ajax2({  data : { EmployerGallery :  $(this).attr('id')  },                            
                                  url:"{url_to('employers_ajax',['action'=>'ViewEmployer'])}", 
                                  target: "#actions"});
          }); *}
    
      
    
        $(".View").click( function () {                    
                   return $.ajax2({ data : { EmployerCityGalleryI18n : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewCityI18n'])}", 
                                  target: "#actions"});
          });                
    
      $("#New").click( function () {             
                return $.ajax2({      
                    data : { lang : { lang: $("#SelectListLanguages option:selected").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                    url: "{url_to('employers_ajax',['action'=>'NewCityI18n'])}",               
                    target: "#actions"
              });
            });


             $(".Cities").click( function () {                    
                  return $.ajax2({   data : { EmployerCityGalleryI18n : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                                                           
                                  url:"{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}", 
                                  target: "#actions"});
          });   
</script>
  
