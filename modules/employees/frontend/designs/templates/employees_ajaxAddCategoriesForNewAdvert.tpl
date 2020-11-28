<div id="EmployeeAdvertCategories" style="padding-top: 15px;">
{foreach $form->getSelection() as $category} 
    <div class="btn btn-secondary-perso EmployeeAdvertCategories-list" id="{$category->get('id')}">                           
         <div class="EmployeeAdvertCategories" id="{$category->get('id')}">
            {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                              
            <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeAdvertCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                <i  class="fa fa-times delete-color"></i>
            </a>                                                       
        </div>
    </div>    
{/foreach}    
</div>
<script type="text/javascript">   
     
     $("#EmployeeAdvertCategories").data('selection',{$form->getSelection()->getKeys()->toJson()});
     
     $(".EmployeeAdvertCategory-Delete").click(function () {                    
            $(".EmployeeAdvertCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    
