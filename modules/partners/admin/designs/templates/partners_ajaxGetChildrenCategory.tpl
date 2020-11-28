{if !$item_i18n->getCategory()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getCategory()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="PartnerWorkCategoryChildren-item text-decoration-none" id="{$item->get('id')}">
              <i class="fa fa-folder-o"></i>
              {if $item->hasI18n()}
                    {$item->getI18n()->get('title')}
              {else}
                {__('---')}
              {/if}</a>           
        </li>
    {/foreach}    
  
{else}
    {__('No category')}
{/if}

<script type="text/javascript">
    
     $(".PartnerWorkCategoryChildren-item").click(function () { 
             var params={  PartnerWorkCategoryNode : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('PartnerWorkCategoryForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('partners_ajax',['action'=>'ListPartialCategory'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    