<!DOCTYPE html>
<html lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />             
                <link rel="stylesheet" href="web/css/bootstrap.min.css" />
                <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		 <link rel="stylesheet" href="web/css/owl.carousel.css" />
                 <link rel="stylesheet" href="web/css/owl.theme.css" />
                <link rel="stylesheet" href="web/css/main2.css" />
               
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        {header}
         <script src="web/js/owl.carousel.min.js"></script> 
         <script src="web/js/jquery.sticky.js"></script>         
    </head>
    <body class="homepage">
        <div id="body">                           
           <div id="page-wrapper">	                             
                        <div id="header-sticky-wrapper" class="sticky-wrapper">
				<nav id="nav">                                    
                                   {* <img class="logo" src="/web/pictures/logologin.png"> *}
                                   {if $_request->getSite()->getSite()->hasLogo()}
                                        <img  class="logo" src="{$_request->getSite()->getSite()->getLogo()->getUrl()}"/>
                                   {/if}  
                                                        
					
                                   <div class="incriptionBtn">      
                            {*component name="/projects_managers/loginLink"*}
                           {*component name="/employees/loginLink"*}                            
                        </div>
				</nav>    
                        </div>
 <div id="owl-demo" class="owl-carousel">
    
     <div class="item">     
         <img class="index-img" src="web/pictures/banner.jpg"   border="0" alt="" />

{*         {if $_request->getSite()->getSite()->hasPicture()}
            <img class="index-img"  src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/>
         {else}
             <img class="index-img" src="web/pictures/banner1.png"   border="0" alt="" />
         {/if}    *}      
     </div> <!-- This is the last image in the slideshow -->
       
  
</div>
     
    
			<!-- Footer -->
				<footer id="footer" class="container">
					
					<!-- Copyright -->
						<div id="copyright">
							<ul class="menu">
								<li>&copy; {__('All rights reserved')}</li>
                                                                <li></li>
							</ul>
						</div>

				</footer>

			</div>
                             
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">                        
                        <div id="left">{reference name="left"}                        
                        </div> 
                    </td>
                    <td>
                       
                    </td>
                    <td>
                        <div id="left">{reference name="right"}</div>  
                    </td>
                </tr>
            </table>                     
            <div id="bottom">              
            </div>                     
        </div>  
                    
                    
                    <script>
  $(document).ready(function() {

  $("#owl-demo").owlCarousel({

      autoPlay: 3000, //Set AutoPlay to 3 seconds

      items : 1,
      itemsDesktop : [1199,5],
      itemsDesktopSmall : [979,3]

  });

});
</script>
    </body>
</html>
