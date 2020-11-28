<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Freelancer - Home')}</title>  
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>  
        <!-- plugins:css -->{*url('/download.png','picture')*}
        {header}
        <link rel="stylesheet" href="{url('/majestic/css/vendors/mdi/css/materialdesignicons.min.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/majestic/css/vendors/base/vendor.bundle.base.css','web','frontend')}">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <link rel="stylesheet" href="{url('/majestic/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css','web','frontend')}">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="{url('/majestic/css/style.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/majestic/css/jquery-ui.min.css','web','frontend')}">
        <!-- endinject -->
        <link rel="shortcut icon" href="{url('/favicon.png','picture')}" />
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        <!-- select2 -->
        <link href="{url('/majestic/css/select2/select2.min.css','web')}" type='text/css' rel='stylesheet'>

        <!-- select2 -->

        <script src="{url('/js/jquery/3.4.1/jquery.min.js','web')}"></script>  
    </head>
    <body>   
        <div id="body-ctn" class="container-scroller" {if $user->getGuardUser()->isLocked()}style="display:none"{/if}>
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="navbar-brand-wrapper d-flex justify-content-center">
                    <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">                     
                        {if $_request->getSite()->getSite()->hasPicture()}
                            <a class="navbar-brand brand-logo" href="/"><img src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/></a>
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
                    {*  <ul class="navbar-nav mr-lg-4 w-100">
                    <li class="nav-item nav-search d-none d-lg-block w-100">
                    <div class="input-group">
                    <div class="input-group-prepend">
                    <span class="input-group-text" id="search">
                    <i class="mdi mdi-magnify"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search">
                    </div>
                    </li>
                    </ul> *}
                    <ul class="navbar-nav navbar-nav-right">
                        {component name="/employees_messager/messages"}

                        {*  <li class="nav-item dropdown mr-4">
                        <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-toggle="dropdown">
                        <i class="mdi mdi-bell mx-0"></i>
                        <span class="count"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                        <a class="dropdown-item">
                        <div class="item-thumbnail">
                        <div class="item-icon bg-success">
                        <i class="mdi mdi-information mx-0"></i>
                        </div>
                        </div>
                        <div class="item-content">
                        <h6 class="font-weight-normal">Application Error</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                        Just now
                        </p>
                        </div>
                        </a>
                        <a class="dropdown-item">
                        <div class="item-thumbnail">
                        <div class="item-icon bg-warning">
                        <i class="mdi mdi-settings mx-0"></i>
                        </div>
                        </div>
                        <div class="item-content">
                        <h6 class="font-weight-normal">Settings</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                        Private message
                        </p>
                        </div>
                        </a>
                        <a class="dropdown-item">
                        <div class="item-thumbnail">
                        <div class="item-icon bg-info">
                        <i class="mdi mdi-account-box mx-0"></i>
                        </div>
                        </div>
                        <div class="item-content">
                        <h6 class="font-weight-normal">New user registration</h6>
                        <p class="font-weight-light small-text mb-0 text-muted">
                        2 days ago
                        </p>
                        </div>
                        </a>
                        </div>
                        </li>   *}      
                        {*component name="/cart_employee/SmallCartDisplay"*}
                        {component name="/employees/profile"}          
                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                {component name="/employees/menu"}
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper" id="page-wrapper">                      
                        {*  Completed:{if $user->getGuardUser()->isCompleted()}Y{else}N{/if}   *}
                        {if $user->getGuardUser()->isCompleted() && $user->getGuardUser()->getNumberOfAdverts()}
                            {component name="/employees/dashboard"}         
                            {component name="/employees/messages"}                       
                            {component name="/employees_statistic/dashboard"}                    
                            {component name="/employees_statistic/charts"}       
                            {component name="/sales_quotations/dashboardForEmployee"}  
                        {elseif $user->getGuardUser()->isCompleted() && !$user->getGuardUser()->getNumberOfAdverts()}             
                            {component name="/employees/MyFirstAdvert"}
                            {*elseif !$user->getGuardUser()->getCompany()->isConfigured() && $user->getGuardUser()->getCompany()->isCompleted()}    
                            WAIT CONFIGURATION  *}
                        {else}    
                            {component name="/employees/completion"}  
                        {/if}                      
                        {*if $user->getGuardUser()->isCompleted()}
                        {component name="/employees/dashboard"}           
                        {component name="/employees/messages"}  
                        {component name="/employees_statistic/dashboard"}                    
                        {component name="/employees_statistic/charts"}           
                        {component name="/quotations/dashboard"} 
                        {else}
                        {component name="/employees/completion"}  
                        {/if*}    
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->        
                    <footer class="footer">         
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">
                                {component name="/site/copyrights" tpl="account"}</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
            
  <!-- UNLOCK BEGIN -->          
{component name="/employees/unlock"}
    <!-- UNLOCK END -->        
         
  <!-- container-scroller -->  
  <!-- plugins:js -->
  <script src="{url('/majestic/js/vendors/base/vendor.bundle.base.js','web','frontend')}"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="{url('/majestic/js/vendors/chart.js/Chart.min.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/vendors/datatables.net/jquery.dataTables.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/vendors/datatables.net-bs4/dataTables.bootstrap4.js','web','frontend')}"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="{url('/majestic/js/off-canvas.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/hoverable-collapse.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/template.js','web','frontend')}"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="{url('/majestic/js/dashboard.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/data-table.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/jquery.dataTables.js','web','frontend')}"></script>
  <script src="{url('/majestic/js/dataTables.bootstrap4.js','web','frontend')}"></script>
  <!-- End custom js for this page-->

  <script src="{url('js/jquery.custom.js','web')}"></script> 
  {component name="/utils_dropzone/resources" version="5.7.0"}
  
  <script src='{url('/majestic/js/select2/select2.min.js','web')}' type='text/javascript'></script>    
  
 {component name="/utils_ckeditor/resources" version="4.14.1"}

 {component name="/utils/UIresources" version="1.11.3"}
 {component name="/employees/resources"}

 
 
  <script type="text/javascript">
          
            $(function()
            {
                 $("#Profile-Settings").click(function () { 
                       return $.ajax2({                                
                                             url: "{url_to('employees_ajax',['action'=>'Settings'])}", 
                                             target: "#page-wrapper"
                       });
                 });
                 
                  $("#Profile-MyProfile").click(function () { 
                         return $.ajax2({                                
                                             url: "{url_to('employees_ajax',['action'=>'MyProfile'])}", 
                                             target: "#page-wrapper"
                       });
                  });
            }); 
        
        
        
   
        </script> 
        
              
</body>

</html>
