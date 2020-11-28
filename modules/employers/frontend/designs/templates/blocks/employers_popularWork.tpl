  <section class="ftco-section ftco-counter">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">{__('Categories work waiting for you')}</span>
                <h2 class="mb-4">{__('Current Job Posts')}</h2>
            </div>
        </div>
        <div class="divCategories-andSubCategories">
            {foreach $categories as $category}
                 <div>
                <ul class="category">
                    <li class="showAllSubCategories">
                        <a href="{$category->getI18n()->getUrl()}">
                            <span class="iconSubCategories">
                                {if $category->hasIcon()}
                                <img src="{$category->getIcon()->getOriginal()->getUrl()}"/>
                                {else}
                                     <img src="/web/pictures/translation11.png"/>
                                {/if}
                            </span>                           
                            <span class="titleCtegoriseHome">{$category->getI18n()->getFormatter()->getTitle()->ucfirst()}</span>
                            <span class="number" data-number="{$category->getFormatter()->getNumberOfJobs()}">{$category->getFormatter()->getNumberOfJobs()}</span></a>
                    </li>                               
                </ul>
            </div>
            {/foreach}                          
        </div>
    </div>
</section>
