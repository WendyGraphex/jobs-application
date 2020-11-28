{if !$item_i18n->getActivity()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getActivity()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="CustomerBlogActivityChildren-item text-decoration-none" id="{$item->get('id')}">
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
    
     $(".CustomerBlogActivityChildren-item").click(function () { 
             var params={  CustomerBlogActivityNode : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('CustomerBlogActivityForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialActivity'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    