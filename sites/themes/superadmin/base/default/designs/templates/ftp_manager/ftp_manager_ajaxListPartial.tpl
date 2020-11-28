{messages class="errors"}
<div>
    <a id="Groups" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('Groups')}</a>  
    <a id="New" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('New account')}</a>  
    <a id="Settings" href="#"><img src="{url('/icons/settings16x16.png','picture')}" alt="{__('settings')}"/>{__('Settings')}</a>
</div>
{if $pager}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter">{__("filter")|capitalize}</button>   <button id="init">{__("init")|capitalize}</button>
<table cellpadding="0" cellspacing="0">
    <tr>
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if} 
        <th>{__('User')} 
              
        </th>
         <th>{__('Homedir')}  
             
        </th>
        <th>{__('Count')} 
            
        </th>
        <th>{__('Last access')} 
            
        </th>
        <th>{__('Actions')}</th>
        <tr>
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td>
               
            </td>
            <td></td>
            <td>               
                 
           </td>
           <td>
           </td>
           <td>
           </td>
        </tr>       
    {foreach $pager as $item}
    <tr class="users" id="users-{$item->get('id')}">
        <td class="users-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
               <input class="selection" type="checkbox" id="{$item->get('id')}" name="{$item->get('userid')}"/>
            </td>
        {/if}
        <td>
           {$item->get('userid')} 
        </td>
        <td>
          <span title="{$item->get('homedir')}">{$item->get('homedir')}</span>
        </td>
        <td>
           {$item->get('count')} 
        </td>
        <td>
             {format_date($item->get('accessed'),['d','q'])} 
        </td>
        <td>
            <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                <img  src="{url('/icons/edit.gif','picture')}" alt='{__("Edit")}'/></a>           
            <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}" name="{$item->get('userid')}">
                <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
            </a> 
        </td>
    </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="all" />  
        <a href="#" title="{__('delete')}" id="Delete" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
{/if}
<script type="text/javascript">
     {if $pager}
        function getFilterParameters()
        {
            params={ filter: {  order : { }, 
                                     search: { }, 
                                     equal : { },
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
     {/if}   
        function updateFilter()
        {
           return $.ajax2({ data: getFilterParameters(), url:"{url_to('ftp_manager_ajax',['action'=>'ListPartial'])}" , target: "#tab-panel-dashboard-superadmin-actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".users-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".users-count:last").html());
        }
        
    {JqueryScriptsReady} 
        
        
        // {* PAGER - begin *}
         $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
         });
            
         $("[name=nbitemsbypage]").change(function() {  return updateFilter();  }); 

        $(".search").keypress(function(event) {
            if (event.keyCode==13)
               return updateFilter();
        });

        $("#init").click(function() { $.ajax2({ url: "{url_to('ftp_manager_ajax',['action'=>'ListPartial'])}", 
                              target : "#tab-panel-dashboard-superadmin-actions"}); }); 

        $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });

        $("#filter").click(function() { return updateFilter(); }); 
            
        $(".pager").click(function () {
             return $.ajax2({ data: getFilterParameters(), url:"{url_to('ftp_manager_ajax',['action'=>'ListPartial'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , target: "#tab-panel-dashboard-superadmin-actions" });
        });  
        
        // {* PAGER - end *}   

        // {* ACTIONS - begin *} 
            
        $('.View').click(function(){
          $.ajax2( { data : { FtpManagerUser: $(this).attr('id') } , url:"{url_to('ftp_manager_ajax',['action'=>'ViewUser'])}",target :"#tab-panel-dashboard-superadmin-actions" });
        });
        
        $('#Groups').click(function(){
          $.ajax2( { url:"{url_to('ftp_manager_ajax',['action'=>'ListPartialGroup'])}",target :"#tab-panel-dashboard-superadmin-actions" });
        });
        
       
        $('#New').click(function(){
          $.ajax2( { url:"{url_to('ftp_manager_ajax',['action'=>'NewUser'])}",
                     loading: "#tab-dashboard-superadmin-loading",
                     errorTarget: ".errors-tab-dashboard-superadmin", 
                     target :"#tab-panel-dashboard-superadmin-actions" });
        });
               
          $('#Settings').click(function(){
         return $.ajax2( { url:"{url_to('ftp_manager_ajax',['action'=>'Settings'])}",
                           loading: "#tab-dashboard-superadmin-loading",
                           errorTarget: ".errors-tab-dashboard-superadmin", 
                           target :"#tab-panel-dashboard-superadmin-actions" });
        });
        
        $('.Delete').click(function(){
          if (!confirm("{__('Account [#0#] will be deleted. Confirm ?')}".format($(this).attr('name'))))
                return false; 
          return $.ajax2({ data :  { FtpManagerUser: $(this).attr('id') } ,
                    loading: "#tab-dashboard-superadmin-loading",
                    errorTarget: ".errors-tab-dashboard-superadmin", 
                    url: "{url_to('ftp_manager_ajax',['action'=>'DeleteUser'])}",
                    success :function(resp) { 
                                if (resp.action=="DeleteUser" && resp.id)
                                {    
                                    $("#users-"+resp.id).remove();
                                    updatePager(1); 
                                }    
                    }
                  }); 
        });
        
        $("#Delete").click( function () { 
                 var params={ selection : [ ]  };
                 text="";
                 $(".selection:checked").each(function () { 
                    params.selection.push($(this).attr('id'));
                    text+=$(this).attr('name')+",\n";
                 });
                 if ($.isEmptyObject(params.selection))
                    return ;
                 if (!confirm("{__('Accounts :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                     return false; 
                 return $.ajax2({ data: params,
                                  url : "{url_to('ftp_manager_ajax',['action'=>'DeletesUser'])}",
                                  success: function(resp) {
                                    if (resp.action=='Deletesuser')
                                    {                                    
                                        if ($(".users").length-resp.selection.length==0)
                                           return updateFilter();
                                        $.each(resp.selection, function (id) {  $("tr#users-"+this).remove(); });   
                                        updatePager(resp.selection.length); 
                                        $("input#all").attr("checked",false);           
                                    }       
                                  }
                 });    
                 return false;
            });
            
               $(".selection,#all").click(function (){               
                $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
            });

   
        //{* ACTIONS - end *}
            
        // Other actions
        
        
    {/JqueryScriptsReady} 
</script>