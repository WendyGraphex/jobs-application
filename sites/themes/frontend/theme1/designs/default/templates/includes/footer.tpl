<footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="ConainerFooter">
        <div class="col-md-12">
            <div class="row mb-5" style="margin-bottom: 0rem !important;">
                {*===================Employees========================*}
                <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{('Freelancers')}</h2>
                        <ul class="list-unstyled">
                            <li>{component name="/employees/loginLink" tpl="loginFooter"}</li>
                            <li>{component name="/employees/signinLink" tpl="signInFooter"}</li>
                            <li>{component name="/employees/wantMissionLink" tpl="wantMissionFooter"}</li>
                            <li>{component name="/employees/contactLink"}</li>
                            <li>{component name="/employees/listEmployeesLink"}</li>
                            <li>{component name="/employees/skillsEmployeesLink"}</li>
                            <li>{component name="/employees/skillsLink"}</li>
                        </ul>
                    </div>
                </div>
                {*===================Employers========================*}
                <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{('Employers')}</h2>
                        <ul class="list-unstyled">
                            <li>{component name="/employers/loginLink" tpl="loginFooter"}</li>
                            <li>{component name="/employers/signinLink" tpl="signInFooter"}</li>
                            <li>{component name="/employers/postMissionLink" tpl="postMissionFooter"}</li>
                            <li>{component name="/employers/contactLink"}</li>  
                            <li>{component name="/employers/listEmployersLink"}</li>
                            <li>{component name="/employers/listCompaniesLink"}</li>
                        </ul>
                    </div>
                </div>
                {*===================Search 1========================*}
                <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">Search</h2>
                        <h3 class="classH3">{('Freelancer Index')}</h3>
                        <ul class="list-unstyled">
                            {component name="/employees/searchCityLinks"}
                            {component name="/employees/searchUserLanguageLinks"}
                            {component name="/employees/searchSkillLinks"}
                            {component name="/employees/searchCountryLinks"}                       
                        </ul>
                        <h3 class="classH3">{('Employer Index')}</h3>
                        <ul class="list-unstyled">
                            {component name="/employers/searchCityLinks"}
                            {component name="/employers/searchUserLanguageLinks"}                     
                            {component name="/employers/searchCountryLinks"}    
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{('Search')}</h2> 
                        <h3 class="classH3">{('Jobs Index')}</h3>
                        <ul class="list-unstyled">                       
                            {component name="/employees/searchAdvertTitleLinks"}   
                            {component name="/employees/searchAdvertCityLinks"}   
                            {component name="/employees/searchAdvertLanguageLinks"}   
                            {component name="/employees/searchAdvertUserLanguageLinks"}                                 
                            {component name="/employees/searchAdvertSkillLinks"}
                            {component name="/employees/searchAdvertCountryLinks"}  
                        </ul>
                        <h3 class="classH3">{('Missions Index')}</h3>
                        <ul class="list-unstyled">                       
                            {component name="/employers/searchAdvertTitleLinks"}   
                            {component name="/employers/searchAdvertCityLinks"}   
                            {component name="/employers/searchAdvertLanguageLinks"}   
                            {component name="/employers/searchAdvertUserLanguageLinks"}                                                      
                            {component name="/employers/searchAdvertCountryLinks"}  
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{('Search')}</h2> 
                        <h3 class="classH3">{('Jobs Index')}</h3>
                        <ul class="list-unstyled">
                            {component name="/employees/categoriesLink"}                       
                            {component name="/employees/citiesLink"}  
                            {component name="/employees/countriesLink"}  
                            {component name="/employees/popularsLink"}  
                            {component name="/employees/recentsLink"}  
                            {component name="/employees/skillsAdvertsLink"}  
                        </ul>
                        <h3 class="classH3">{('Missions Index')}</h3>
                        <ul class="list-unstyled">
                            {component name="/employers/categoriesLink"}            
                            {component name="/employers/citiesLink"}  
                            {component name="/employers/countriesLink"}  
                            {component name="/employers/popularsLink"}  
                            {component name="/employers/recentsLink"}                                     
                        </ul>
                    </div>
                </div>
            </div>
          
            <div class="row" style="color: #fff;margin-top: 50px;">
                {component name="/cms_pages/menu" node='about' tpl='about'}
                {component name="/cms_pages/menu" node='safety' tpl='safety'}
                {component name="/cms_pages/menu" node='helpcenter' tpl='helpcenter'}
                {component name="/cms_pages/menu" node='blog' tpl='blog'}
                {component name="/cms_pages/menu" node='academy' tpl='academy'}          
            </div> 
            <div class="row">
                <div class="col-md-12" style="margin-top: 25px;">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{__('Contact Us')}</h2>
                        <ul class="list-unstyled" style="font-size: 16px;">                    
                            <li>{component name="/site_company/Display" tpl="address1"}</li>
                            <li>{component name="/site_company/Display" tpl="phone"}</li>
                            <li>{component name="/site_company/Display" tpl="email"}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center" style="padding: 0px;">
                {component name="/social_networks/SocialNetworksDisplay" tpl="bottom"}
            </div> 
            {component name="/site/copyrights" tpl="indexBottom"}
        </div>
    </div>
</footer>
{component name="/utils_ckeditor/resources" version="4.14.1" tpl="simple"}
{component name="/google_analytics/tag"}
{component name="/employees/resources"}
{component name="/employers/resources"}