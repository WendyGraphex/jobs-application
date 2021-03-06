<div class="EmployerProjectDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" data-id="{$document->get('id')}" {if $document->getProject()->isFirstUpload()}id="{$document->getProject()->get('id')}" name="id"{/if}>   
    <figure class="effect-text-in classBorderSolid">
        <div class="div-img h-100 dz-image">
            {if  $document->getFile()->isPicture()}
                <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
            {else}
                <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
            {/if}
        </div>
        <figcaption class="text-left">
            <div class="row">
                <div class="col-md-1">
                    <div class="pr-1">
                        <h6 class="PicturesCount">{$document->getProject()->getNumberOfDocuments()}</h6>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="pic-title text-left">
                        <h6 class="picture-title w-100">                                                                          
                            <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                        </h6>
                    </div>
                </div>
                <div class="col-md-1">
                    <div class="conf-icons">
                        <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action" id="EmployerProjectDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                    </div>
                </div>
            </div>            
        </figcaption> 
    </figure>        
</div> 
<script type="text/javascript">                  
   
  $("#EmployerProjectDocuments-Delete-{$document->get('id')}").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { EmployerProjectDocument : '{$document->get('id')}' },
                         url:"{url_to('employers_project_ajax',['action'=>'DeleteProjectDocument'])}",                                              
                         success : function () { 
                            $(".EmployerProjectDocuments-list[data-id={$document->get('id')}]").remove();
                            }
                          
                       });                      
     });            
</script>                  