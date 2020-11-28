<!-- employees-listAdvert-{$tpl} --> 
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">{__('Recently Added Jobs')}</span>
                <h2 class="mb-4">{__('Recent Jobs added by Freelancers')}</h2>
            </div>
        </div>      
        <div id="employee-list-advert-{$tpl}"> 
            {include file="./../employees_ajaxListPartialBlockAdvert.tpl"}                                            
        </div>                     
    </div>    
</section>
                
                              
    