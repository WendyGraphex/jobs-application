{stylesheets}
<div id="elfinder" width="100%" min-height="100%" height="100%">                
</div>
 <script type="text/javascript" charset="utf-8">
    {JqueryScriptsReady}   

        $('#elfinder').elfinder({
                            url : "{url_to('site_elfinder_connector')}", 
                            lang: '{$culture}',            
                            width : '100%',
                            height: $(window).height(),
                            }).elfinder('instance');   

    {/JqueryScriptsReady}    
</script>
