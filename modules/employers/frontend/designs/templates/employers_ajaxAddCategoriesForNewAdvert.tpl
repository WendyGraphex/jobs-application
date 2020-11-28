<div id="EmployerAdvertCategories" style="padding-top: 15px;">
{foreach $form->getSelection() as $category} 
    <div class="EmployerAdvertCategories-list" id="{$category->get('id')}" style="display: inline-block;">                           
         <div class="btn btn-secondary-perso EmployerAdvertCategories" id="{$category->get('id')}">
            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                              
            <a href="javascript:void(0);" title="{__('Delete')}" class="EmployerAdvertCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                <i  class="fa fa-times delete-color"></i>
            </a>                                                       
        </div>
    </div>    
{/foreach}    
</div>
<script type="text/javascript">   
     
     $("#EmployerAdvertCategories").data('selection',{$form->getSelection()->getKeys()->toJson()});
     
     $(".EmployerAdvertCategory-Delete").click(function () {            
         {*  if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  *}
            $(".EmployerAdvertCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    