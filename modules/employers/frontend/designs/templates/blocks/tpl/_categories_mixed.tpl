{include file="./tpl/_categories_filter.tpl" mode='mixed'}    
         
<div class="row d-flex">
 {foreach $pager as $item_i18n}     
       {*==i18n={$item_i18n->get('id')}==={$item_i18n->get('advert_id')}== *}
     {component name="/employers/advertDisplay" advert=$item_i18n} 
 {/foreach}                           
</div>

<div class="row mt-5">
    {include file="./_pagers/default/_default_pager_adverts.tpl" pager=$pager} 
</div>
       
{component name="/employers_messager/dialog"}
{component name="/sales_quotation/makeoffer"}
{component name="/employers_contact/shareDialog"}
{component name="/employers_contact/abuseDialog"}
        
{include file="./tpl/_categories_js.tpl" mode="mixed"}        