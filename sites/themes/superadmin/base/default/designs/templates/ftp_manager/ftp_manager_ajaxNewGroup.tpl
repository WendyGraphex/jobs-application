{messages}
<h3>{__("New FTP group")}</h3>
<div>
     <a href="#" id="Save" style="display:none"><img src="{url('/icons/save.gif','picture')}" alt="{__('Save')}"/>{__('Save')}</a>    
     <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('Cancel')}"/>{__('Cancel')}</a>
</div>   
<table cellspacing="0" cellpadding="0">
    <tr>
        <td> <label>{__('User system')}</label>
        </td>
        <td> 
            <div class="errors_settings">{$form.groupname->getError()}</div> 
            <input type="text" class="FtpManagerGroup" name="groupname" size="40" value="{$form.groupname}"/>
        </td>
    </tr>
    <tr>
        <td><label>{__('GID')}</label>
        </td>
        <td><div class="errors_settings">{$form.gid->getError()}</div>
           <input type="text" class="FtpManagerGroup" name="gid" size="10" value="{$form.gid}"/>  
        </td>
    </tr>
     <tr>
        <td>  <label>{__('Member')}</label>
        </td>
        <td>  <div class="errors_settings">{$form.members->getError()}</div>
              <input type="text" class="FtpManagerGroup" name="members" size="60" value="{$form.members}"/>
        </td>
    </tr>
</table>            
    <script type="text/javascript">
     
        $('#Cancel').click(function(){  return $.ajax2({ 
                    url: "{url_to('ftp_manager_ajax',['action'=>'ListPartialGroup'])}",
                    target: "#tab-panel-dashboard-superadmin-actions"}); });
         
        $(".FtpManagerGroup").click(function() { $("#Save").show(); });
        
      
        
        $('#Save').click(function(){ 
              var params= { FtpManagerGroup: { 
                              //  domain_id: $(".EmailManagerUser[name=domain_id] option:selected").val(),
                             //   quota_kb: $(".EmailManagerUser[name=quota_kb] option:selected").val(),
                                token :'{$form->getCSRFToken()}' 
                                } };
              $("input.FtpManagerGroup").each(function() { params.FtpManagerGroup[$(this).attr('name')]=$(this).val(); });     
              $("select.FtpManagerGroup option:selected").each(function() { params.FtpManagerGroup[$(this).parent().attr('name')]=$(this).val(); }); 
              return $.ajax2({ data: params, 
                               url: "{url_to('ftp_manager_ajax',['action'=>'NewGroup'])}",
                               target: "#tab-panel-dashboard-superadmin-actions"                            
                               }); 
        });  
      
</script>