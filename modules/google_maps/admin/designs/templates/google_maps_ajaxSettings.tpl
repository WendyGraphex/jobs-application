{component name="/site/sublink"} 
{messages class="site-errors"}
<h3>{__("Google Maps Settings")|capitalize}</h3>
<div>
     <a href="#" id="Save" style="display:none"><img src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>
     <a href="#" id="Cancel"><img src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')}</a>  
</div>   
<fieldset>
    <h3>{__('options')}</h3>
    <div>
       <div class="errors_settings">{$form.key->getError()}</div>
       <label>{__('key')}</label>
       <input type="text" class="settings" name="key" size="64" value="{$settings->get('key')}"/>
    </div>
</fieldset>
<script type="text/javascript">        
            
                 
         $("input.settings").click(function(){         
             $(".errors").messagesManager('clear');
             $("#Save").show();        
         });
         
         $("select.settings").change(function(){
            $(".errors").messagesManager('clear');
            $("#Save").show();        
         });
         
         $('#Save').click(function(){ 
          var  params= { Settings: {  token :'{$form->getCSRFToken()}' } };
              $("input.settings,select.settings,textarea.settings").each(function() { params.Settings[this.name]=$(this).val(); });                                         
              return $.ajax2({ data : params,                                 
                                   url: "{url_to('google_maps_ajax',['action'=>'Settings'])}",
                                   errorTarget: ".site-errors",
                                   target: "#tab-dashboard-x-settings"}); 
         });

        $('#Cancel').click(function(){ return $.ajax2({ url:"{url_to('site_ajax',['action'=>'Home'])}",
                                                        target: "#tab-dashboard-x-settings" 
                                                     }); 
        });
         
        
      
</script>