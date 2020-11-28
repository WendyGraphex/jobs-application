{if !$item_i18n->getCategory()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getCategory()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="EmployerWorkCategoryChildren-item text-decoration-none" id="{$item->get('id')}">             
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
    
     $(".EmployerWorkCategoryChildren-item").click(function () { 
             var params={  EmployerWorkCategory : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('EmployerWorkCategoryForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCategoryForAdvert'])}", 
                                 target: "#Modal-Categories-ctn" 
                                  }); 
        });
    
</script>    
