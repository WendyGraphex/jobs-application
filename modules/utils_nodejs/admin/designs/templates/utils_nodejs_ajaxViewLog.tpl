{messages}
<h3>{__("View log")}</h3>

<div>  
    <a href="#" id="Cancel" class="btn btn-primary"><i class="fa fa-times"></i>{__('Cancel')}</a>
</div>
 <div>
     {if $settings->getLogFile()->isExist()}
        <textarea rows="40" cols="100%">{$settings->getLogFile()->getContent()}</textarea>
     {else}
         {__("Log doesn't exist.")}
     {/if}    
 </div>         
    
<script type="text/javascript">
  
   
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({  url: "{url_to('utils_nodejs_ajax',['action'=>'PartialSettings'])}",                                          
                              target: "#actions"}); 
      });
      
    
</script>
  
