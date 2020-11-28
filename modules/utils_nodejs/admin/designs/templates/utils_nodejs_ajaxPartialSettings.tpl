{messages}
<h3>{__("Settings")}</h3>
<div>
    <a href="#" id="Save" class="btn btn-primary" style="display:none">
        <i class="fa fa-save" style=" margin-right: 10px"></i>{__('Save')}</a>   
        
   <a href="#" id="Start" class="btn btn-primary">
        <i class="fa fa-play" style=" margin-right: 10px"></i>{__('Start')}</a>   
        
    <a href="#" id="Stop" class="btn btn-primary">
        <i class="fa fa-stop" style=" margin-right: 10px"></i>{__('Stop')}</a>   
     <a href="#" id="Log" class="btn btn-default">
        <i class="fa fa-cog" style=" margin-right: 10px"></i>{__('Log')}</a>   
</div>   

<fieldset>        
    <table class="tab-form">            
        <tr class="full-with">
            <td class="label">
                {__('NodeJs')}
            </td>
            <td>             
                <input type="text"  readonly="" name="nodejs" size="20" value="{$settings->get('nodejs')}"/>
            </td>                           
        </tr>   
         <tr class="full-with">
            <td class="label">
                {__('Protocol')}
            </td>
            <td>   
                <div class="error-form">{$form.protocol->getError()}</div>
                {html_options  class="Settings Select" name="protocol" options=$form->protocol->getOption('choices') selected=$settings->get('protocol')}
            </td>                           
        </tr>
                <tr class="full-with">
            <td class="label">
                {__('Port')}
            </td>
            <td>
                <div class="error-form">{$form.port->getError()}</div>
                <input type="text" class="Settings Input" name="port" size="20" value="{$settings->get('port')}"/>
            </td>                           
        </tr> 
        <tr class="full-with">
            <td class="label">
                {__('PID')}
            </td>
            <td>               
                <input disabled="" type="text"  name="pid" size="20" value="{$settings->get('pid')}"/>
            </td>                           
        </tr> 
{*        <tr class="full-with">
            <td class="label">
                {__('Socket Host')}
            </td>
            <td>   
                <div class="error-form">{$form.host->getError()}</div>
                <input type="text" class="Settings Input"  name="host" size="20" value="{$settings->get('host')}"/>
            </td>                           
        </tr> *}
        <tr class="full-with">
            <td class="label">
                {__('Debug')}
            </td>
            <td>   
                <div class="error-form">{$form.debug->getError()}</div>
                {html_options  class="Settings Select" name="debug" options=$form->debug->getOption('choices') selected=$settings->get('debug')}
            </td>                           
        </tr> 
    </table>
</fieldset> 
 

<script type="text/javascript">        
            
   
                 
         $(".Settings.Input,.Settings.Checkbox,.Settings.Select,.Settings.Multiple").click(function(){         
             $(".errors").messagesManager('clear');
             $("#Save").show();        
         });
         
         $(".Settings.Select,.Settings.Multiple").change(function(){
            $(".errors").messagesManager('clear');
            $("#Save").show();        
         });
         
         $('#Save').click(function(){ 
          var  params= { Settings: {  token :'{$form->getCSRFToken()}' } };
          $(".Settings.Input").each(function(id) { params.Settings[this.name]=$(this).val(); });                             
          $(".Settings.Checkbox:checked").each(function(id) { params.Settings[this.name]=$(this).val(); });                             
          $(".Settings.Select option:selected").each(function() { params.Settings[$(this).parent().attr('name')]=$(this).val(); });                                                                  
             return $.ajax2({ data : params,                                                      
                           url: "{url_to('utils_nodejs_ajax',['action'=>'PartialSettings'])}",
                           target: "#actions" 
                    }); 
         });

       $('#Start').click(function(){ 
             return $.ajax2({  url: "{url_to('utils_nodejs_ajax',['action'=>'StartNodeJs'])}",
                        success : function (resp)
                        {
                                $("[name=pid]").val(resp.pid);
                        }
                    }); 
         });
         
           $('#Stop').click(function(){                       
             return $.ajax2({  url: "{url_to('utils_nodejs_ajax',['action'=>'StopNodeJs'])}",
                          success : function (resp)
                        {
                                $("[name=pid]").val('');
                        } 
                    }); 
         });
         
           $('#Log').click(function(){                       
             return $.ajax2({  url: "{url_to('utils_nodejs_ajax',['action'=>'ViewLog'])}",
                          target: "#actions" 
                    }); 
         });
</script>