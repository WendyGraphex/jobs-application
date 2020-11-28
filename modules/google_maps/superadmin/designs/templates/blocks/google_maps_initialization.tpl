{if $form->hasValidator('google_map_clean')}
<div>
<div>{$form.google_map_clean->getError()}</div>
<input type="checkbox" class="{$site->getSiteID()}-SiteInitialization Checkbox" name="google_map_clean" {if $form.google_map_clean->getValue()}checked=""{/if}/><span>{__('Remove google map address')}</span>
</div>
{/if}

