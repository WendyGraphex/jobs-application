{messages class="site-errors"}
<h3>{__("Create password for user [%s]",(string)$user)}</h3>
<div>
    {if $user->isLoaded()}<a href="#" id="Save" class="btn" style="display:none">
             <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
             {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>{/if}
    <a href="#" id="Cancel" class="btn">
        <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
    
{if $user->isLoaded()} 
   <table class="tab-form" cellspacing="0">                
       <tr class="full-with">
             <td class="label">{__("Password")}</td>
             <td> 
                 <div class="error-form">{$form.password->getError()}</div> 
                 <input type="password" class="User" name="password" value="{$form.password}" size="30"/>{if $form->password->getOption('required')}*{/if}
             </td>
         </tr>
         <tr class="full-with">
             <td class="label">{__("Re-password")}</td>
             <td>
                <div class="error-form">{$form.repassword->getError()}</div>  
                <input type="password" class="User" name="repassword" value="{$form.repassword}" size="30"/>{if $form->repassword->getOption('required')}*{/if}
             </td>
         </tr>                              
    </table>  
{else}
    <span>{__("This user is invalid.")}</span>
{/if}

<script type="text/javascript">

        $('#Cancel').click(function(){ return $.ajax2({ 
                    url: "{url_to('users_ajax',['action'=>'ListPartialUser'])}",                 
                    target: "#actions" });
         });
         
         $(".User").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){ 
                  var params= { User: { 
                                        id: "{$user->get('id')}",                                       
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $("input.User").each(function() { params.User[this.name]=this.value; });                              
                  return $.ajax2({  data: params, 
                                    url: "{url_to('users_ajax',['action'=>'SaveCreatePasswordUser'])}",                           
                                    target: "#actions"}); 
         });
             
          
          
</script>