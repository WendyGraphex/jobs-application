<!doctype html>
<html lang="{$_request->getCountry()}">
<head>
    {header}
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"  media="screen" href="/web/css/responsiveslides.css" type="text/css" />
	<!-- theme css -->
	<link rel="stylesheet" href="/web/css/supersized.shutter.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="/web/css/font-awesome.min.css" type="text/css" media="screen" />
</head>

<body>
<div id="boddy">
<!-- First Part Start Left Menu -->
<div class="col-md-12 bodyContent">
<div class=" pageBlock  col-md-6 col-sm-12 col-xs-12">
<div class="pageText">
    <div id="closeBlock"><i class="fa fa-close"></i></div>
{component name="/customers_contacts/contactForm" url=$page->getURL()}
</div>
</div>
{component name="/CMS_pages/pageDisplay" page='header_right' tpl="header_right.tpl"}
</div>
<div style="clear:both"></div>
<!-- Third Part start footer -->
<!--  /body -->

</div> 
<!-- end of start footer -->	
<!-- Les fichiers du JS -->
<script type="text/javascript" src="/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/web/js/jquery.easing.min.js"></script>
 {component  name="/gallery/picturesGalleryDisplayFromName" id="Home" theme="dark"}
<script type="text/javascript" src="/web/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/web/js/app.js"></script>
{component name="/google_analytics/tag"}
</body>
</html>
