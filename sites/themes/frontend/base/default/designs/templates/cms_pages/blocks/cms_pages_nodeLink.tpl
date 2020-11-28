{if $tpl=='agreement'}
<a href="{$page_i18n->getUrl()}" target="_blank">{__('I agree to all Terms & Conditions')}</a>
{else}
<a href="{$page_i18n->getUrl()}" target="_blank">{$page_i18n->getFormatter()->getMetaTitle()->ucfirst()}</a>
{/if}    