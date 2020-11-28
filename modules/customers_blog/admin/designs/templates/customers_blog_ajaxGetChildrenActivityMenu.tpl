{if !$item_i18n->getMenu()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getMenu()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="CustomerBlogActivityMenuChildren-item text-decoration-none" id="{$item->get('id')}">
              <i class="fa fa-folder-o"></i>
              {if $item->hasI18n()}
                    {$item->getI18n()->get('title')}
              {else}
                {__('---')}
              {/if}</a>           
        </li>
    {/foreach}    
  
{else}
    {__('No activity')}
{/if}

<script type="text/javascript">
    
     $(".CustomerBlogActivityMenuChildren-item").click(function () { 
             var params={  CustomerBlogActivityMenuNode : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('CustomerBlogActivityMenuForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivityMenu'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    