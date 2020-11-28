<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>{header}              
    </head>
    <body>
        <div id="body">
            <div id="banner"></div>
            <div id="top"></div>
            <div id="middle">
                <div id="content">
                    {__($page->get('content'),['uri'=>$uri])}
                </div>
            </div>
            <div id="bottom"></div> 
        </div>
    </body>    
</html>