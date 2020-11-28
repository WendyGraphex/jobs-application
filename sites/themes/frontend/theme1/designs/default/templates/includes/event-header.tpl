<div class="collapse navbar-collapse" id="ftco-nav">
    <ul class="navbar-nav ml-auto">   
        {component name="/cms_pages/menu" node="header" tpl="header"}           

         
        {component name="/site_event/myaccountLink"}         
        
        <li class="nav-item cta mr-md-2 showListInside">{component name="/customers/signin"}</li>
        
        <li class="nav-item cta mr-md-2 showListInside">{component name="/customers/login"}</li>
        
        <div class="languagesAndCurrency">
            <div>
                 {component name="/site_event_cart/SmallCartDisplay" tpl='home'}
            </div>
            <div class="languages-new-class">
                {component name="/site_languages/list"}
            </div>
            <div class="devises-new-class">
                {component name="/site_currency/list"}              
            </div>
        </div>
    </ul>      
</div>
