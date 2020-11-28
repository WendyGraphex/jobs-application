{messages class="errors"}
<div>
   <a id="New" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('new block')|capitalize}</a>
 {*  <a id="Positions" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('position')}"/>{__('block position')|capitalize}</a> *}
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter">{__("filter")|capitalize}</button><button id="init">{__('init')|capitalize}</button>
<table cellpadding="0" cellspacing="0">
    <tr>
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th>{__('id')}
        <div>
            <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
            <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div> 
    </th>
    <th>{__('name')}
        <div>
            <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
            <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div> 
    </th>
    <th>{__('actions')}</th>
</tr>
    <tr>
        <td></td>
        {if $pager->getNbItems()>5}<td></td>{/if}
        <td><input class="search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
        <td><input class="search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
    </tr>       
    {foreach $pager as $block}
    <tr class="blocks" id="block_{$block->get('id')}">
        <td>{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$block@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
               <input class="selection" type="checkbox" name="{$block->get('id')}" id="{$block->get('name')})"/>
            </td>
        {/if}
        <td>
            {$block->get('id')}
        </td>
        <td>
            {$block->get('name')|escape}
        </td>
        
        <td>
            <a href="#" title="{__('edit')}" class="View" id="{$block->get('id')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a> 
            <a href="#" title="{__('pages list')}" class="PagesBlockList" id="{$block->get('id')}"><img  src="{url('/icons/page1616.png','picture')}" alt='{__("edit")}'/></a> 
            <a href="#" title="{__('delete')}" class="Delete" id="{$block->get('id')}" name="{$block->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a> 
        </td>
    </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="all" />  
        <a href="#" title="{__('delete')}" id="DeleteBlocks"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script type="text/javascript">
     
             
          /*  function changeBlockState(id,state)
            {
                sel="a.Change#"+id;
                if (state=='YES'||state=='NO') 
                {    
                    $(sel+" img").attr({
                        src :"{url('/icons/','picture')}"+state+".gif",
                        alt : (state=='YES'?'{__("page_YES")}':'{__("page_NO")}'),
                        title : (state=='YES'?'{__("page_YES")}':'{__("page_NO")}')
                    });
                    $(sel).attr("name",state);
                }  
            } */
            
            function changeBlockState(resp) 
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
            
            function getBlocksFilterParameters()
            {
                params={ filter: {  order : { }, 
                                         search: { is_active : $("[name=is_active]").val()
                                                 }, 
                                         nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                         token:'{$formFilter->getCSRFToken()}'
                                      }};
                params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
                $(".search").each(function(id) { params.filter.search[this.name] =this.value; });                               
                return params;                  
            }
        
            function updateBlocksFilter()
            {
               return $.ajax2({ data: getBlocksFilterParameters(), url:"{url_to('cms_block_ajax',['action'=>'ListBlock'])}" , target: "#middle" });
            }

            function updatePager(n)
            {
               page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
               records_by_page=$("[name=nbitemsbypage]").val();
               start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
               $(".blocks_count").each(function(id) { $(this).html(start+id) }); // Update index column           
               nb_results=parseInt($("#nb_results").html())-n;
               $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
               $("#end_result").html($(".blocks_count:last").html());
            }
            
   {JqueryScriptsReady}             
            // {* PAGER - begin *}
             $('.order').click(function() {
                    $(".order_active").attr('class','order');
                    $(this).attr('class','order_active'); 
                    return updateBlocksFilter();
            });
            
            $(".search").keypress(function(event) {
                if (event.keyCode==13)
                {
                    return updateBlocksFilter();
                }     
            });

            $("#filter").click(function() { return updateBlocksFilter(); }); 
            
            $("#init").click(function() { 
                return $.ajax2({ url:"{url_to('cms_block_ajax',['action'=>'ListBlock'])}",
                                 target:  "#middle"}); 
            }); 
                       
            $("[name=nbitemsbypage]").change(function() { return updateBlocksFilter(); }); 
            
            $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
            // {* PAGER - end *}   

            // {* ACTIONS - begin *} 
            $(".PagesBlockList").click( function () { 
                return $.ajax2({ data : { id: this.id },
                                 url: "{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}",
                                 target: "#actions"});
            });
            
            $(".View").click( function () { 
                return $.ajax2({ data : { cmsblock: this.id },
                                 url: "{url_to('cms_block_ajax',['action'=>'ViewBlock'])}",
                                 target: "#actions"});
            });
            
            $("#New").click( function () { 
                return $.ajax2({ url: "{url_to('cms_block_ajax',['action'=>'NewBlock'])}",target: "#actions"});
            });        
            
         //   $("#Positions").click( function () { 
         //       return $.ajax2({ url: "{url('module/site/cms/blocks/Positions')}",target: "#actions"});
        //   });  
            
            $(".Delete").click( function () { 
                if (!confirm('{__("block \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false;
                return $.ajax2({ data : { block: this.id },
                                      url: "{url_to('cms_block_ajax',['action'=>'DeleteBlock'])}",
                                      success : function(response) {
                                            if (response.action=='deleteCmsBlock')
                                            {    
                                                if ($(".blocks").length-1==0)
                                                   return $.ajax2({ url:"{url_to('cms_block_ajax',['action'=>'ListBlock'])}",target: "#middle"});
                                                $("tr#block_"+response.id).remove();  
                                                updatePager(1); 
                                            }
                                      }
                        }); 
            });
            
            $("#DeleteBlocks").click( function () { 
                 var params={ selection : {  } };
                 text="";
                 $(".selection:checked").each(function (id) { 
                    params.selection[id]=this.name;
                    text+=this.id+",\n";
                 });
                 if ($.isEmptyObject(params.selection))
                    return ;
                 if (!confirm("{__('blocks :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                     return false;                
                 return $.ajax2({ data :params,
                                      url: "{url_to('cms_block_ajax',['action'=>'DeletesBlock'])}",
                                      success: function(response) {
                                            if (response.action=='deleteBlocks')
                                            {                                    
                                                if ($(".blocks").length-response.parameters.length==0)
                                                     return $.ajax2({ url:"{url_to('cms_block_ajax',['action'=>'ListBlock'])}",target: "#middle"});
                                                $.each(response.parameters, function (id) {  $("tr#block_"+this).remove(); });
                                                updatePager(response.parameters.length); 
                                                $("input#all").attr("checked",false);  
                                            }       
                                      }
                     });   
            });
                       
            // {* ACTIONS - end *}

            // Other actions
            $('.sublink').click(function() {  return $.ajax2({ url:this.id,target: "#middle"}); });
            
  {/JqueryScriptsReady}  
</script>
