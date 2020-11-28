{if  $employee_user->get('average_notation') > 0}
<div style="display: inline-block;">
                <span class="UserVotestars-onProfile">
                    {section name=note start=0 loop=$employee_user->getFormatter()->getAverageNotation()->getFull()}
                    <i class="mdi mdi-star"></i>                   
                    {/section}
                    {if $employee_user->getFormatter()->getAverageNotation()->isHalf()}
                    <i class="mdi mdi-star-half">                        
                    </i>
                    {/if}
                </span>
                <p class="para-onProfile">{$employee_user->getFormatter()->getAverageNotation()->getText()} ({$employee_user->getFormatter()->getNumberOfNotations()->getAround()})</p>
</div>
{/if}