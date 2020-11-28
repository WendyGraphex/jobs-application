<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>{header}              
    </head>
    <body>
        <div id="body">
            <div id="banner">{banner class="banner"}</div>            
            <div id="top">{reference name="top"}</div>
            <div id="middle">
                DEFAULT THEME1 /CMS_pages
                <div id="content">{eval $page->get('content')}</div>
            </div>
            <div id="bottom">{reference name="bottom"}</div> 
            {component name="/CMS_pages/sublinks"} 
        </div>      
       
    </body>    
</html>