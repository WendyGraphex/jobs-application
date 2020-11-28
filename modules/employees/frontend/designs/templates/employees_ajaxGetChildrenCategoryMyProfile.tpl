{if !$item_i18n->getCategory()->getChildren()->isEmpty()}   
    {foreach $item_i18n->getCategory()->getChildren() as $item}    
        <li class="ItemOnHover">           
            <a href="#" class="EmployeeWorkCategoryChildren-item text-decoration-none" id="{$item->get('id')}">             
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
    
     $(".EmployeeWorkCategoryChildren-item").click(function () { 
             var params={  EmployeeCategory : { node: $(this).attr('id'), 
                                             lang : '{$item_i18n->get('lang')}',
                                             selection : $("#DialogCategoryList").data('selection'),
                                             token : '{mfForm::getToken('EmployeePartnerWorkCategorySelectionForm')}' },
                        };      
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('employees_ajax',['action'=>'ListPartialDialogCategoryForMyProfile'])}", 
                                 target: "#Modal-Categories-ctn" 
                                  }); 
        });
    
</script>    

