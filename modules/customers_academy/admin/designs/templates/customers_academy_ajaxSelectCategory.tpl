{if $item->isLoaded()}
    <div class="CustomerCourseCategoryMenu" name="category_id" id="{$item->get('id')}">
        <span>{$item->getI18n()}</span><i class="deleteCategory fa fa-times" aria-hidden="true"></i>
    </div>
{else}
    {__('Category is invalid')}
{/if}
<script type="text/javascript">    
    $(".deleteCategory").click(function () { 
        $(".CustomerCourseCategoryMenu").remove();
    }); 
</script>