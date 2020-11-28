<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Employer - payment refused')}</title>    
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
            
          {component name="/employers_messager/messages"}    
          
          {component name="/cart/SmallCartDisplay"}
          
          {component name="/employers/profile"}          
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      {component name="/employers/menu"}
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper" id="page-wrapper">  
            {if $payment_request->isLoaded()}
                {if $payment_request->getStatus()->isRefused()}
                    <div class="alert alert-danger"><i class="mdi mdi-alert-circle-outline"></i> {__('Payment %s has been refused',$payment_request->get('reference'))}</div>
                {else}
                    <div class="alert alert-danger"><i class="mdi mdi-alert-circle-outline"></i> {__('Payment is invalid')}</div>
                {/if}    
            {else}
               <div class="alert alert-danger"><i class="mdi mdi-alert-circle-outline"></i> {__('Payment is invalid')}</div>
            {/if}    
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
{component name="/employers/unlock"}
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
  {component name="/utils/UIresources" version="1.11.3"}
  <script src="{url('/majestic/js/flyto.js','web','frontend')}"></script>
  <script src="{url('js/jquery.custom.js','web')}"></script> 
  {component name="/utils_dropzone/resources" version="5.7.0"}  
  <script src='{url('/majestic/js/select2/select2.min.js','web')}' type='text/javascript'></script>     
  {component name="/utils_ckeditor/resources" version="4.14.1"}
  <script type="text/javascript">
          
            $(function()
            {
                 $("#Profile-Settings").click(function () { 
                       return $.ajax2({                                
                                             url: "{url_to('employers_ajax',['action'=>'Settings'])}", 
                                             target: "#page-wrapper"
                       });
                 });
                 
                  $("#Profile-MyProfile").click(function () { 
                         return $.ajax2({                                
                                             url: "{url_to('employers_ajax',['action'=>'MyProfile'])}", 
                                             target: "#page-wrapper"
                       });
                  });
                  
                 
            }); 
    
        </script> 
</body>

</html>


