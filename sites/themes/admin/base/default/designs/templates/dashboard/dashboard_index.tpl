<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
  <head>      
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">     
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">   
      {header}
        <link rel="stylesheet" href="{url('css/admin.css','web')}">
        <link rel="stylesheet" href="{url('css/awesome/5.7.2/css/all.css','web')}">
        <link rel="stylesheet" href="{url('css/chosen/component-chosen.css','web')}">
        <script  src="{url('js/chosen/1.8.7/chosen.jquery.js','web')}"></script>
        <link rel="stylesheet" href="{url('css/glyphicons/css/bootstrap-glyphicons.css','web')}">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  </head>
<body class="tooltips" cz-shortcut-listen="true">
    <!--
    ===========================================================
    BEGIN PAGE
    ===========================================================
    -->
    <div class="wrapper">
      <!-- BEGIN TOP NAV -->
<div class="position-fixed w-100" style="z-index:100;top:0px;">
<div class="top-navbar">
  <div class="top-navbar-inner">
    <!-- Begin Logo brand -->
    <div class="logo-brand position-fixed">
      <a href="/admin">
        <img title="Medicatablet" class="logo-admin" src="/admin/web/pictures/Graphex.png" alt="Logo" height=66px>
      </a>
    </div><!-- /.logo-brand -->
    <!-- End Logo brand -->
          
    <div class="top-nav-content px-5 position-relative bg-white">
            
      <!-- Begin button sidebar left toggle -->
      <div class="btn-collapse-sidebar-left position-absolute" id="btn-collapse">
        <i class="fa fa-bars"></i>
      </div><!-- /.btn-collapse-sidebar-left -->
      <!-- End button sidebar left toggle -->           
      {component name="/users_guard/user"}
      {component name="/contents/select"}
      <!-- End Collapse menu nav -->
    </div><!-- /.top-nav-content -->
  </div><!-- /.top-navbar-inner -->
</div><!-- /.top-navbar -->
</div>
<!-- END TOP NAV -->
     {component name="/dashboard/menu"}

<!-- END SIDEBAR LEFT -->

      
      <!-- BEGIN PAGE CONTENT -->
      <div  class="page-content position-relative" style="">
        <div id="page-wrapper" class="container-fluid">          
         {include file="./dashboard_ajaxDashboard.tpl"}                 
        </div><!-- /.container-fluid -->
                        
        <!-- BEGIN FOOTER -->
        <footer class="bg-white">        
          {component name="/site_company/copyrights"}
        </footer>
        <!-- END FOOTER -->
        
        
      </div><!-- /.page-content -->
    </div><!-- /.wrapper -->
    <!-- END PAGE CONTENT -->
    
    
  
    <!-- BEGIN BACK TO TOP BUTTON -->
    <div id="back-top" style="display: none;">
      <a href="#top"><i class="fa fa-chevron-up"></i></a>
    </div>
    <!-- END BACK TO TOP -->
  

<div id="ascrail2000" class="nicescroll-rails" style="width: 0px; z-index: 10; cursor: default; position: fixed; top: 60px; left: 250px; height: 54px; opacity: 0;"><div style="position: relative; top: 0px; float: right; width: 0px; height: 314px; background-color: rgb(18, 18, 18); border: 0px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 0px;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails" style="height: 0px; z-index: 10; top: 114px; left: 0px; position: fixed; cursor: default; display: none; width: 250px; opacity: 0;"><div style="position: relative; top: 0px; height: 0px; width: 250px; background-color: rgb(18, 18, 18); border: 0px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 0px;"></div></div>


    <script type="text/javascript">

  $(document).ready(function() {

       $('.mydropdown').click(

             function(){ 
               /* $("#"+$(this).attr('data-id')).not($(this)).hide();*/
             $("#"+$(this).attr('data-id')).toggle();
           
         
              });


         $('#btn-collapse').click(
             function(){ 
              if ($('#sidebar').is(":visible") ) {
                $('#sidebar').css({
                       "left": "-250px"
                   });
                 $('.page-content').css({
                       "margin-left": "0px"
                   });
                 $(".top-navbar").removeClass("toggle");
              } else {
                $('#sidebar').css({
                       "left": "0px"
                   });
                  $('.page-content').css({
                       "margin-left": "250px"
                   });
                  $(".top-navbar").addClass("toggle");
              }
                $('#sidebar').toggle("slide");

              });

});
    </script>
  
    {component name="/utils_dropzone/resources" version="5.7.0"}
    {component name="/utils_colorpicker_light/resources"}    
    {component name="/utils_ckeditor/resources" version="4.14.1"}
</body>
</html>
    
