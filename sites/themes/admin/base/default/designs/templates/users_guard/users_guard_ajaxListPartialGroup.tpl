{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Users')}</h3> 
        <h3 class="admin-header-small-text">{__('Gestion Groups')}</h3> 
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a id="New" class="btn btn-success admin-header-button" href="#">
            <i style="margin-right: 5px;" class="fa fa-plus"></i>
            {__('New group')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Users")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Groups')}
    </p>
</div>
<div style="background-color: white; padding: 5px;">
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
           <th style="width: 100px;">{__('state')}</th>
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
         <tr  class=" input-list">
                <td></td>
                <td></td>
                {if $pager->getNbItems()>5}<td></td>{/if}
             {*   <td><input class="search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td> *}
                <td><input placeholder="Nom" style="height: 35px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
                {*<td><input placeholder="title" style="height: 35px;" class="search form-control" type="text" size="5" name="title" value="{$formFilter.search.title}"></td>*}
                <td>{html_options_format class="form-control" format="__" name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>            
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
            {foreach $pager as $group}
            <tr class="Groups list" id="group-{$group->get('id')}">
                <td class="groups-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$group@iteration}</td>
                <td class="count">{$group->get('id')}</td>
                {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$group->getId()}" id="{$group->get('name')}"/></td>{/if}
            {*    <td>
                    {$group->get('id')}
                </td> *}
                <td>
                    {$group->get('name')|escape}
                </td>
               {* <td>
                    {if $group->hasI18n()}
                        {$group->getI18n()->get('title')}
                    {else}
                       {__('----')}
                    {/if}
                </td>*}
                <td>             
                  {* <a href="#" title="{__('Change')}" class="ChangeGroup" id="{$group->get('id')}" name="{$group->get('is_active')}"><img  src="{url('/icons/','picture')}{$group->get('is_active')}.gif" alt='{__("group_`$group->get("is_active")`")}'/></a>*}
                  <a href="#" class="ChangeGroup" name="{$group->get('is_active')}" id="{$group->get('id')}"><i class="fa fa-circle text-{if $group->isActive()}success{else}danger{/if}"></i></a>
                </td>
                <td>
                    {format_date($group->get('created_at'),['d','q'])}
                </td>
                <td>
                    {format_date($group->get('updated_at'),['d','q'])}
                </td> 

                <td>
                   <a href="#" title="{__('Permissions')}" class="ViewPermissions" id="{$group->get('id')}" name="{$group->get('name')}">
                       <i style="color: rgb(40, 167, 69);" class="fa fa-unlock-alt icon-font"></i></a>
                   <a href="#" title="{__('Edit')}" class="View" id="{$group->get('id')}" name="{$group->get('name')}">
                       <i class="fa fa-pencil-alt icon-font"></i></a>
                   <a href="#" title="{__('Delete')}" class="Delete" id="{$group->get('id')}" name="{$group->get('name')}">
                       <i style="color: rgb(189, 33, 48);" class="fa fa-trash-alt icon-font"></i></a>
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
           <a href="#" title="{__('Enable')}" id="Enabled" style="opacity:0.5" class="actions-items">
               <img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
           <a href="#" title="{__('Disable')}" id="Disabled" style="opacity:0.5" class="actions-items">
               <img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
          <a href="#" title="{__('Delete')}" id="Delete" style="opacity:0.5" class="actions-items">
              <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
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
        
        function changeState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeGroup#"+this;
                if (resp.state=='YES'||resp.state=='NO') 
                {    
                    $(sel+" img").attr({
                        src :"{url('/icons/','picture')}"+resp.state+".gif",
                        alt : (resp.state=='YES'?'{__("user_YES")}':'{__("user_NO")}'),
                        title : (resp.state=='YES'?'{__("user_YES")}':'{__("user_NO")}')
                    });
                    $(sel).attr("name",resp.state);
                }
            });  
        }
        
        function getFilterParameters()
        {
            params={ filter: {  
                                    order : { }, 
                                    equal: {   },
                                    search: { 
                                              is_active : $("[name=is_active]").val(),                                               
                                            },
                                    range: { },
                                    nbitemsbypage: $("[name=nbitemsbypage]").val(), 
                                    lang : $("#SelectListLanguages option:selected").attr('id'),   
                                    token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function() { params.filter.search[this.name] =this.value; });  
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
           //$(".dialogs").dialog("destroy").remove();  
           return $.ajax2({ data: getFilterParameters(),                          
                            url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" ,                           
                            target: "#actions" });
        }
        
        function updateSitePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".groups-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
        
         $("#SelectListLanguages").change(function() {  updateFilter();   });
               
         // {* PAGER - begin *}
         $('.order').click(function() {
             $(".order_active").attr('class',' order');
             $(this).attr('class','order_active');
             return updateFilter();
         });
         
         // search
          $("[name=nbitemsbypage],[name=is_active]").change(function() {
              return updateFilter();
          });              
          
          $(".search").keypress(function(event) {
                        if (event.keyCode==13)
                                return updateFilter();  
          });
                   
          $("#filter").click(function() {  return updateFilter(); }); 
          
          $("#init").click(function() { 
                $(".dialogs").dialog("destroy").remove();  
                return $.ajax2({   
                                                    url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" ,                                                    
                                                    target: "#actions"}); }); 

          $(".pager").click(function () {      
                    $(".dialogs").dialog("destroy").remove();  
                    return $.ajax2({ data:getFilterParameters(),
                                    url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                   
                                    target: "#actions"});
          });
                    
          // {* PAGER - end *}         
         
          {* ===================== L A N G U A G E =============================== *}
         
            $("#ChangeLang").click(function() {      
                   $("#dialogListLanguages").dialog("open");
            });
            
            $("#dialogListLanguages").bind('select',function(event){                
                $(".Group[name=lang]").attr({                           
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
             if (!confirm("{__('Groups :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data: params,
                               url:"{url_to('users_guard_ajax',['action'=>'DeletesGroup'])}" , 
                               success :function(resp) {
                                        if (resp.action=='deleteGroups')
                                        {                                    
                                            if ($(".groups").length-resp.parameters.length==0)
                                               return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" ,                                                                
                                                                target: "#actions"});
                                            $.each(resp.parameters, function () {  $("tr#group_"+this).remove(); });
                                            updatePager(resp.parameters.length); 
                                            $("input# all").attr("checked",false);                                    
                                        }       
                               }
             });    
          });
          
          
          
          $(".Delete").click( function () { 
                if (!confirm('{__("Group \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ Group: this.id },
                          url:"{url_to('users_guard_ajax',['action'=>'DeleteGroup'])}" , 
                          loading: "#tab-site-dashboard-x-settings-loading",                        
                          success: function(resp) {
                            if (resp.action=='deleteGroup')
                            {    
                                if ($(".groups").length-1==0)
                                   return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" ,                                                    
                                                    target: "#actions"});
                                $("tr#group-"+resp.id).remove(); 
                                updatePager(1);
                            }
                          }
                        }); 
          });
          
          $(".View").click( function () { 
                $(".dialogs").dialog("destroy").remove();  
                return $.ajax2({   data : { GroupI18n : { 
                                                group_id: $(this).attr('id'),
                                                lang: $(".Group[name=lang]").attr('id')                                              
                                    } },
                                url:"{url_to('users_guard_ajax',['action'=>'ViewGroupI18n'])}" ,                                
                                target: "#actions"});
          });
          
          $("#New").click( function () { 
                $(".dialogs").dialog("destroy").remove();  
                return $.ajax2({ 
                              data : { Lang : { lang: $(".Group[name=lang]").attr('id'),token: "{mfForm::getToken('LanguageAdminForm')}" } },                
                              url:"{url_to('users_guard_ajax',['action'=>'NewGroupI18n'])}" ,                              
                              target: "#actions"});
          });
          
          $(".ChangeGroup").click( function () { 
                return $.ajax2({ data : { id: this.id , value:this.name },
                          url:"{url_to('users_guard_ajax',['action'=>'ChangeGroup'])}" ,                          
                          success: function(resp) { 
                                         if (resp.action=='ChangeGroup')
                                            changeState(resp);
                                      }
                         });
          });
          
          $(".ViewPermissions").click( function () { 
                 $(".dialogs").dialog("destroy").remove();   
                return $.ajax2({ data : { group: this.id },
                                           url:"{url_to('users_guard_ajax',['action'=>'ListPermissionsGroup'])}" ,                                           
                                            target: "#actions"});
          });
          
          $("#EnabledGroups,#DisabledGroups").click( function () { 
                var params={ groups : { selection : {  } , value :(this.id=='DisabledGroups'?'NO':'YES'),token: "{mfForm::getToken('changeGroupsForm')}" } };
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeGroup#"+this.name).attr('name')!=params.groups.value)
                       params.groups.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.groups.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url:"{url_to('users_guard_ajax',['action'=>'ChangesGroup'])}" , 
                                 success :function(resp) { 
                                                 if (resp.action=='ChangeGroups')
                                                   changeState(resp);
                                             }
                });
          });
          
           $("#all").click(function () {                
                   $(".selection").prop("checked",$(this).prop("checked"));             
                   $(".actions-items").css('opacity',($(this).prop("checked")?'1':'0.5'));
              });

            $(".selection").click(function (){               
                    $(".actions-items").css('opacity',($(".selection:checked").length?'1':'0.5'));
              });
</script>