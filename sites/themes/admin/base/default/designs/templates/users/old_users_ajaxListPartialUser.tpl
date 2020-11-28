{messages}
<h3>{__('Users')}</h3>
<div>
  {if $user->hasCredential([['superadmin','admin','settings_user_new']])}  
  <a href="#" class="btn btn-primary" id="New" title="{__('New user')}" >
      <i class="fa fa-plus" style="margin-right:10px;"></i>
      {__('New user')}</a>   
  {/if}
</div>
  
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter" class="btn btn-default">{__("Filter")}</button>   
<button id="init" class="btn btn-default">{__("Init")}</button>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped"> 
    <thead>
     <tr class="list-header">
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}       
         <th>{__('Username')}
               <div>
              <a href="#" class="order{$formFilter.order.username->getValueExist('asc','_active')}" id="asc" name="username"><img  src='{url("/icons/sort_asc`$formFilter.order.username->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.username->getValueExist('desc','_active')}" id="desc" name="username"><img  src='{url("/icons/sort_desc`$formFilter.order.username->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         
         <th>{__('Firstname')}
               <div>
              <a href="#" class="order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><img  src='{url("/icons/sort_asc`$formFilter.order.firstname->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><img  src='{url("/icons/sort_desc`$formFilter.order.firstname->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th>{__('Lastname')}
              <div>
              <a href="#" class="order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><img  src='{url("/icons/sort_asc`$formFilter.order.lastname->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><img  src='{url("/icons/sort_desc`$formFilter.order.lastname->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
          <th>{__('Email')}
               <div>
              <a href="#" class="order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><img  src='{url("/icons/sort_asc`$formFilter.order.email->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><img  src='{url("/icons/sort_desc`$formFilter.order.email->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
          </th>         
          <th>{__('Groups')}
            <div>
            </div>
          </th>          
          <th>{__('State')}</th>
          <th>{__('Date creation')}
                <div>
              <a href="#" class="order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th>{__('Last login')}
                <div>
                  <a href="#" class="order{$formFilter.order.lastlogin->getValueExist('asc','_active')}" id="asc" name="lastlogin"><img  src='{url("/icons/sort_asc`$formFilter.order.lastlogin->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="order{$formFilter.order.lastlogin->getValueExist('desc','_active')}" id="desc" name="lastlogin"><img  src='{url("/icons/sort_desc`$formFilter.order.lastlogin->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th>{__('Last password generation')}
                <div>
                  <a href="#" class="order{$formFilter.order.last_password_gen->getValueExist('asc','_active')}" id="asc" name="last_password_gen"><img  src='{url("/icons/sort_asc`$formFilter.order.last_password_gen->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a> 
                  <a href="#" class="order{$formFilter.order.last_password_gen->getValueExist('desc','_active')}" id="desc" name="last_password_gen"><img  src='{url("/icons/sort_desc`$formFilter.order.last_password_gen->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
                </div>
          </th>
          <th>{__('Actions')}</th>
     </tr>
</thead>
     <tr class="input-list">
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}          
            <td><input class="search" type="text" size="5" name="username" value="{$formFilter.search.username}"></td>
            <td><input class="search" type="text" size="5" name="firstname" value="{$formFilter.search.firstname}"></td>
            <td><input class="search" type="text" size="5" name="lastname" value="{$formFilter.search.lastname}"></td>
            <td><input class="search" type="text" size="5" name="email" value="{$formFilter.search.email}"></td>
            <td></td>  
            <td>{html_options_format format="__" name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>             
 
            
        </tr>       
        {foreach $pager as $item}
        <tr class="users list" id="user-{$item->get('id')}">
            <td class="users-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$item->getId()}" id="{$item->get('firstname')} {$item->get('lastname')} ({$item->get('username')})" /></td>{/if}           
            <td>
                {$item->get('username')|escape}
            </td>
            <td>
                {$item->get('firstname')|escape}
            </td>
             <td>
                {$item->get('lastname')|escape}
            </td>
            <td>
                {$item->get('email')|escape}
            </td>            
             <td>{if $item->groups}
                {$item->getSerializedI18nGroups()}
                {else}
                    {__('No group')}
                {/if} 
            </td>            
            <td>
               {* {$user->get('is_active')} *}
               <a href="#" title="{__('change')}" class="Change" id="{$item->get('id')}" name="{$item->get('is_active')}"><img  src="{url('/icons/','picture')}{$item->get('is_active')}.gif" alt='{__("user_`$item->get("is_active")`")}'/></a>
            </td>
            <td>
                {$item->get('created_at')}
            </td>
            <td>
                {$item->get('lastlogin')}
            </td>
            <td id="lastpasswordgen-{$item->get('id')}">
                {$item->get('last_password_gen')|escape}
            </td>
            <td>                 
               {if $user->hasCredential([['superadmin','admin','settings_user_password_creation']])}  
               <a href="#" title="{__('Create password')}" class="CreatePassword" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}">
                   <i class="fa fa-recycle"></i></a>
               {/if}                        
               {if $user->hasCredential([['superadmin','admin','settings_user_group_user_list']])}  
               <a href="#" title="{__('Groups')}" class="ViewGroup" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}">
                    <i class="fa fa-users"></i></a>
               {/if}
               {if $user->hasCredential([['superadmin','admin','settings_user_permissions_user_list']])}  
               <a href="#" title="{__('Permissions')}" class="ViewPermissions" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}">
                    <i class="fa fa-lock"></i></a>
               {/if}
               {if $user->hasCredential([['superadmin','admin','settings_user_view']])}  
               <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}">
                    <i class="fa fa-edit"></i></a>
               {/if}
               {if $user->hasCredential([['superadmin','admin','settings_user_delete']])}  
               <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')} ({$item->get('username')})">
                    <i class="fa fa-remove"></i></a>
               {/if}
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
       <a href="#" title="{__('Enable')}" id="EnabledUsers" style="opacity:0.5" class="actions-items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("Yes")}'/>
       <a href="#" title="{__('Disable')}" id="DisabledUsers" style="opacity:0.5" class="actions-items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("No")}'/></a>
       <a href="#" title="{__('Delete')}" id="DeleteUsers" style="opacity:0.5" class="actions-items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/></a>   
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}     
 <script type="text/javascript">
    
          function changeState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.Change#"+this;
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
            var params={ filter: {  order : { }, 
                                    search : { 
                                         is_active : $("[name=is_active]").val() 
                                    },
                                    equal: {   },                                                                                                                                   
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
                            url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}" ,                          
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
                   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
          $("#init").click(function() {                 
               $.ajax2({ url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}",                                    
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
          
          $("[name=nbitemsbypage],[name=is_active]").change(function() { return updateFilter(); }); 
                           
           
          $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                
                                 target: "#actions"
                });
          });
          {* =====================  A C T I O N S =============================== *}  
      
          $("#New").click( function () {             
            return $.ajax2({                    
                url: "{url_to('users_ajax',['action'=>'NewUser'])}",               
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                    
                return $.ajax2({ data : { User : $(this).attr('id') },                               
                                url:"{url_to('users_ajax',['action'=>'ViewUser'])}",                             
                                target: "#actions"});
         });
         
        {*  $(".ViewPosition").click( function () {                    
                return $.ajax2({ data : { User : $(this).attr('id') },                                
                                url:"{url_to('users_ajax',['action'=>'ViewUserFunction'])}",                             
                                target: "#actions"});
         }); *}
                     
         
          $(".Delete").click( function () { 
                if (!confirm('{__("User \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ User: $(this).attr('id') },
                                 url :"{url_to('users_ajax',['action'=>'DeleteUser'])}",                               
                                 success : function(resp) {
                                       if (resp.action=='DeleteUser')
                                       {    
                                          $("tr#user-"+resp.id).remove();  
                                          if ($('.users').length==0)
                                              return $.ajax2({ url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}",                                                               
                                                               target: "#actions"});
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
            });
            
        $(".RegeneratePassword").click( function () { 
                    return $.ajax2({ data : { id: this.id },                                  
                                   url :"{url_to('users_ajax',['action'=>'RegeneratePassword'])}",                                 
                                   success: function(resp) { 
                                               if (resp.action=='RegeneratePasswordUser'&&resp.params.id && resp.params.date)
                                                     $("#lastpasswordgen-"+resp.params.id).html(resp.params.date);
                                   }
                         });
          });
          
          $(".ViewPermissions").click( function () {           
              return $.ajax2({  data : { User: this.id },                             
                                url: "{url_to('users_ajax',['action'=>'PermissionsList'])}",                              
                                target: "#actions" });
          });
 
         $(".ViewGroup").click( function () { 
              return $.ajax2({  data : { User: this.id },                               
                                url: "{url_to('users_ajax',['action'=>'GroupsList'])}",                              
                                target: "#actions" });
          });   
          
         $(".Change").click(function() { 
                        return $.ajax2({ 
                            data : { id: this.id , value:this.name },                          
                            url: "{url_to('users_ajax',['action'=>'ChangeUser'])}",                           
                            success: function(resp) { 
                                        if (resp.action=='ChangeUser')
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
           // {* PAGER - end *}         
           
           // {* ACTIONS - begin *}
          $("#EnabledUsers,#DisabledUsers").click( function () { 
                var params={ Users : { selection : {  } , value :(this.id=='DisabledUsers'?'NO':'YES'),token: "{mfForm::getToken('changeUsersForm')}" } };
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeUser#"+this.name).attr('name')!=params.users.value)
                       params.Users.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.Users.selection))
                   return ;
              return $.ajax2({
                   data: params,                  
                   url: "{url_to('users_ajax',['action'=>'ChangeUsers'])}",                  
                   success: function(resp) { 
                               if (resp.action=='ChangeUsers')
                                   changeState(resp);
                            }
              });
          });
          
          $("#DeleteUsers").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm('{__('Users \u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}'.format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ 
                     data: params,                     
                     url: "{url_to('users_ajax',['action'=>'DeletesUser'])}",                   
                     success: function(resp) {
                            if (resp.action=='DeletesUser')
                            {   
                                if ($(".users").length-resp.parameters.length==0)
                                {    
                                  return $.ajax2({ url:"{url_to('users_ajax',['action'=>'ListPartialUser'])}",                                                                   
                                                    target: "#actions" });
                                }    
                                $.each(resp.parameters, function (id) {  $("tr#user-"+this).remove(); });
                                updatePager(resp.parameters.length); 
                                $("input#all").attr("checked",false);                                    
                            }       
                         }
             });
          });
          	
	 $(".CreatePassword").click( function () {           
              return $.ajax2({  data : { User: this.id },                             
                                url: "{url_to('users_ajax',['action'=>'CreatePasswordUser'])}",                              
                                target: "#actions" });
          });
          
      
 </script>    
