<h4 style="margin-bottom: 20px;">{__('My review from %s',$project->getEmployerUser()->get('username'))}  
    {if !$project->hasEmployerNotation()}{__('(Not yet reviewed)')}{/if}
</h4>  
{if $project->isLoaded()}
    {foreach $project->getEmployeeReviews()->forEmployee() as $category}
<div>
    <span class="classCategoryStyle">{$category->getI18n()->getTitle()->ucfirst()}</span>
    <ul class="ulCategory">
        {foreach $category->getCriterias() as $criteria}
        <li>
            <span>{$criteria->getI18n()->getTitle()->ucfirst()}</span>
            <div>
                <ul class="allStars Notation" data-rate="0" data-criteria="{$criteria->get('id')}" data-category="{$category->get('id')}">
                    {*if $criteria->hasReview()}{$criteria->getReview()->get('notation')}OK{else}KO{/if*}
                    {section name=note start=0 loop=$criteria->get('max')}
                        <li> <a href="#" id="{$smarty.section.note.index}" class="Criteria-{$criteria->get('id')} Criteria" data-criteria="{$criteria->get('id')}" data-category="{$category->get('id')}" style="color:#222;">
                            {if  $criteria->hasReview()}
                                {if $smarty.section.note.index <= $criteria->getReview()->get('notation')}
                                    <i class="mdi mdi-star"></i> 
                                {else}
                                    <i class="mdi mdi-star-outline"></i>   
                                {/if}    
                            {else}
                            <i class="mdi mdi-star-outline"></i>
                            {/if}                          
                            </a></li>                  
                    {/section}                   
                </ul>
            </div>
        </li>
        {/foreach}
    </ul>
</div>
{/foreach}
    
<script type="text/javascript">
    
</script>      
{else}
    {__('Project is invalid')}
{/if}    

