{messages class="site-errors"}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('group permissions')}</h3> 
        <h3 class="admin-header-small-text">{__('Gestion des permissions')}</h3> 
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a id="AddPermissionsGroup" class="btn btn-success admin-header-button" href="#">
                <i class="fa fa-plus" style=" margin-right: 5px;"></i>
                {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('Add permission group')}</a>
            <a style="margin-left: 10px;" id="Cancel" class="btn btn btn-danger admin-header-button"  href="#">
                 <i class="fa fa-times" style="margin-right:5px;"></i>
                 {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accès")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Groupes Permissions')}
    </p>
</div>
<div style="background-color: white; padding: 5px; display: inline-block; width: 100%;">
    <div class="row admin-header-container">
        <div class="col-sm" style="padding: 0;">
            <div>      
                <img class="PermissionsGroup" id="{$formFilter.lang}" name="lang" src="{url("/flags/`$formFilter.lang|default:"__"`.png","picture")}" title="{if $formFilter.lang->hasError()}{$formFilter.lang}{else}{format_country($formFilter.lang)}{/if}" />
                <style> .ui-dialog { font-size: 62.5%; }</style> 
                <a id="PermissionsGroup-ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a>
                {component name="/site_languages/dialogListLanguagesFrontend" selected=$formFilter.lang}   
            </div>
            <div> 
                {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="PermissionsGroup"}
            </div>
        </div>
        <div class="col-sm" style="padding: 0;">
            <div style="float: right; margin-top: 10px;"> 
                <button id="PermissionsGroup-filter" class="btn tab-button">{__("Filter")}</button>   
                <button id="PermissionsGroup-init" class="btn tab-button" style="margin-right: 5px;">{__("Init")}</button>
            </div>
        </div>
    </div>

    <table class="table table-bordered table-hover table-striped" cellspacing="0">
        <thead style="color: white;">
         <tr class="list-header">
            <th data-hide="phone" style="background-color: #36bc9a;">#</th>
            {if $pager->getNbItems()>5}<th data-hide="phone">&nbsp;</th>{/if}       
            <th style="background-color: #36bc9a;" class="footable-first-column" data-toggle="true">{__('name')}
                    <a style="float: right;" href="#" class="PermissionsGroup-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up"></i></a>
                  <a style="float: right;" href="#" class="PermissionsGroup-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down"></i></a>
                 
             </th>  
             <th data-hide="phone" style="background-color: #36bc9a;">{__('value')}
                   
                  <a style="float: right;" href="#" class="PermissionsGroup-order{$formFilter.order.value->getValueExist('asc','_active')}" id="asc" name="value"><i class="fas fa-sort-up"></i></a>
                  <a style="float: right;" href="#" class="PermissionsGroup-order{$formFilter.order.value->getValueExist('desc','_active')}" id="desc" name="value"><i class="fas fa-sort-down"></i></a>
                 
             </th>  
             <th data-hide="phone" style="background-color: #36bc9a;">{__('actions')}</th>
         </tr>
    </thead>
         <tr class="input-list">
                <td></td>
                {if $pager->getNbItems()>5}<td></td>{/if}          
                <td><input class="PermissionsGroup-search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td> 
                <td></td>
                <td></td>
            </tr>       
            {foreach $pager as $permission}
            <tr class="PermissionsGroup list" id="PermissionsGroup-{$permission->getPermissionGroup()->get('id')}">
                <td class="PermissionsGroup-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
                {if $pager->getNbItems()>5}<td><input class="PermissionsGroup-selection" type="checkbox" name="{$permission->getPermissionGroup()->get('id')}" id="{$permission->getPermissionGroupI18n()->get('value')}"/></td>{/if}           
                <td>
                    {$permission->getPermissionGroup()->get('name')}
                </td>
                 <td>
                     {if $permission->hasPermissionGroupI18n()}
                            {$permission->getPermissionGroupI18n()->get('value')}
                     {else}
                         {__('---')}
                     {/if}    
                </td>
                <td>
                    <a href="#" title="{__('edit')}" class="PermissionsGroup-View" id="{$permission->getPermissionGroup()->get('id')}">
                          <i class="fa fa-pencil-alt icon-font" ></i>{*<img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/>*}</a> 
                   {if $permission->hasPermissionGroupI18n()}
                   <a href="#" title="{__('delete')}" class="PermissionsGroups-Delete" id="{$permission->getPermissionGroupI18n()->get('id')}" name="{$permission->getPermissionGroupI18n()->get('value')}">
                       <i class="fa fa-trash-alt icon-font" style="color: rgb(189, 33, 48);" ></i>{*<img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>*}</a>
                   {/if}
                </td>
            </tr>
            {/foreach}              
    </table>    
    {if !$pager->getNbItems()}  
         <span>{__("no result")}</span>
    {elseif $pager->getNbItems()>5}
           <input type="checkbox" id="PermissionsGroup-all" />  
           <a href="#" title="{__('delete')}" id="PermissionsGroup-Delete"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
    {/if}
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="PermissionsGroup"}
</div>
<script type="text/javascript">
          
         function getPermissionsFilterParameters()
        {
            var params={ 
                     filter: {  order : { }, 
                                     search: { is_active : $(".PermissionsGroup-search[name=is_active]").val() }, 
                                     nbitemsbypage: $("[name=PermissionsGroup-nbitemsbypage]").val(),
                                     lang: $("img.PermissionsGroup").attr('id'), 
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".PermissionsGroup-order_active").attr("name")] =$(".PermissionsGroup-order_active").attr("id");
            $(".PermissionsGroup-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updatePermissionsFilter()
        {            
           $(".dialogs").dialog("destroy").remove();   
           return $.ajax2({ data: getPermissionsFilterParameters(), 
                            url :"{url_to('users_guard_ajax',['action'=>'ListPartialPermissionsGroup'])}",
                              loading: "#tab-site-dashboard-x-settings-loading",
                              errorTarget: ".site-errors",
                              target: "#actions"
                          });
        }
        
        function updatePager(n)
        {
           page_active=$(".PermissionsGroup-pager .PermissionsGroup-active").html()?parseInt($(".PermissionsGroup-pager .PermissionsGroup-active").html()):1;
           records_by_page=$("[name=PermissionsGroup-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".PermissionsGroup-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#PermissionsGroup-nb_results").html())-n;
           $("#PermissionsGroup-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#PermissionsGroup-end_result").html($(".PermissionsGroup-count:last").html());
        }
        
         // {* PAGER - begin *}
         $('.PermissionsGroup-order').click(function() {
             $(".PermissionsGroup-order_active").attr('class','PermissionsGroup-order');
             $(this).attr('class','PermissionsGroup-order_active');
             return updatePermissionsFilter();

         });
         
          $("[name=PermissionsGroup-nbitemsbypage],.PermissionsGroup[name=is_active]").change(function() {
              return updatePermissionsFilter();
          }); 
          
          $(".PermissionsGroup-search").keypress(function(event) {
                        if (event.keyCode==13)
                            return updatePermissionsFilter();                            
          });
                   
           $("#PermissionsGroup-filter").click(function() {
              return updatePermissionsFilter();
          }); 
          
          $("#PermissionsGroup-init").click(function() { 
                    $(".dialogs").dialog("destroy").remove();   
                    $.ajax2({           
                              url :"{url_to('users_guard_ajax',['action'=>'ListPartialPermissionsGroup'])}",
                              loading: "#tab-site-dashboard-x-settings-loading",
                              errorTarget: ".site-errors",
                              target: "#actions"
          }); 
          }); 
                             
          $(".PermissionsGroup-pager").click(function () {     
                    $(".dialogs").dialog("destroy").remove();   
                    return $.ajax2({ data: getPermissionsFilterParameters(),
                                    url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermissionsGroup'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                    
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 errorTarget: ".site-errors",
                                 target: "#actions"
                        });
          });
                   
          // {* PAGER - end *}         
          
     {* ===================== L A N G U A G E =============================== *}
         
            $("#PermissionsGroup-ChangeLang").click(function() {      
                   $("#dialogListLanguages").dialog("open");
            });
            
            $("#dialogListLanguages").bind('select',function(event){                
                $(".PermissionsGroup[name=lang]").attr({                           
                                      id: event.selected.id,
                                      src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                      title: event.selected.lang
                                      });
               $("#PermissionsGroupChangeLang").show();
               updatePermissionsFilter();
            });   
            
          // {* ACTIONS - begin *}
          
          $("#PermissionsGroup-Delete").click( function () { 
             var params={ selection : {  } };
             text="";              
             $(".PermissionsGroup-selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Groups :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false;            
             return $.ajax2({ data:params,
                              url :"{url_to('users_guard_ajax',['action'=>'DeletesPermissionsGroups'])}",
                              loading: "#tab-site-dashboard-x-settings-loading",
                              errorTarget: ".site-errors",
                              success:function(resp) {
                                    if (resp.action=='deletePermissionGroupI18n')
                                    {                                    
                                        if ($(".PermissionsGroup").length-resp.parameters.length==0)
                                           return $.ajax2({ 
                                                        url: "{url_to('users_guard_site_ajax',['action'=>'ListPartialPermissionsGroup'])}",
                                                        loading: "#tab-site-dashboard-x-settings-loading",
                                                        errorTarget: ".site-errors",
                                                        target: "#actions"
                                                        });
                                        $.each(resp.parameters, function (id) {  $("tr#PermissionsGroup-"+this).remove(); });
                                        updatePager(resp.parameters.length);      
                                        $("input#PermissionsGroup-all").attr("checked",false);                                    
                                    }  
                              }
             });    
          });
          
          
          
          $(".PermissionsGroups-Delete").click( function () { 
                if (!confirm('{__("Group \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false;              
                return $.ajax2({ data: { PermissionGroupI18n: this.id },                                 
                                 url :"{url_to('users_guard_ajax',['action'=>'DeletePermissionGroupI18n'])}",
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 errorTarget: ".site-errors",
                                 success: function(resp) {
                                                    if (resp.action=='deletePermissionGroupI18n')
                                                    {    
                                                        if ($(".PermissionsGroup").length-1==0)
                                                           return $.ajax2({                                                                         
                                                                        url: "{url_to('users_guard_site_ajax',['action'=>'ListPartialPermissionsGroup'])}",
                                                                        loading: "#tab-site-dashboard-x-settings-loading",
                                                                        errorTarget: ".site-errors",
                                                                        target: "#actions"});
                                                        $("tr#PermissionsGroup-"+resp.id).remove();  
                                                        updatePager(1);      
                                                    }
                                          }
                        }); 
          });
          
          $("#AddPermissionsGroup").click( function () { 
                $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({ 
                        data : { lang : { lang: $("img.PermissionsGroup[name=lang]").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                        url: "{url_to('users_guard_site_ajax',['action'=>'NewPermissionGroupI18n'])}",
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#actions"});
          });
                    
          $('#Cancel').click(function(){ 
         
             $(".dialogs").dialog("destroy").remove();   
             return $.ajax2({ 
                        url: "{url_to('users_guard_site_ajax',['action'=>'ListPartialPermission'])}",
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#actions"}); });
          
     $(".PermissionsGroup-View").click( function () { 
                $(".dialogs").dialog("destroy").remove();       
                return $.ajax2({ data : { PermissionGroupI18n : { 
                                                group_id: $(this).attr('id'),
                                                lang: $("img.PermissionsGroup[name=lang]").attr('id')                                              
                                    } },
                                loading: "#tab-site-dashboard-x-settings-loading",
                                url:"{url_to('users_guard_site_ajax',['action'=>'ViewPermissionGroupI18n'])}",
                                errorTarget: ".site-errors",
                                target: "#actions"});
         });
         
</script>