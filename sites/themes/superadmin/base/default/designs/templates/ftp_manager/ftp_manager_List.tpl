<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>{header}    
{*    <script type="text/javascript" src="/superadmin/web/js/validation/localization/messages_{mfContext::getInstance()->getRequest()->getPreferredLanguage()}.js"></script> *}
    </head>
    <body>
        <div id="body">
            <div id="banner">{banner class="banner"}</div>
            <div id="top">{reference name="top"}</div>
            <div id="user">{reference name="user"}</div>
            {component name="/dashboard/sublink"}              
            <div style="height: 15px; width: 15px"><img id="loading" style="display:none;" src="{url('/icons/loader.gif','picture')}" alt="loader"/></div>
            <div id="middle"> 
                {include file="./ftp_manager_ajaxList.tpl"}
            </div>
            <div id="bottom"></div> 
        </div>
 
    </body>
</html>