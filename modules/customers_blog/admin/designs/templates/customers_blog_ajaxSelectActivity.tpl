{if $item->isLoaded()}
    <div class="CustomerBlogActivityMenu" name="activity_id" id="{$item->get('id')}">
        <span>{$item->getI18n()}</span><i class="deleteActivity fa fa-times" aria-hidden="true"></i>
    </div>
{else}
    {__('Activity is invalid')}
{/if}
<script type="text/javascript">    
    $(".deleteActivity").click(function () { 
        $(".CustomerBlogActivityMenu").remove();
    }); 
</script>