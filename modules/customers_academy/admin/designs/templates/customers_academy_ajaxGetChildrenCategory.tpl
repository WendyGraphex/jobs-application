{if !$item_i18n->getCategory()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getCategory()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="CustomerCourseCategoryChildren-item text-decoration-none" id="{$item->get('id')}">
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
    
     $(".CustomerCourseCategoryChildren-item").click(function () { 
             var params={  CustomerCourseCategory : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             token : '{mfForm::getToken('CustomerCourseCategoryForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('customers_academy_ajax',['action'=>'ListPartialCategory'])}", 
                                 target: "#actions" 
                                  }); 
        });
    
</script>    