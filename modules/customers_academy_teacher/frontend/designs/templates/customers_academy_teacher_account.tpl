<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Teacher - Home')}</title>    
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        {header}
        <link rel="stylesheet" href="{url('/majestic/css/vendors/mdi/css/materialdesignicons.min.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/majestic/css/vendors/base/vendor.bundle.base.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/majestic/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css','web','frontend')}">
        <link rel="stylesheet" href="{url('css/chosen/component-chosen.css','web')}">
        <link rel="stylesheet" href="{url('/majestic/css/style.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/majestic/css/jquery-ui.min.css','web','frontend')}">
        <link rel="shortcut icon" href="{url('/favicon.png','picture')}" />
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        <link href="{url('/majestic/css/select2/select2.min.css','web')}" type='text/css' rel='stylesheet'>
        <script src="{url('/js/jquery/3.4.1/jquery.min.js','web')}"></script> 
    </head>

    <body>   
        <div id="body-ctn" class="container-scroller" {if $user->getGuardUser()->isLocked()}style="display:none"{/if}>
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="navbar-brand-wrapper d-flex justify-content-center">
                    <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">                     
                        {if $_request->getSite()->getSite()->hasPicture()}
                            <a class="navbar-brand brand-logo" href="/"><img width="60px" src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/></a>
                                {*  <a class="navbar-brand brand-logo-mini" href="/"><img src="{url('/logo-mini.svg','picture')}" alt="logo"/></a>*}
                            {else}
                            <a class="navbar-brand brand-logo" href="/"><img src="/admin/web/pictures/logo.png"/></a>
                                {*<a class="navbar-brand brand-logo-mini" href="/"><img src="{url('/logo-mini.svg','picture')}" alt="logo"/></a> *}
                            {/if}    
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                            <span class="mdi mdi-sort-variant"></span>
                        </button>
                    </div>  
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

                    <ul class="navbar-nav navbar-nav-right">                    
                        {*component name="/cart/SmallCartDisplay"*}
                        {component name="/customers_academy_teacher/profile"}          
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <div class="container-fluid page-body-wrapper">
                {component name="/customers_academy_teacher/menu"}
                <div class="main-panel">
                    <div class="content-wrapper" id="page-wrapper">  
                        {if $user->getGuardUser()->isCompleted()}
                            {component name="/customers_academy_teacher/dashboard"}         
                        {else}    
                            {component name="/customers_academy_teacher/completion"}  
                        {/if}  
                    </div>

                    <footer class="footer">         
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">
                                {component name="/site/copyrights" tpl="account"}</span>
                        </div>
                    </footer>
                </div>
            </div>
        </div>

        {component name="/customers_academy_teacher/unlock"}     

        <script src="{url('/majestic/js/vendors/base/vendor.bundle.base.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/vendors/chart.js/Chart.min.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/vendors/datatables.net/jquery.dataTables.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/vendors/datatables.net-bs4/dataTables.bootstrap4.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/off-canvas.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/hoverable-collapse.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/template.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/dashboard.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/data-table.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/jquery.dataTables.js','web','frontend')}"></script>
        <script src="{url('/majestic/js/dataTables.bootstrap4.js','web','frontend')}"></script>
        {component name="/utils/UIresources" version="1.11.3"}
        <script src="{url('/majestic/js/flyto.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web')}"></script> 
        {component name="/utils_dropzone/resources" version="5.7.0"}  
        <script src='{url('/majestic/js/select2/select2.min.js','web')}' type='text/javascript'></script>     
        {component name="/utils_ckeditor/resources" version="4.14.1"}
        <script  src="{url('js/chosen/1.8.7/chosen.jquery.js','web')}"></script>
        <script type="text/javascript">
            Dropzone.options.myAwesomeDropzone = false;
            Dropzone.autoDiscover = false;
        </script> 

    </body>
</html>


