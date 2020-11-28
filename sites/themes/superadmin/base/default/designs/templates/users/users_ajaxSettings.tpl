{component name="/site/sublink"} 
{messages class="{$site->getSiteID()}-errors"}
<h3>{__("User settings")}</h3>
<div>
    <a href="#" id="{$site->getSiteID()}-Settings-Save" class="btn" style="display:none"><i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
        {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>    
</div>
<fieldset>
    <legend><h3>{__('Team')}</h3></legend>     
    <div>                        
       <div class="errors_settings">{$form.has_manager2->getError()}</div>     
       <label>{__('Manager 2')}</label>    
         <input type="checkbox" class="Settings" name="has_manager2" value="{$settings->get('has_manager2')}" {if $settings->get('has_manager2')=='YES'}checked="checked"{/if}/>            
    </div>  
</fieldset>

<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".{$site->getSiteID()}-Settings").click(function() {  $('#{$site->getSiteID()}-Settings-Save').show(); });    
    
     $("input.Settings").click(function(){         
           //  $(".errors").messagesManager('clear');
             $("#{$site->getSiteID()}-Settings-Save").show();        
     });
         
     $("select.Settings").change(function(){
          //  $(".errors").messagesManager('clear');
            $("#{$site->getSiteID()}-Settings-Save").show();        
     });

     {* =================== A C T I O N S ================================ *}
     
      
      $('#{$site->getSiteID()}-Settings-Save').click(function(){                             
            var  params= {                  
                                Settings: {                                   
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.Settings,select.Settings").each(function() { params.Settings[this.name]=$(this).val(); });     
          $("input.Settings[type=checkbox]").each(function() { params.Settings[this.name]=$(this).is(':checked'); }); 
        //      alert("Params="+params.toSource());   return ;         
          return $.ajax2({ data : params,                            
                           url: "{url_to('users_site_ajax',['action'=>'Settings'])}",
                           errorTarget: ".{$site->getSiteID()}-errors",
                           target: "#tab-{$site->getSiteID()}-dashboard-site-x-settings"}); 
        });  
     
</script>
