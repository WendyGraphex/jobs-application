{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$employee.username},<br/><br/>

    {foreach $quotations as $quotation}
        {$quotation.reference} {$quotation.employer.username}
    {/foreach}    
    <div style="margin-top: 40px;">
        <p>Sincerely,</p>
        <p>Graphex Technology Team</p>
        --
        <div class="" style="width: 200px;">
            <a href="{$company.url}"><img title="{$company.name}" class="logo" src="{$company.picture.url}" alt="{$company.name}" style="max-width: 100%;"></a>              
        </div><br/>
        <a href="{$company.url}">{$company.web}</a>
    </div>
{/if}
