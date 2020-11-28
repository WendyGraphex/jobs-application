{alerts}
{if $item->isLoaded()}
    {if $item->hasEmployerUser()}
    <span>{__('Message from [%s] on [%s]',[(string)$item->getEmployerUser(),$item->getFormatter()->getCreatedAt()->getText()])}</span>
    {elseif $item->hasEmployeeUser()}
    <span>{__('Message from [%s] on [%s]',[(string)$item->getEmployeeUser(),$item->getFormatter()->getCreatedAt()->getText()])}</span>
    {else}
      <span>{__('Message from Administrator on [%s]',$item->getFormatter()->getCreatedAt()->getText())}</span>
      {/if}
    <input class="form-control" type="text" readonly="" value="{$item->get('subject')|escape}"/>
    
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
         
         $(".CustomerMessage.Read[id={$item->get('id')}]").html("");
</script> 
{else}
    {__('Message is invalid')}
{/if}    



 

