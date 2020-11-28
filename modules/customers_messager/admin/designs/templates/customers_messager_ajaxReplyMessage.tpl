{alerts}
{if $message->isLoaded()}
  <div id="DropZone" class="form-group dropzone">        
    <div class="tab-content">   
        <div class="form-group">     
             
    {if $message->isEmployeeSender()}
    <span>{__('Reply to message from [%s] on [%s]',[(string)$message->getEmployeeUser(),$message->getFormatter()->getCreatedAt()->getText()])}</span>
    {elseif $message->isEmployerSender()}
    <span>{__('Reply to message from [%s] on [%s]',[(string)$message->getEmployerUser(),$message->getFormatter()->getCreatedAt()->getText()])}</span>
    {else}
      <span>{__('Reply to message from Administrator on [%s]',$message->getFormatter()->getCreatedAt()->getText())}</span>
      {/if}
        </div>
      <div class="form-group">    
      <input class="form-control Fields CustomerMessage Input" name="subject" type="text" placeholder="{__('Subject')}" value="{$item->get('subject')|escape}"/>
      </div>
      <div class="form-group">    
        <textarea class="form-control CustomerMessage Input" name="message" cols="40" placeholder="{__('Message')}" rows="10">{$item->get('message')|escape}</textarea>
      </div>
    </div>
      <div id="files-message-ctn"></div>                  
                           
    <div class="form-group text-center">
                <button class="btn btn-primary" id="Send" >
                    {__('Send')}</button>
            </div> 
</div>                    
{else}
    {__('Message is invalid')}
{/if}    

<script type="text/javascript">                    
         
      
         
    {*  if ($("#DropZone").find('.dz-default').length)
              $("#DropZone")[0].dropzone.off().destroy();
         var params = { 
                        "CustomerEmployeeMessage[parent_id]" :  '{$message->get('id')}',
                        "CustomerEmployeeMessage[token]" :  '{mfForm::getToken('CustomerMessageUploadFileForm')}'                      
                      };                               
          $("#DropZone").dropzone({
            url: "{url_to("customers_messager_ajax",['action'=>'UpLoadFileForMessage'])}",
            clickable: true,
            timeout : 0,
            createImageThumbnails : false,           
            params: params,   
            paramName: "CustomerEmployeeMessage[file]",
            parallelUploads : 2,
            maxFiles : 5,
            maxFilesize : 16,   
            sending : function (file, xhr, formData) {                 
                if ($("#Message").attr('id'))                   
                    formData.append("CustomerMessage[id]" ,$("#Message").attr('data-id'));
                formData.append("CustomerMessage[subject]" ,$(".CustomerMessage[name=subject]").val());
                formData.append("CustomerMessage[message]" ,$(".CustomerMessage[name=message]").val());
            }, 
            error : function (xhr,errorMessage) {
               // alert("ERROR");
               //  console.log('ERROR',xhr,errorMessage);
              //  dropzone.instance.destroy();
            },           
            success : function (file,response)
            {              
               //  console.log("Status="+response.status);
                 if (response.errors || response.status)
                 {
                     return ;
                 }                                                                    
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                $("#files-message-ctn").html(response); 
            },          
        });  *}     
        
        $("#Send").click(function () { 
            var params = { CustomerMessage : { id : $("#Message").attr('data-id'), parent_id :'{$message->get('id')}', token :'{mfForm::getToken('CustomerMessageNewForm')}' } };
            $(".CustomerMessage.Input").each(function () { params. CustomerMessage[$(this).attr('name')]=$(this).val(); });
            return $.ajax2({      data :params,
                                  url :"{url_to('customers_messager_ajax',['action'=>'SendMessage'])}",                                                                
                                  success: function (resp) 
                                        { 
                                            if (resp.errors && resp.action=='SendMessage')
                                            {
                                                
                                                return ;
                                            }
                                            $("#Modal-Message").hide(); 
                                            $("#actions").html(resp);
                                        }
                     });   
        });
</script> 
 
