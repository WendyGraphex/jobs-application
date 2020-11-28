<span id="UserFunctions" title="{$functions_i18n}">
        {$functions_i18n|truncate:25}  
</span>    
{*
<div id="Credentials" class="filter-content">    
    <div>{__('groups')}</div>
    <table>
    {foreach $user->getGroups() as $group}
        {if $group@index % 4==0}<tr>{/if}
            <td>{$group}</td>
        {if $group@index % 4==4}</tr>{/if}
    {/foreach}    
    </table>
    <div>{__('Permissions')}</div>
    <table>
    {foreach $user->getCredentials() as $credential}
        {if $credential@index % 4==0}<tr>{/if}
            <td>{__($credential,'','permissions')}</td>
        {if $credential@index % 4==4}</tr>{/if}
    {/foreach}    
    </table>
</div> *}
<script type="text/javascript">
    
  $(document).ready(function(){
        
        $("#UserFunctions").click(function(){ 
            $("#Credentials").show();
        });
  });
  
</script>  