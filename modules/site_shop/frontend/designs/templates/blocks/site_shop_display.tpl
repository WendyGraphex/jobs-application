{if $tpl=='header'}{$shop_i18n->get('meta_title')}{elseif $tpl==""}{if $field}{$shop_i18n->get($field)}{/if}
{elseif $tpl=='meta_author' && $shop_i18n->get('meta_author')}
<meta name="author" content="{$shop_i18n->get('meta_author')}"/> 
{elseif $tpl=='meta_description' && $shop_i18n->get('meta_description')}
<meta name="description" content="{$shop_i18n->get('meta_description')}"/>   
{elseif $tpl=='meta_keywords' && $shop_i18n->get('meta_keywords')}
<meta name="keywords" content="{$shop_i18n->get('meta_keywords')}"/>     
{/if}