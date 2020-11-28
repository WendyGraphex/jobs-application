{messages}
<h3>{__("New FTP account")}</h3>
<div>
     <a href="#" id="Save" style="display:none"><img src="{url('/icons/save.gif','picture')}" alt="{__('Save')}"/>{__('Save')}</a>    
     <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('Cancel')}"/>{__('Cancel')}</a>
</div>   
<table cellspacing="0" cellpadding="0">
     <tr>
        <td>  <label>{__('User')}</label>
        </td>  
        <td>
       <div class="errors_settings">{$form.userid->getError()}</div>      
       {html_options name="userid" class="FtpManagerUser" options=$form->userid->getOption('choices') selected=(string)$form.userid}
       </td>
    </tr>
     <tr>
        <td>  <label>{__('Home directory')}</label>
        </td>  
        <td>
            <div>/home/[user]/www/sites/themes/xxxx</div>
       <div class="errors_settings">{$form.homedir->getError()}</div>      
      <input type="text" class="FtpManagerUser" name="homedir" size="100" value="{$form.homedir}"/>
       </td>
    </tr>
    <tr>
        <td>  <label>{__('Password')}</label>
        </td>  
        <td>
       <div class="errors_settings">{$form.passwd->getError()}</div>      
       <input type="password" class="FtpManagerUser" name="passwd" size="30" value=""/>
       </td>
    </tr>
    <tr>
       <td><label>{__('Re-Password')}</label>
       </td>
       <td>
        <div class="errors_settings">{$form.repassword->getError()}</div>       
        <input type="password" class="FtpManagerUser" name="repassword" size="30" value=""/>
        </td>
    </tr>
</table>
    <script type="text/javascript">
     
        $('#Cancel').click(function(){  return $.ajax2({ url: "{url_to('ftp_manager_ajax',['action'=>'ListPartial'])}",
                        target: "#tab-panel-dashboard-superadmin-actions"}); });
         
        $(".FtpManagerUser").click(function() { $("#Save").show(); });
        
      
        
        $('#Save').click(function(){ 
              var params= { FtpManagerUser: { 
                              //  domain_id: $(".EmailManagerUser[name=domain_id] option:selected").val(),
                             //   quota_kb: $(".EmailManagerUser[name=quota_kb] option:selected").val(),
                                token :'{$form->getCSRFToken()}' 
                                } };
              $("input.FtpManagerUser").each(function() { params.FtpManagerUser[$(this).attr('name')]=$(this).val(); });     
              $("select.FtpManagerUser option:selected").each(function() { params.FtpManagerUser[$(this).parent().attr('name')]=$(this).val(); }); 
              return $.ajax2({ data: params, 
                               url: "{url_to('ftp_manager_ajax',['action'=>'NewUser'])}",
                               target: "#tab-panel-dashboard-superadmin-actions"                            
                               }); 
        });  
      
</script>