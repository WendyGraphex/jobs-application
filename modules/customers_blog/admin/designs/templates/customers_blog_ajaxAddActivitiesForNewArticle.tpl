<div id="CustomerBlogActivities" style="padding-top: 15px;">
{foreach $form->getSelection() as $activity} 
    <div class="btn btn-outline-primary CustomerBlogActivities-list" id="{$activity->get('id')}">                           
         <div class="CustomerBlogActivities" id="{$activity->get('id')}">
            {if $activity->hasI18n()}{$activity->getI18n()->get('title')}{else}{__('----')}{/if}                                                                              
            <a href="javascript:void(0);" title="{__('Delete')}" id="{$activity->get('id')}" class="CustomerBlogActivity-Delete" name="{if $activity->hasI18n()}{$activity->getI18n()->get('title')}{else}{$activity->get('name')}{/if}">
                <i  class="fa fa-times delete-color"></i>
            </a>                                                       
        </div>
    </div>    
{/foreach}    
</div>
<script type="text/javascript">   
     
    $("#CustomerBlogActivities").data('selection',{$form->getSelection()->getKeys()->toJson()});
     
    $(".CustomerBlogActivity-Delete").click(function () {   
        $(".CustomerBlogActivities-list[id="+$(this).attr('id')+"]").remove();
    }); 
</script>    
