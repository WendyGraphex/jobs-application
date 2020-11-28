 <div class="col-md-12 {*ftco-animate*}">
        <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

            <div class="mb-4 mb-md-0 mr-5">
                <div class="job-post-item-header d-flex align-items-center">
                    <a href="{$item_i18n->getUrl()}">
                        <h2 class="mr-3 text-black h4">{$item_i18n->getFormatter()->getTitle()->ucfirst()|truncate:40}</h2>
                    </a>
                </div>
                 <div>{$item_i18n->getFormatter()->getShortDescription()->ucfirst()|truncate:80}...
            </div>
                 <div class="job-post-item-body d-block d-md-flex">
                
                <div class="mr-3"><span class="icon-layers"></span> <a href="{$item_i18n->getAdvert()->getEmployerUser()->getUrl()}">{$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}</a></div>
                <div><span class="icon-my_location"></span> <span>{$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getCity()->ucfirst()}, {$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getCountry()->getText()->ucfirst()}</span></div>
            </div>
            </div>

            <div class="ml-auto d-flex">
                <a href="javascript:void();" class="btn btn-primary py-2 mr-1 EmployeeAdvertMakeOffer">{__('Make an offer')}</a>
                {*<a href="javascript:void();" class="btn btn-danger rounded-circle btn-favorite d-flex align-items-center">
                    <span class="icon-heart"></span>
                </a>*}
            </div>

        </div>
</div> <!-- end -->