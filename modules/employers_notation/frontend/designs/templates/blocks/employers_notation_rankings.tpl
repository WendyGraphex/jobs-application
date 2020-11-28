<div class="ranking-onProfile" style="width: 100%;">
    <div class="notations">
        <h4>{__('Rankings')}</h4>
        <div class="details-notations">
                <span class="total-rating">{$employer_user->getFormatter()->getNumberOfNotations()->getChoices()}</span>
                 {if $employer_user->getNumberOfNotations()}
                <span class="all-stars-voted">
                     {section name=note start=0 loop=$employer_user->getFormatter()->getAverageNotation()->getFull()}
                    <i class="mdi mdi-star"></i>                   
                    {/section}
                    {if $employer_user->getFormatter()->getAverageNotation()->isHalf()}
                    <i class="mdi mdi-star-half">                        
                    </i>
                    {/if}                   
                </span>
                <span class="total-votes">{$employer_user->getFormatter()->getAverageNotation()->getText()}</span>
                {/if}
            </div>
        {if $employer_user->getNumberOfNotations()}
            <div class="ranking-notation">
                {foreach $employer_user->getNotations() as $category}
                <h5>{$category->getI18n()->getTitle()->ucfirst()}</h5>
                <ul class="list-notation">
                     {foreach $category->getCriterias() as $criteria}
                    <li>
                        {$criteria->getI18n()->getTitle()->ucfirst()}<span>{$criteria->getNotations()}</span>
                    </li>
                    {/foreach}                    
                </ul>              
                {/foreach}
            </div>
        </div>
    {/if}
    {*component name="/employers_notation/AddEmployeeReviewBtn"}      
    {component name="/employers_notation/AddEmployerReviewBtn"*}      
</div>
{*</div>*}

