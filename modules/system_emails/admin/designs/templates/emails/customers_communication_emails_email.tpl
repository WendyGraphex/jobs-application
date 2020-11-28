<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div id="body">
            <div id="header">
                  {if $company->hasHeader()}<img src='{$company->getHeader()->getUrl()}' alt="{$company->get('name')}"/>{/if}                
            </div>
            <div id="top">
            {if $company->hasPicture()}<img src='{$company->getPicture()->getUrl()}' alt="{$company->get('name')}"/>{/if}                
            </div>           
            <div id="middle">                                       
                  {eval $body}               
            </div>
            <div id="bottom">
             {if $company->hasFooter()}<img src='{$company->getFooter()->getUrl()}' alt="{$company->get('name')}"/>{/if}                
            </div>
        </div>
    </body>
</html>