{messages class="errors"}
<h3>{__("view block")|capitalize}</h3>
<div>
    <a href="#" id="Save" style="display:none"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>
    <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')}</a>
</div>
{if $item->isLoaded()}
<div>   
    <table cellspacing="0" cellpading="0">
        <tr>
            <td>{__('name')}
            </td>
            <td>
                <div>{$form.name->getError()}</div>
                <input type="text" class="cmsBlock" name="name" value="{$item->get('name')|escape}"/>{if $form->name->getOption('required')}*{/if}  
            </td>
        </tr>
    </table>
</div>
{else}
    <span>{__('block is invalid.')}</span>
{/if}
<script type="text/javascript">
         
        $('#Save').click(function(){
            var params={ 
                         cmsBlock : {                          
                                   id: "{$item->get('id')}",
                                   token :'{$form->getCSRFToken()}'
                                }
                       };
            
            $("input.cmsBlock").each(function() {  params.cmsBlock[this.name]=this.value; });  
          //  alert("params="+params.toSource()); return ;
            return $.ajax2({     data : params,
                                 url:"{url_to('cms_block_ajax',['action'=>'SaveBlock'])}",
                                 target:  "#middle"});
        });
        
        $(".cmsBlock").click(function () { $("#Save").show(); });
        
        $('#Cancel').click(function(){
              return $.ajax2({ url:"{url_to('cms_block_ajax',['action'=>'ListBlock'])}",
                                 target:  "#middle"});
        });

</script>




    