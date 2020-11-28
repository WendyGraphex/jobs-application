<!DOCTYPE html>
<html lang="{$_request->getCountry()}">
    <head>{header}</head>
    <body>
        <div id="body">
             <div id="banner">{banner class="banner"}</div>
            <div id="top">{reference name="top"}</div>
            <div id="middle">
                {__("Error 401 : You don't have credentials to access to this page")}
            </div>
            <div id="bottom">
            </div>
        </div>
        
    </body>
</html>