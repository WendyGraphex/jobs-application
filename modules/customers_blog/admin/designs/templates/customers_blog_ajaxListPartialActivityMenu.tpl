<div class="row admin-header-container">
   <div class="col-sm">
     <h3 class="admin-header-big-text">{__('Customer Blog')}</h3>
     <h3 class="admin-header-small-text">{__('Activity menu management')}</h3>
   </div>
   <div class="col-sm" style="padding: 0;">
       <div style="float: right;"> 
         <a class="btn btn-success admin-header-button btn-color"  href="#" id="New"><i class="fa fa-plus"></i> {__('New menu')}</a>
           <a href="#" class="btn btn-info admin-header-button btn-color" id="Positions" title="{__('Positions')}">
                <i class="fa fa-bars" style="margin-right: 5px;"></i>
                {__('Positions')}
            </a>
         {* <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
       </div> 
   </div>
</div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>                
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Customer Blog')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Activity Menu')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class="bg-white px-2 py-2">   
    <div class="row">       
     {component name="/customers_blog/pathMenu"}  
    </div>
     <div>                 
        {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter->getLanguage()}
     </div>
             <div class="col-md-12  padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                 </div>
                 <div class="float-right w-50">                   
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             
                 </div>
             </div>
{*<div class="table-responsive"> *}
     {*<div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col">*}
      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="bgSpec">
        <tr role="row">
            <th>#</th>
            <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Name')}</span>     
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th> 
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Is active')}</span>     
            </th>
            <th>{__('Lang')}</th>
            <th><span class="mr-1">{__('Title')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up {if $formFilter.order.title->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down {if $formFilter.order.title->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>            
             <th><span class="mr-1">{__('Activity')}</span>
              
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
               <td><input class="form-control form-control-sm search" placeholder="{__('Name')}" name="name" value="{$formFilter.search.name}"></td>
               <td>
                    {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}
                </td>
               <td>
                  {html_options style="height: 31px;" class="equal form-control float-left mx-1" name="lang" options=$formFilter->equal.lang->getChoices()->toArray() selected=$formFilter.equal.lang}
               </td>
              <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Title')}" name="title" value="{$formFilter.search.title}"></td>            
              <td></td>       
              <td>
                 <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date createdAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}" >
                 <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date createdAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}" >          
              </td>
              <td>
                 <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date updatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}" >
                 <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date updatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}" >         
              </td>
              <td></td>
          </tr>
      </tbody>
      <tbody>
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>{$item->get('id')}</td>
           <td>{$item->get('name')}</td>
           <td class="align-middle text-center"> 
               <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>           
               </td>
          <td>{if $item->hasI18n()}
                    {$item->getI18n()->getFormatter()->getLanguage()->getFormatted()->ucfirst()}
              {else}
                {__('---')}
              {/if}
           </td>
          <td>{if $item->hasI18n()} 
                    <a target="_blank" href="{$item->getI18n()->getUrl()}">
                                   {$item->getI18n()}
                   </a>
              {else}
                {__('---')}
              {/if}
          </td>
          <td>
              {if $item->hasActivity()}
                    {if $item->getActivity()->hasI18n()}
                                   {$item->getActivity()->getI18n()}        
                    {else}
                      {__('---')}
                    {/if}
              {else}
                {__('---')}
              {/if}  
          </td>
          <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>
          <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>
            <td>
              <a href="#" class="list-action text-info View" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil-alt icon-font"></i></a>
              <a href="#" class="list-action text-info Menus" id="{$item->get('id')}" title="{__('Sub menu')}"><i class="fa fa-list icon-font"></i></a>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{__('---')}{/if}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt icon-font delete-color"></i></a>
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
    {*  </div>
    </div>*}
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
  </div>
</div>
<script type="text/javascript">
    
{* ============================================ METHODS ============================================================== *}
     
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
            var params={ CustomerBlogActivityMenuNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityMenuNodeForm')}' },
                          filter: {  order : { }, 
                                    search : { },
                                    equal: {
                                            is_active:$(".equal[name=is_active] option:selected").val(),
                                        },         
                                    range: { },  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                              
                                token:'{$formFilter->getCSRFToken()}'
                         } };
             if($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
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
                            url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}" ,                          
                            target: "#actions"
                             });
        }
        
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
        
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
        $("#init").click(function () {                     
                return $.ajax2({ data : { CustomerBlogActivityMenuNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityMenuNodeForm')}' } },
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}",
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}",                                
                                 target: "#actions"
                });
        });
          
      $(".View").click( function () {                    
                  return $.ajax2({  data : { CustomerBlogActivityMenuI18n : { 
                                                menu_id: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                                            
                                    } },                            
                                  url:"{url_to('customers_blog_ajax',['action'=>'ViewActivityMenuI18n'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({      
                    data : { CustomerBlogActivityMenuNode : { node : '{$node->get('id')}', 
                                                 lang : $("#SelectListLanguages option:selected").attr('id'),
                                                 token: "{mfForm::getToken('CustomerBlogActivityMenuNodeForm')}" 
                                               } },                
                    url: "{url_to('customers_blog_ajax',['action'=>'NewActivityMenuI18n'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Activity Menu \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Activity: $(this).attr('id') },
                                 url :"{url_to('customers_blog_ajax',['action'=>'DeleteActivityMenu'])}",                               
                                 success : function(resp) {
                                     alert(resp);
                                       if (resp.action!='DeleteActivityMenu') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                          updatePager(1);
                                 }
                     });                                        
            });    
     
     $(".Menus").click( function () {                    
                  return $.ajax2({  data : { CustomerBlogActivityMenuNode : { 
                                                node: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id'),
                                                token : '{mfForm::getToken('CustomerBlogActivityMenuNodeForm')}'
                                    } },                            
                                  url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}", 
                                  target: "#actions"});
     });
     
     $(".list").dblclick( function () {                    
                 return $.ajax2({  data : { CustomerBlogActivityMenuI18n : { 
                                                node: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id'),                                            
                                    } },                            
                                  url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}", 
                                  target: "#actions"});
     });
                    
    $(".CustomerBlogActivityMenu-item").click(function () { 
              var params={  CustomerBlogActivityMenuNode : { node: $(this).attr('id'), 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityMenuNodeForm')}' },
                            filter: {  order : { }, 
                                    search : { },
                                    equal: { },                                                                     
                                    nbitemsbypage: '{$formFilter.nbitemsbypage}', //$("[name=nbitemsbypage]").val(),
                                    token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
             $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
                return $.ajax2({ 
                         data : params,
                         url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}", 
                         target: "#actions" }); 
        });     
        
    $(".CustomerBlogActivityMenuPath-item").click(function () { 
         $('.DropMenuShowFoldersInside').hide();
             var item=$(this);
             return $.ajax2({ 
                         data : { CustomerBlogActivityMenuI18n : { menu_id: $(this).attr('id'),lang : '{$formFilter->getLanguage()}' } },
                         url:"{url_to('customers_blog_ajax',['action'=>'GetChildrenActivityMenu'])}",                                              
                         success : function (resp)
                                {
                                       $(".DropMenuShowFoldersInside").css({
                                        position: "absolute",
                                        left: (item.position().left + 1) + "px"
                                      });
                                      $("#path-activity-ctn-"+item.attr('id')).show();
                                },
                           target : "#path-activity-ctn-"+item.attr('id') 
                       });
    });
    
        $(".DropMenuShowFoldersInside").mouseleave(function(){
                    $(this).hide("fade", { }, 1000);
        }); 
    
       $("#Positions").click( function () {                
                return $.ajax2({  data : { CustomerBlogActivityMenuI18n : { menu_id: '{$node->get('id')}', lang: $("#SelectListLanguages option:selected").attr('id') } }, 
                                url:"{url_to('customers_blog_ajax',['action'=>'PositionsActivityMenu'])}",
                                target: "#actions"});
         }); 
         
         $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { CustomerBlogActivityMenu : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('customers_blog_ajax',['action'=>'ChangeIsActiveActivityMenu'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveActivityMenu') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });
      
</script>
  
