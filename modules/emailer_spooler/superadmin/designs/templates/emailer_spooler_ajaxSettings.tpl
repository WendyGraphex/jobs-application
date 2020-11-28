{messages class="Emailer-Spooler-errors"}
<h3>{__("Emailer spooler settings")}</h3>
<div>
    <a href="#" class="btn" id="Cancel" title="{__('Cancel')}" ><i class="fa fa-plus"></i>{__('Cancel')}</a>
    <a href="#"  class="btn" id="Settings-Save" style="display:none">   <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>{__('Save')}</a>    
</div>

<fieldset>
    <h3>{__('Options')}</h3>
    <div>
       <div class="errors_settings">{$form.number_of_emails->getError()}</div>
       <label>{__('Number of emails')}</label>
       <input type="text" class="Settings" name="number_of_emails" value="{$settings->get('number_of_emails')}"/>
    </div>    
</fieldset>

<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".Settings").click(function() {  $('#Settings-Save').show(); });    
    
     $("input.Settings").click(function(){         
           //  $(".errors").messagesManager('clear');
             $("#Settings-Save").show();        
     });
         
     $("select.Settings").change(function(){
          //  $(".errors").messagesManager('clear');
            $("#Settings-Save").show();        
     });

     {* =================== A C T I O N S ================================ *}
     
       $("#Cancel").click(function() {                 
               return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                         errorTarget: ".site-emailer-spooler-errors",
                         loading: "#tab-dashboard-superadmin-loading",                         
                         target: "#superadmin-actions"}); 
           });  
           
           
      $('#Settings-Save').click(function(){                             
            var  params= {                  
                                Settings: {                                   
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.Settings,select.Settings").each(function() { params.Settings[this.name]=$(this).val(); });     
        //      alert("Params="+params.toSource());   return ;         
          return $.ajax2({ data : params,                            
                            url: "{url_to('emailer_spooler_ajax',['action'=>'Settings'])}",
                            errorTarget: ".site-emailer-spooler-errors",
                            loading: "#tab-dashboard-superadmin-loading",
                            target: "#superadmin-actions" });
        });  
     
</script>
