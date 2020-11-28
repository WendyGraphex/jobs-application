{messages class="errors"}
<h3>{__('block')}: {$block->get('name')}</h3>
<div>
      <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')|capitalize}</a>
      <a href="#" id="Save" style="display:none;"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')|capitalize}</a>
</div>
{if $block->isLoaded()}    
    <table id="cmsBlockPages">
        <thead>
            <tr>
                <th>{__('id')|capitalize}</th>
                <th>{__('name')|capitalize}</th>     
                <th>{__('url')|capitalize}</th>            
                <th>{__('position')|capitalize}</th>            
            </tr>
        </thead>
        <tbody>
            {foreach $collection as $item}  
            <tr id="{$item->getCmsBlockPage()->get('id')}" name="{$item->getCmsBlockPage()->get('position')}" class="ui-state-default">
                 <td>{$item->getCmsBlockPage()->get('id')}</td>
                 <td>
                   {$item->getCmsPage()->get('name')}
                 </td> 
                 <td>
                   {if $item->hasCmsI18nPage()}{$item->getCmsI18nPage()->get('url')}{else}{__('--- not defined ---')}{/if}
                 </td>           
                 <td><span class="position">{$item->getCmsBlockPage()->get('position')}</span></td>                 
             </tr>
            {/foreach}   
        </tbody>
    </table>
{else}
    <span>{__('block is invalid.')}</span>
{/if}
<script type="text/javascript">
            var movedItems=[];

            function saveMovedItems(selected)
            {
               found=false;
               $.each(movedItems,function (i){ 
                  if (this.id==selected.id)
                  {
                      found=true;
                      movedItems[i]=selected;
                      return true;
                  }    
               });
               if (!found)
                  movedItems.push(selected);
            }

           $("#cmsBlockPages tbody").sortable({
                            cursor: 'move',
                            start: function( event, ui ) {
                                  $(ui.item).addClass('selected')  ;
                            },
			    stop: function( event, ui ) {
                                        $("#Save").show();
                                        selected={ id: $(ui.item).attr('id')};
                                        if (typeof $(ui.item).prev().attr('id')=='undefined'||$(ui.item).attr('name')>$(ui.item).prev().attr('name'))
					{
                                          selected.node=$(ui.item).next().attr('id');
					}
					else
					{
                                          selected.node=$(ui.item).prev().attr('id');
					}
                                        if (selected.node)
                                           saveMovedItems(selected);
                            }
          });
     
                
          $("#Cancel").click(function () {
              return $.ajax2({ data: { id: "{$block->get('id')}" },
                                       url:"{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}", 
                                       target: "#actions" });  
          });
          
          $("#Save").click(function(){
               if (movedItems.length==0)
                     return false;
               if (movedItems.length==1)
               {
                            return $.ajax2({ data : {  blockPage : $.extend(movedItems[0],{ token : "{mfForm::getToken('movePositionForm')}" })
                                                    } ,
                                           url: "{url_to('cms_block_ajax',['action'=>'MovePageBlock'])}",
                                           success:function (response) 
                                                   { 
                                                        if (response.action=='moveBlockPage' && response.id == movedItems[0].id)
                                                        {  
                                                                      $.each($("#cmsBlockPages tbody").children(),function (id) {  $(this).attr('name',id+1); });
                                                                      $(".position").each(function (id) { $(this).html((id+1))});
                                                                      $("#cmsBlockPages .selected").removeClass('selected');
                                                        }
                                                        movedItems=[];
                                                        $("#Save").hide();
                                                    }    
                            });
               }
               else
               {
                  alert("moved selection not implemented"+movedItems.toSource()); 
               }    
          });
</script>