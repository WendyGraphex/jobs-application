{if !$item_i18n->getMenu()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getMenu()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="CmsMenuChildren-item text-decoration-none" id="{$item->get('id')}">
              <i class="fa fa-folder-o"></i>
             {if $item->hasI18n()}
                 {if $item->getI18n()->hasTitle()}     
                     {$item->getI18n()}
                 {else}
                     {__('-- No title --')}
                 {/if}
              {else}
                  {__('---')}
              {/if}</a>           
        </li>
    {/foreach}    
  
{else}
    {__('No menu')}
{/if}

<script type="text/javascript">
    
     $(".CmsMenuChildren-item").click(function () { 
             var params={  CmsMenuNode : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('CmsMenuNodeForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    