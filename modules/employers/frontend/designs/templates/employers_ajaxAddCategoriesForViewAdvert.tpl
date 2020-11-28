<table id="ProductCategories" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
     <thead class="bg-info thead-color">
        <tr class="list-header">    
            <th>#</th>        
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Category')}</span>            
            </th>                            
            <th>{__('Actions')}</th>
        </tr>
    </thead>
{foreach $form->getSelection() as $category} 
    <tr class="ProductCategories-list" id="{$category->get('id')}"> 
        <td class="count">{$category@iteration}</td>                        
         <td class="ProductCategories" id="{$category->get('id')}">
            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}    
        </td>                           
        <td>                                             
            <a href="javascript:void(0);" title="{__('Delete')}" class="ProductCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                <i  class="fa fa-trash-alt icon-font delete-color"></i>
            </a>                                                       
        </td>
    </tr>    
{/foreach}    
</table>
<script type="text/javascript">   
     
    {* $("#ProductCategories").data('selection',{$form->getSelection()->getKeys()->toJson()}); *}
     
     $(".ProductCategory-Delete").click(function () {            
            if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            $(".ProductCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    