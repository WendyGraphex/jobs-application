{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Users')}</h3> 
        <h3 class="admin-header-small-text">{__('Gestion des permissions')}</h3> 
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a class="btn btn-success admin-header-button" id="New" href="#">
                <i class="fa fa-plus" style="margin-right:5px;"></i>
                {__('New permission')}</a>
            <a style="margin-left:5px;" id="PermissionsGroupList" class="btn btn-success admin-header-button"  href="#">
                <i class="fa fa-plus" style="margin-right:5px;"></i>
                {__('Permission groups')}</a>
        </div>
    </div>
</div>
<div style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Users")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Permissions")}
    </p>
</div>
<div style="background: white; padding: 5px;">
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
    
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped"> 
          <thead class="bgSpec">
        <tr class="list-header">
             <th style="background-color: #36bc9a;">#</th>
            {if $pager->getNbItems()>5}<th data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if}
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
              {*<th style="background-color: #36bc9a;">{__('Title')}*}
                {*   <div style="float: right;">
                  <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                 </div>  *}
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
              <th style="background-color: #36bc9a;">{__('Actions')}</th>
         </tr>
    </thead>
    <tr class=" input-list">
                <td></td>
                {if $pager->getNbItems()>5}<td></td>{/if}
                <td>{*<input placeholder="id" style="height: 36px;" class="search form-control" type="text" size="5" name="id" value="{$formFilter.search.id}">*}</td>
                <td><input placeholder="nom" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>                        
                 {*<td></td>*}
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
            {foreach $pager as $permission}
            <tr class="Permissions list" id="Permission-{$permission->get('id')}">
                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
                {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$permission->getId()}" id="{$permission->get('name')}"/></td>{/if}
                <td>
                    {$permission->get('id')}
                </td>
                <td>
                    {$permission->get('name')}
                </td>  
                {*<td>
                    {if $permission->hasI18n()}
                        {$permission->getI18n()->get('title')}
                    {else}
                       {__('----')}
                    {/if}
                </td>*}
                <td>
                    {$permission->get('created_at')}
                </td>
                <td>
                    {$permission->get('updated_at')}
                </td>
                <td>
                   <a href="#" title="{__('Edit')}" class="View" id="{$permission->get('id')}">
                       <i class="fa fa-pencil-alt icon-font" ></i> {*<img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/>*}</a>
                   <a href="#" title="{__('Delete')}" class="Delete" id="{$permission->get('id')}" name="{$permission->get('name')}">
                      <i style="color: rgb(189, 33, 48);" class="fa fa-trash-alt icon-font" ></i> {*<img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>*}</a>
                </td>
            </tr>
            {/foreach}
    </table>
            </div>
    {if !$pager->getNbItems()}  
         {__("no result")}
    {else}
       {if $pager->getNbItems()>5}
           <input type="checkbox" id="all" />  
           <a href="#" title="{__('Delete')}" id="Delete" style="opacity:0.5" class="actions-items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
      {/if}
    {/if}    
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>
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

    var updated_at_dates = $( ".Range.UpdatedAtDate#updated_at_from, .Range.UpdatedAtDate#updated_at_to" ).datepicker({
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
                                    range: { },
                                    equal: { },
                                    search: { 
                                           is_active : $("[name=is_active]").val() ,                                           
                                    }, 
                                    nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                    lang: $("#SelectListLanguages option:selected").attr('id'),    
                                    token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function() { params.filter.search[this.name] =this.value; }); 
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {            
           //$(".dialogs").dialog("destroy").remove();   
           return $.ajax2({ data: getFilterParameters(),                            
                            url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}" ,                             
                            target: "#actions" });
        }
        
        function updateSitePager(n)
        {
           page_active=$("pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
        
            $("#SelectListLanguages").change(function() {  updateFilter();   });
        
         // {* PAGER - begin *}
         $('.order').click(function() {
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             return updateFilter();
         });
         
          $("[name=nbitemsbypage],[name=is_active]").change(function() { return updateFilter(); }); 
                      
          $(".search").keypress(function(event) {
                        if (event.keyCode==13)
                            return updateFilter();
          });
                   
          $("#filter").click(function() { return updateFilter(); }); 
          
          $("#init").click(function() { 
                 $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({                                        
                                        url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",                                       
                                        target: "#actions"}); }); 

          $(".pager").click(function () {
                 $(".dialogs").dialog("destroy").remove();     
                return $.ajax2({ data: getFilterParameters(),                                   
                                   url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                   
                                   target: "#actions"});
          });
                   
          // {* PAGER - end *}         
          
     {* ===================== L A N G U A G E =============================== *}
         
            $("#ChangeLang").click(function() {      
                   $("#dialogListLanguages").dialog("open");
            });
            
            $("#dialogListLanguages").bind('select',function(event){                
                $(".Permission[name=lang]").attr({                           
                                      id: event.selected.id,
                                      src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                      title: event.selected.lang
                                      });
               $("#ChangeLang").show();
               updateFilter();
            });   
            
          // {* ACTIONS - begin *}
          
          $("#Delete").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Permissions :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data: params,
                       url: "{url_to('users_guard_ajax',['action'=>'DeletesPermission'])}",                      
                       success: function(resp) {
                                if (resp.action=='deletePermissions')
                                {                                    
                                    if ($(".Permissions").length-resp.parameters.length==0)
                                       return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",target : "#actions"});
                                    $.each(resp.parameters, function () {  $("tr#Permission-"+this).remove(); });
                                    updateSitePager(resp.parameters.length);       
                                    $("input#all").attr("checked",false);                                    
                                }   
                       }
             });    
          });
          
          
          
          $(".Delete").click( function () { 
                if (!confirm('{__("Permission \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { permission: this.id },                         
                          url: "{url_to('users_guard_ajax',['action'=>'DeletePermission'])}",                        
                          success: function(resp) {
                            if (resp.action=='deletePermission')
                            {    
                                if ($(".Permissions").length-1==0)
                                   return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",                                                  
                                                    target: "#actions"});
                                $("tr#Permission-"+resp.id).remove();  
                                updateSitePager(1);
                            }
                          }
                        }); 
          });
          
          $(".View").click( function () { 
                 $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({   data : { PermissionI18n : { 
                                                permission_id: $(this).attr('id'),
                                                lang: $(".Permission[name=lang]").attr('id')                                              
                                    } },                                   
                                   url: "{url_to('users_guard_ajax',['action'=>'ViewPermissionI18n'])}",                                 
                                   target: "#actions"});
          });
          
          $("#New").click( function () { 
                 $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({  
                            data : { Lang : { lang: $(".Permission[name=lang]").attr('id'),token: "{mfForm::getToken('LanguageAdminForm')}" } },                
                            url: "{url_to('users_guard_ajax',['action'=>'NewPermissionI18n'])}",                            
                            target: "#actions"});
          });
                   
          
           $("#all").click(function () {                
                   $(".selection").prop("checked",$(this).prop("checked"));             
                   $(".actions-items").css('opacity',($(this).prop("checked")?'1':'0.5'));
              });

            $(".selection").click(function (){               
                    $(".actions-items").css('opacity',($(".selection:checked").length?'1':'0.5'));
              });
           
           $("#PermissionsGroupList").click( function () {            
                 $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({   
                            url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermissionsGroup'])}",                          
                            target: "#actions"});
          });
          
</script>