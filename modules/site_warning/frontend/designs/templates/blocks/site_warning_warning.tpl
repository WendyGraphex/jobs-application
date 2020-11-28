{if $warning_i18n->hasContent}     
<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop" style="padding: 10px;">
        <div class="d-flex justify-content-between flex-wrap">
            <div>                
                {eval $warning_i18n->get('content')}              
            </div>     
        </div>
    </div>
</div>
{/if}