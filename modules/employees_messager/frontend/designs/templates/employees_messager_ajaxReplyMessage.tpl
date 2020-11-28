{alerts}
{if $message->isLoaded()}
  <div id="DropZone" class="form-group dropzone">        
    <div class="tab-content">   
        <div class="form-group">     
    {if $message->isEmployerSender()}
    <span>{__('Reply to message from [%s] on [%s]',[(string)$message->getEmployerUser(),$message->getFormatter()->getCreatedAt()->getText()])}</span>
    {else}
      <span>{__('Reply to message from Administrator on [%s]',$message->getFormatter()->getCreatedAt()->getText())}</span>
      {/if}
        </div>
      <div class="form-group">    
      <input class="form-control Fields CustomerEmployeeMessage Input" name="subject" type="text" placeholder="{__('Subject')}" value="{$item->get('subject')|escape}"/>
      </div>
      <div class="form-group">    
        <textarea class="form-control CustomerEmployeeMessage Input" name="message" cols="40" placeholder="{__('Message')}" rows="10">{$item->get('message')|escape}</textarea>
      </div>
    </div>
      <div id="files-message-ctn"></div>                  
                           
    <div class="form-group text-center">
                <button class="btn btn-primary" id="Send" >
                    {__('Send')}</button>
                    <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>
            </div> 
</div>                    
{else}
    {__('Message is invalid')}
{/if}    

<script type="text/javascript">                    
         
         $("#Modal-Message-Close").click(function () {  $("#Modal-Message").hide();   });
         
         if ($("#DropZone").find('.dz-default').length)
              $("#DropZone")[0].dropzone.off().destroy();
         var params = { 
                        "CustomerEmployeeMessage[parent_id]" :  '{$message->get('id')}',
                        "CustomerEmployeeMessage[token]" :  '{mfForm::getToken('CustomerEmployeeMessageUploadFileForm')}'                      
                      };                               
          $("#DropZone").dropzone({
            url: "{url_to("employees_messager_ajax",['action'=>'UpLoadFileForMessage'])}",
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
                    formData.append("CustomerEmployeeMessage[id]" ,$("#Message").attr('data-id'));
                formData.append("CustomerEmployeeMessage[subject]" ,$(".CustomerEmployeeMessage[name=subject]").val());
                formData.append("CustomerEmployeeMessage[message]" ,$(".CustomerEmployeeMessage[name=message]").val());
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
        });       
        
        $("#Send").click(function () { 
            var params = { CustomerEmployeeMessage : { id : $("#Message").attr('data-id'), parent_id :'{$message->get('id')}', token :'{mfForm::getToken('CustomerEmployeeMessageNewForm')}' } };
            $(".CustomerEmployeeMessage.Input").each(function () { params. CustomerEmployeeMessage[$(this).attr('name')]=$(this).val(); });
            return $.ajax2({      data :params,
                                  url :"{url_to('employees_messager_ajax',['action'=>'SendMessage'])}",                                                                
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
 
