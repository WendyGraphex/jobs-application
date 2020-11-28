<div id="Message" data-id="{$form->getMessage()->get('id')}">
    {foreach $form->getMessage()->getFiles() as $file}
        <div class="CustomerMessageFile" id="{$file->get('id')}">            
            <img src="{url("/icons/files/`$file->get('extension')`.gif",'picture')}"/>
            {$file->get('file')} ({$file->getSize()->getFilesize()})
            <a href="#" class="CustomerMessageFile-Delete" id="{$file->get('id')}"><i class="fa fa-trash"></i></a>
        </div>
     {/foreach}    
</div>
 <script type="text/javascript"> 
     
     $(".CustomerMessageFile-Delete").click( function () {                 
                return $.ajax2({ data :{ EmployerMessageFile: $(this).attr('id') },
                                 url :"{url_to('employers_messager_ajax',['action'=>'DeleteFile'])}",                                                               
                                 success: function (resp) 
                                 { 
                                      if (resp.action !='DeleteFile') return ;
                                      $(".CustomerMessageFile[id="+resp.id+"]").remove();
                                 }
                     });                                        
            });  
            
</script>
