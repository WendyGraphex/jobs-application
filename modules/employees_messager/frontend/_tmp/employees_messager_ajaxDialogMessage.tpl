<div class="ModalMessage modal-dialog modal-lg" style="width: 50%;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="ModalMakeOffer-close close" data-dismiss="modal">&times;</button>
        </div>              
        <div class="modal-body">
            {__('Send a message to')}
           <img height="32px" src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
            {$item->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}
            <div id="DropZone" class="form-group dropzone" style="padding: 20px;">        
              <div class="tab-content">   
                   
                <div class="form-group">    
                <input class="form-control Fields CustomerEmployeeMessage Input" name="subject" type="text" placeholder="{__('Subject')}"/>
                </div>
                <div class="form-group">    
                  <textarea class="CustomerEmployeeMessage Input" name="message" cols="40" placeholder="{__('Message')}" rows="10"></textarea>
                </div>
              </div>
                <div id="files-message-ctn"></div>                  

              <div class="form-group text-center">

                          <button class="btn btn-primary" id="Send" >
                              {__('Send')}</button>
                              <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>
                      </div> 
          </div>    
        </div>
      </div>
</div>  


<script type="text/javascript">                    
         
          
         if ($("#DropZone").find('.dz-default').length)
              $("#DropZone")[0].dropzone.off().destroy();
         var params = {                               
                        "CustomerEmployeeMessage[token]" :  '{mfForm::getToken('CustomerEmployeeMessageUploadFileForm')}'                      
                      };                               
          $("#DropZone").dropzone({
            url: "{url_to("employers_messager_ajax",['action'=>'UpLoadFileForMessage'])}",
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
            var params = { CustomerEmployeeMessage : { employer_id : '{$item->getEmployerUser()->get('id')}', id : $("#Message").attr('data-id'), token :'{mfForm::getToken('CustomerEmployeeMessageToEmployerNewForm')}' } };
            $(".CustomerEmployeeMessage.Input").each(function () { params. CustomerEmployeeMessage[$(this).attr('name')]=$(this).val(); });
            return $.ajax2({      data :params,
                                  url :"{url_to('employees_messager_ajax',['action'=>'SendMessageToEmployer'])}",                                                                
                                  success: function (resp) 
                                        { 
                                            if (resp.errors && resp.action=='SendMessageToEmployer')
                                            {
                                                $('.Input').keyup(function () { 
                                                    $(".CustomerEmployeeMessage").removeClass('intro');
                                                });
                                                $.each(resp.errors,function (name,error) { $(".CustomerEmployeeMessage[name="+name+"]").addClass('intro'); });
                                                return ;
                                            }
                                            $("#Modal-Message").hide(); 
                                            $("#actions").html(resp);
                                        }
                     });   
        });
</script> 