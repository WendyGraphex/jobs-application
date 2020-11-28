<nav  class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">    
    <div class="divAllInside">
        <div class="container">
            {component name="/site_company/Display" tpl="logoCompany"}
            {*<a class="navbar-brand" href="index.html">EWEB JOBS</a>*}
            <button class="navbar-toggler btnMenuResponsive" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <button class="navbar-toggler btnCategoriesResponsive" type="button" data-toggle="collapse" data-target="#navCategories" aria-controls="navCategories" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> {__('Categories')}
            </button>
            <div class="languagesAndCurrency second-languagesAndCurrency" style="display:none;">
                <div class="languages-new-class">
                    {component name="/site_languages/list"}
                </div>
                <div class="devises-new-class">
                    {component name="/site_currency/list"}              
                </div>
            </div>
            {include file="./includes/header.tpl"}
        </div>
        <div>
            {component name="/partners/menu" node="top" tpl="default"} 
        </div>
    </div>
</nav>
