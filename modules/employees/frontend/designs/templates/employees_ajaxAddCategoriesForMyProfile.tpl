<div id="EmployeeCategories">
{foreach $form->getSelection() as $category} 
    <div class="btn btn-outline-primary EmployeeCategories-list" id="{$category->get('id')}">                           
         <div class="EmployeeCategories" id="{$category->get('id')}">
            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                              
            <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                <i  class="fa fa-times icon-font delete-color"></i>
            </a>                                                       
        </div>
    </div>    
{/foreach}    
</div>
<script type="text/javascript">   
     
     $("#EmployeeCategories").data('selection',{$form->getSelection()->getKeys()->toJson()});
     
     $(".EmployeeCategory-Delete").click(function () {                    
            $(".EmployeeCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    

