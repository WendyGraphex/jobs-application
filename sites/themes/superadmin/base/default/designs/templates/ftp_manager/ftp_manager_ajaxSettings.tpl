{messages class="errors"}
<h3>{__("Settings FTP manager")}</h3>
<div>
     <a href="#" id="Save" style="display:none"><img src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>    
      <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('Cancel')}"/>{__('Cancel')}</a>
</div>   
<fieldset>   
    <div>       
       <div class="errors_settings">{$form.db_host->getError()}</div>
       <label>{__('Host')}</label>
       <input type="text" class="Settings" name="db_host" size="50" value="{$settings->get('db_host')}"/>
    </div>   
    <div>       
       <div class="errors_settings">{$form.db_database->getError()}</div>
       <label>{__('Database')}</label>
       <input type="text" class="Settings" name="db_database" value="{$settings->get('db_database')}"/>
    </div> 
    <div>       
       <div class="errors_settings">{$form.db_login->getError()}</div>
       <label>{__('Login')}</label>
       <input type="text" class="Settings" name="db_login" value="{$settings->get('db_login')}"/>
    </div>
     <div>       
       <div class="errors_settings">{$form.db_password->getError()}</div>
       <label>{__('Password')}</label>
       <input type="text" class="Settings" name="db_password" value=""/>
    </div>
</fieldset>

    
<script type="text/javascript">      
    
          $('#Cancel').click(function(){  return $.ajax2({ url: "{url_to('ftp_manager_ajax',['action'=>'ListPartial'])}",
                                target: "#tab-panel-dashboard-superadmin-actions"}); });
           
          
         $("input.Settings").click(function(){         
             $(".errors").messagesManager('clear');
             $("#Save").show();        
         });
         
         $("select.Settings").change(function(){
            $(".errors").messagesManager('clear');
            $("#Save").show();        
         });
         
         $('#Save').click(function(){ 
           var  params= { Settings: {  token :'{$form->getCSRFToken()}' } };       
           $("input.Settings[type=text],select.Settings").each(function() { params.Settings[this.name]=$(this).val(); });     
           $("input.Settings[type=checkbox]").each(function() { params.Settings[this.name]=$(this).is(':checked'); }); 
           return $.ajax2({ data : params,
                            url: "{url_to('ftp_manager_ajax',['action'=>'Settings'])}",
                            target: "#tab-panel-dashboard-superadmin-actions"}); 
         });      
     
</script>