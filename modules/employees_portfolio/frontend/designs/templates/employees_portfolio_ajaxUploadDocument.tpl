 <div class="Documents col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card" id="{$document->get('id')}">
<div class="card classMargin classBorderSolid" style="border-radius: 10px;">
            <div class="effect-text-in" style="border: none !important;height: 170px;">
              {*  <img class="img-dpzone img-product" src="{$document->getFile()->getUrl()}" alt="">  *}
                {if  $document->getFileManager()->isPicture()}
                <img class="img-dpzone img-product" src="{$document->getFileManager()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                {else}
                    <img class="img-dpzone img-product" src="{$document->getFileManager()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                {/if}
                
                <label class="PublicPrivate btn btn-success EmployeePortfolioDocumentPublic-Text-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Public')}</label>
                <label class="PublicPrivate btn btn-danger EmployeePortfolioDocumentPrivate-Text-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Private')}</label>
                <div class="dropdown DropPublicPrivate">
                    <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                    <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                        <li><a href="javascript:void();" class="EmployeePortfolioDocumentPublic-btn-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                        <li><a href="javascript:void();" class="EmployeePortfolioDocumentPrivate-btn-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                    </ul>
                </div> 
             </div>
            <figcaption class="text-left">
                <div class="row" style="padding: 4px;">
                    <div class="col-md-1">
                        <div class="pr-1">
                            <h6 class="EmployeePortfolioDocument-count"></h6>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="pic-title text-left">
                            <h6 class="picture-title w-100">                                                                          
                              <span class="picture-title"><a href="{$document->getFileManager()->getUrl()}" target="_blank">{$document->get('file')} - {$document->getFormatter()->getFile()->getFilesize()}</a></span>                    
                           </h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="conf-icons">
                            <a href="javascript:void(0);" name="{$document->get('file')}" class="list-action" id="EmployerPortfolioDocument-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                        </div>
                        <a href="javascript:void(0);" name="{$document->get('is_active')}" class="list-action" id="EmployerPortfolioDocument-IsActive-{$document->get('id')}" title="{__('Active')}"><i class="fa fa-circle" style="color:{if $document->isActive()}green{else}red{/if}"></i></a>
                        <a href="javascript:void(0);" name="{$document->get('file')}" class="list-action" Openmodal" id="EmployerPortfolioDocument-View-{$document->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil"></i></a>
                    </div>
                </div>
            </figcaption> 
        </div>
 </div>
<script type="text/javascript">
       $(".EmployeePortfolioDocument-count").each(function (id) { $(this).html(id+1); })
    
       $("#EmployeePortfolioDocumentPublic-btn-{$document->get('id')}").click(function () {     
           return $.ajax2({      
                          data : { EmployeePortfolioDocument : '{$document->get('id')}' },
                          url:"{url_to('employees_portfolio_ajax',['action'=>'PublicDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PublicDocument') return ;
                                $(".EmployeePortfolioDocumentPrivate-btn[id={$document->get('id')}]").show();
                                $(".EmployeePortfolioDocumentPublic-btn[id={$document->get('id')}]").hide(); 
                                $(".EmployeePortfolioDocumentPrivate-Text[id={$document->get('id')}]").hide();
                                $(".EmployeePortfolioDocumentPublic-Text[id={$document->get('id')}]").show(); 
                            }                          
                       });                      
     });     
     
     $("#EmployeePortfolioDocumentPrivate-btn--{$document->get('id')}").click(function () {     
           return $.ajax2({      
                          data : { EmployeePortfolioDocument : $(this).attr('id') },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'PrivateDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PrivateDocument') return ;
                                $(".EmployeePortfolioDocumentPrivate-btn[id={$document->get('id')}]").hide();
                                $(".EmployeePortfolioDocumentPublic-btn[id={$document->get('id')}]").show(); 
                                $(".EmployeePortfolioDocumentPrivate-Text[id={$document->get('id')}]").show();
                                $(".EmployeePortfolioDocumentPublic-Text[id={$document->get('id')}]").hide();    
                            }                   
                       });                      
     }); 
     
     
      $("#EmployerPortfolioDocument-Delete-{$document->get('id')}").click(function () { 
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format("{$document->get('file')}"))) return false;    
          return $.ajax2({      
                         data : { EmployeePortfolioDocument : '{$document->get('id')}' },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'DeleteDocument'])}",                                              
                         success : function (resp) { 
                            if (resp.action !='DeleteDocument') return ;
                            $(".Documents[id={$document->get('id')}]").remove();     
                            $(".EmployeePortfolioDocument-count").each(function (id) { $(this).html(id+1); });
                         }                         
                       });            
     }); 
     
        
     $("#EmployerPortfolioDocument-IsActive-{$document->get('id')}").click(function () {         
          return $.ajax2({      
                         data : { EmployeePortfolioDocument : { id: '{$document->get('id')}', value :$(this).attr('name'), token : '{mfForm::getToken('EmployeePortfolioDocumentChangeForm')}'} },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'ChangeIsActiveDocument'])}",                                              
                         success : function (resp) { 
                            if (resp.action !='ChangeIsActiveDocument') return ;
                            
                         }                         
                       });            
     }); 
     
        
     
</script>    