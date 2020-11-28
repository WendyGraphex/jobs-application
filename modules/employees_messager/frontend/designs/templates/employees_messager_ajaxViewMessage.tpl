{alerts}
{if $item->isLoaded()}
    {if $item->hasEmployerUser()}
    <span>{__('Message from [%s] on [%s]',[(string)$item->getEmployerUser(),$item->getFormatter()->getCreatedAt()->getText()])}</span>
    {else}
      <span>{__('Message from Administrator on [%s]',$item->getFormatter()->getCreatedAt()->getText())}</span>
      {/if}
    <input class="form-control" type="text" readonly="" value="{$item->get('subject')|escape}"/><br/>
    
    <textarea class="form-control" cols="40" readonly="" rows="10">{$item->get('message')|escape}</textarea>
    
    <div>
      {foreach $item->getFiles() as $file}
        <div>            
            <a target="_blank" href="{$file->getFileManager()->getUrl()}"><img src="{url("/icons/files/`$file->get('extension')`.gif",'picture')}"/>
                {$file->get('file')}</a>       ({$file->getSize()->getFilesize()})   
        </div>
     {/foreach} 
    </div>
         <script type="text/javascript">                                    
          {if !$item->isSender()}
         $(".CustomerEmployeeMessage.Read[id={$item->get('id')}]").html("");
         {/if}
</script> 
{else}
    {__('Message is invalid')}
{/if}    

