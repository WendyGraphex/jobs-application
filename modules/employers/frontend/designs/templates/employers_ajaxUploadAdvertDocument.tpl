 <div class="EmployerDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 stretch-card" data-id="{$document->get('id')}" {if $document->getAdvert()->isFirstUpload()}id="{$document->getAdvert()->get('id')}" name="id"{/if}>   
    <figure class="effect-text-in classBorderSolid">
        <div class="div-img h-100 dz-image">
           {if  $document->getFile()->isPicture()}
            <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
            {else}
                <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
            {/if}
             <label class="PublicPrivate btn btn-success" id="EmployerAdvertDocumentPublic-Text-{$document->get('id')}"  {if !$document->isOpened()}style="display:none"{/if}>{__('Public')}</label>
            <label class="PublicPrivate btn btn-danger" id="EmployerAdvertDocumentPrivate-Text-{$document->get('id')}"  {if $document->isOpened()}style="display:none"{/if}>{__('Private')}</label>
            <div class="dropdown DropPublicPrivate">
                <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                    <li><a href="javascript:void();" id="EmployerAdvertDocumentPublic-btn-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                    <li><a href="javascript:void();" id="EmployerAdvertDocumentPrivate-btn-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                </ul>
            </div> 
        </div>
        <figcaption class="text-left">
            <div class="row">
                <div class="col-md-1">
                    <div class="pr-1">
                        <h6 class="PicturesCount">{$document->getAdvert()->getNumberOfDocuments()}</h6>
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
                        <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action" id="EmployerDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                    </div>
                </div>
            </div>
            
            
            
            
                {*<div class="pr-1">
                    <h6 class="PicturesCount">{$document->getAdvert()->getNumberOfDocuments()}</h6>
                </div>
                <div class="pic-title text-left">
                   <h6 class="picture-title w-100">                                                                          
                     <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                  </h6>
              </div>
              <div class="conf-icons">
                  <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action" id="EmployerDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
              </div>*}
            </figcaption> 
    </figure>        
</div> 
<script type="text/javascript">                  
   
  $("#EmployerDocuments-Delete-{$document->get('id')}").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { EmployerAdvertDocument : '{$document->get('id')}' },
                         url:"{url_to('employers_ajax',['action'=>'DeleteAdvertDocument'])}",                                              
                         success : function () { 
                            $(".EmployerDocuments-list[data-id={$document->get('id')}]").remove();
                            }
                          
                       });                      
     });        
 


$("#EmployerAdvertDocumentPublic-btn-{$document->get('id')}").click(function () {                     
           return $.ajax2({      
                          data : { EmployerAdvertDocument : '{$document->get('id')}' },
                         url:"{url_to('employers_ajax',['action'=>'PublicAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PublicAdvertDocument') return ;
                                $("#EmployerAdvertDocumentPrivate-btn-{$document->get('id')}").show();
                                $("#EmployerAdvertDocumentPublic-btn-{$document->get('id')}").hide(); 
                                $("#EmployerAdvertDocumentPrivate-Text-{$document->get('id')}").hide();
                                $("#EmployerAdvertDocumentPublic-Text-{$document->get('id')}").show(); 
                            }                          
                       });                      
     });   
     
     $("#EmployerAdvertDocumentPrivate-btn-{$document->get('id')}").click(function () {                     
           return $.ajax2({      
                          data : { EmployerAdvertDocument : '{$document->get('id')}' },
                         url:"{url_to('employers_ajax',['action'=>'PrivateAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PrivateAdvertDocument') return ;
                                $("#EmployerAdvertDocumentPrivate-btn-{$document->get('id')}").hide();
                                $("#EmployerAdvertDocumentPublic-btn-{$document->get('id')}").show(); 
                                $("#EmployerAdvertDocumentPrivate-Text-{$document->get('id')}").show();
                                $("#EmployerAdvertDocumentPublic-Text-{$document->get('id')}").hide();    
                            }                          
                       });                      
     });   
</script>                  