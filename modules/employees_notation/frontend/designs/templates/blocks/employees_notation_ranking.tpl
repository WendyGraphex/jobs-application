<div class="ranking-onProfile">
        <div class="notations" style="padding: 25px;">
            <div class="details-notations">
                <span class="total-rating">{$employee_user->getFormatter()->getNumberOfNotations()->getChoices()}</span>
                 {if $employee_user->getNumberOfNotations()}
                <span class="all-stars-voted">
                     {section name=note start=0 loop=$employee_user->getFormatter()->getAverageNotation()->getFull()}
                    <i class="mdi mdi-star"></i>                   
                    {/section}
                    {if $employee_user->getFormatter()->getAverageNotation()->isHalf()}
                    <i class="mdi mdi-star-half">                        
                    </i>
                    {/if}                   
                </span>
                <span class="total-votes">{$employee_user->getFormatter()->getAverageNotation()->getText()}</span>
                {/if}
            </div>
             {if $employee_user->getNumberOfNotations()}
            <div class="ranking-notation">
                {foreach $employee_user->getNotations() as $category}
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
            {/if}
            {*component name="/employees_notation/AddEmployeeReviewBtn"}      
            {component name="/employees_notation/AddEmployerReviewBtn"*}      
        </div>
    </div>
                
