<div class="collapse navbar-collapse" id="ftco-nav">
    <ul class="listbuttonSecond">
        <li class="nav-item cta mr-md-2 PostAJobBtn">{component name="/employers/postAJobMenu"}</li>
        <li class="nav-item cta cta-colored mr-md-2 WantAJobBtn">{component name="/employees/wantAJobMenu"}</li>      
    </ul>
    <ul class="listbuttonSecond">    
        <li class="nav-item cta mr-md-2 showListInside">{component name="/customers/signin"}</li>
        <li class="nav-item cta mr-md-2 showListInside">{component name="/customers/login"}</li>
    </ul>
    
    <ul class="navbar-nav ml-auto">  
        
        {component name="/cms_pages/menu" node="header" tpl="header"}           
        {* <li class="nav-item "><a class="nav-link" href="http://www.project55.net/contact-us">My account</a></li>*}
        {component name="/employers/myaccountLink"}
        {component name="/employees/myaccountLink"}
        {component name="/site_event/myaccountLink"}         
        {component name="/customers_academy_teacher/myaccountLink"}
        {component name="/customers_academy_student/myaccountLink"}
        
        <li class="nav-item cta mr-md-2 PostAJobBtn classHideLi">{component name="/employers/postAJobMenu"}</li>
        <li class="nav-item cta cta-colored mr-md-2 WantAJobBtn classHideLi">{component name="/employees/wantAJobMenu"}</li>      
        <li class="nav-item cta mr-md-2 showListInside classHideLi">{component name="/customers/signin"}</li>
        <li class="nav-item cta mr-md-2 showListInside classHideLi">{component name="/customers/login"}</li>
        
        <div class="languagesAndCurrency original-languagesAndCurrency">
            <div class="languages-new-class">
                {component name="/site_languages/list"}
            </div>
            <div class="devises-new-class">
                {component name="/site_currency/list"}              
            </div>
        </div>
            
    </ul>      
</div>
