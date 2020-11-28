<div class="nav-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-sm-6 col-md-6 col-12">
                <a class="navbar-brand" href="#">
                    {* <img cclass="img-responsive" src="{url('/pictures/academy/logo.jpg','web')}">*}
                    {component name="/site_gallery/pictureDisplay" picture="LogoAcademy" tpl="logo"}
                    Graphex Academy</a>
            </div>
            <div class="col-lg-3 col-sm-6 col-md-6 col-12">
                <form class="form-inline">
                    <div class="input-group search-bar" style="width: 100%;">
                        <input id="search" type="text" placeholder="Enter keyword" class="form-control" style="height: calc(1.5em + .75rem + 2px) !important;font-size: 16px;">
                        <button class="btn btn-primary ml-2 my-sm-0" type="submit" style="background-color: #007bff;border-color: #007bff;">Search</button>
                    </div>
                </form>
            </div>
            <div class="col-lg-4 col-sm-6 col-md-6 col-12 buttons">
                <ul class="links">
                    {*component name="/cms_pages/nodeUrl" page="academy_home_learn"}
                    {component name="/cms_pages/nodeUrl" page="academy_home_teach"}
                    {component name="/cms_pages/nodeUrl" page="academy_home_link_graphex"*}
                    {component name="/cms_pages/menu" node='academy-top' tpl='academy-top'}
                </ul>
            </div>
            <div class="col-lg-2 col-sm-6 col-md-6 col-12 buttons">
                <ul class="button-group">
                    {component name="/customers/AcademyLogin"}
                    {component name="/customers/AcademySignin"}
                    
                    {component name="/customers_academy_cart/SmallCartDisplay" tpl='home'}
                </ul>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light navbar-bg">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    {component name="/customers_academy/categories" tpl="default"} 
</nav>