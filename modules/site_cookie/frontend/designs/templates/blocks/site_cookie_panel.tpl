<div class="cookies-panel" id="cookie-ctn">
    <a href="{link_i18n("site_cookies")}" style="color: white !important;font-size: 17px;padding: 13px;line-height: 40px;">{__('More information about cookies')}</a>
<button id="cookie-ok" class="btn btn-primary">{__('ok')}</button>

{*<span class="w3-button w3-display-topright close">&times;</span>*}


</div>
<script type="text/javascript">              
 
    {JqueryScriptsReady}
        $('#cookie-ok').click(function(){                                         
          return $.ajax2({ url: "{url_to('site_cookie_ajax',['action'=>'Ack'])}", 
                           success : function () {   
                              $('#cookie-ctn').remove();  
                           } 
                       }); 
        });                 
     
    {/JqueryScriptsReady}
</script>


