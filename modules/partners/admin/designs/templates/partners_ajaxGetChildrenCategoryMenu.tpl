{if !$item_i18n->getMenu()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getMenu()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="PartnerWorkCategoryMenuChildren-item text-decoration-none" id="{$item->get('id')}">
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
    
     $(".PartnerWorkCategoryMenuChildren-item").click(function () { 
             var params={  PartnerWorkCategoryMenuNode : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('PartnerWorkCategoryMenuForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('partners_ajax',['action'=>'ListPartialCategoryMenu'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    