{if  $employer_user->get('average_notation') > 0}
<div style="display: inline-block;">
    <span class="UserVotestars-onProfile">
        {section name=note start=0 loop=$employer_user->getFormatter()->getAverageNotation()->getFull()}
        <i class="mdi mdi-star"></i>                   
        {/section}
        {if $employer_user->getFormatter()->getAverageNotation()->isHalf()}
        <i class="mdi mdi-star-half">                        
        </i>
        {/if}
    </span>
    <p class="para-onProfile">{$employer_user->getFormatter()->getAverageNotation()->getText()} ({$employer_user->getFormatter()->getNumberOfNotations()->getAround()})</p>
</div>
{/if}