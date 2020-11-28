<div class="ranking-onProfile">
    <div class="notations" style="padding: 25px;">
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
                <h5>{__('Category1')}</h5>
                <ul class="list-notation">
                    <li>
                        Seller communication level<span>4.9</span>
                    </li>
                    <li>
                        Recommend to a friend<span>4.9</span>
                    </li>
                    <li>
                        Service as described<span>4.9</span>
                    </li>
                </ul>
                <h5>{__('Category2')}</h5>
                <ul class="list-notation">
                    <li>
                        Seller communication level<span>4.9</span>
                    </li>
                    <li>
                        Recommend to a friend<span>4.9</span>
                    </li>
                    <li>
                        Service as described<span>4.9</span>
                    </li>
                </ul>
            </div>
        </div>
    {/if}
    {*component name="/employers_notation/AddEmployeeReviewBtn"*}      
    {*component name="/employers_notation/AddEmployerReviewBtn"*}      
</div>
</div>

