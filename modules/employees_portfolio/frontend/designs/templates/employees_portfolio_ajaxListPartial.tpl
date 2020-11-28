<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Portfolio')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Portfolio')}</p>
          </div>
        </div>
          {component name="/site_help/help" help="employee-list-portfolio"}
      </div>
    </div>
</div>
{alerts}
 <p>{__('Max size is')} {$formFilter->getFileMaxSize()}</p>
<div class="row row-prtfolio">
    {*<div class="EmployeeDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
        <figure class="effect-text-in">
           <div id="DropZone" class="dropzone dp-addFile"> 
               <i class="fa fa-plus plus-icon"></i>
               <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
           </div>
          <figcaption>                             
          </figcaption>                          
        </figure>
      </div>*}
    <div class="Documents col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card document-dp-file">
        <div class="card" style="border-radius: 10px;border: 2px dashed gray !important;margin-top: 15px;margin-right: 0px !important;margin-left: 0px !important;">
            <div class="effect-text-in" style="border: none !important;height: 170px;">
                <div id="DropZone" class="dropzone dp-addFile"> 
                    <i class="fa fa-plus plus-icon"></i>
                    <div class="dz-message" data-dz-message style="display: block !important;"><span>{__('Drop files here to upload')}</span></div>                                    
                </div>
             </div>
        </div>
    </div>
                <div></div>
   {foreach $pager as $document} 
    <div class="Documents DocumentsSortable col-xl-2 col-lg-3 col-md-4 col-sm-6 col-12 pt-2 stretch-card" id="{$document->get('id')}">
        <div class="card classMargin classBorderSolid classHoverPortfolio" style="border-radius: 10px;">
            <i class="fa fa-arrows-alt IconChagelace" aria-hidden="true" style="position: absolute;z-index: 1000;top: 42%;left: 50%;transform: translate(-50%,-50%);font-size: 25px;color: #fff;display: none;"></i>
            <div class="AllInsideDiv">
                <div class="effect-text-in" style="border: none !important;height: 170px;">
                   {* ={$document->get('id')}={$document->get('position')}=*}
                  {*  <img class="img-dpzone img-product" src="{$document->getFile()->getUrl()}" alt="">  *}
                    {if  $document->getFileManager()->isPicture()}
                    <img class="img-dpzone img-product" src="{$document->getFileManager()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                    {else}
                        <img class="img-dpzone img-product" src="{$document->getFileManager()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                    {/if}
                    <label class="PublicPrivate btn btn-success EmployeePortfolioDocumentPublic-Text" id="{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Public')}</label>
                    <label class="PublicPrivate btn btn-danger EmployeePortfolioDocumentPrivate-Text" id="{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Private')}</label>
                    <div class="dropdown DropPublicPrivate">
                        <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                        <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                            <li><a href="javascript:void();" class="EmployeePortfolioDocumentPublic-btn" id="{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                            <li><a href="javascript:void();" class="EmployeePortfolioDocumentPrivate-btn" id="{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                        </ul>
                    </div> 
                 </div>
                <figcaption class="text-left">
                    <div class="row" style="padding: 4px;">
                        <div class="col-md-1">
                            <div class="pr-1">
                                <h6 class="EmployeePortfolioDocument-count">{$document@iteration}</h6>
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
                                <a href="javascript:void(0);" name="{$document->get('file')}" class="list-action EmployerPortfolioDocument-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                            </div>
                            <a href="javascript:void(0);" name="{$document->get('is_active')}" class="list-action EmployerPortfolioDocument-IsActive" id="{$document->get('id')}" title="{__('Active')}"><i class="fa fa-circle {if !$document->isActive()}None{/if}ActivePortfolio"></i></a>
                            <a href="javascript:void(0);" name="{$document->get('file')}" class="list-action Openmodal EmployerPortfolioDocument-View" id="{$document->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil"></i></a>
                        </div>
                    </div>
                    <div>
                        {if $document->hasI18n()}
                            {$document->getI18n()->getTitle()}
                        {/if}
                    </div>
                        
                </figcaption>
            </div>
        </div>
    </div>
    {/foreach}
      
</div>
<div class="modal fade" id="DialogDocument" role="dialog"></div> 

<script type="text/javascript">      
   
          if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
          $("#DropZone").dropzone({
            url: "{url_to("employees_portfolio_ajax",['action'=>'UploadDocument'])}",
          //  clickable: false,
            params: { 
                       "UploadPortfolioDocument[token]" : '{mfForm::getToken('EmployeePortfolioDocumentUploadForm')}' 
                    },   
            paramName: "UploadPortfolioDocument[file]",
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
          /*  sending : function (file, xhr, formData) {                               
                formData.append('UploadPictureProduct[return]',this.getQueuedFiles().length === 0);
                formData.append('UploadPictureProduct[number_of_files]',this.files.length);
            },  */                  
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".Documents:first").after(response); 
            }                  
    }); 
    
    $("row-prtfolio div").disableSelection().addClass('ui-state-default').eq(0).addClass('ui-state-disabled');
    $( ".row-prtfolio" ).sortable({
        items: ".Documents:not(.document-dp-file)",
       // items: "div(.document-dp-file)",
        stop: function (event, ui) {
            var moved = ui.item,
                replaced = ui.item.prev();
            if (replaced.length == 0) 
                replaced = ui.item.next();          
          // console.log("moved ID:" + moved.attr("id") + "replaced ID:" + replaced.attr("id")); 
           var params = { EmployeePortfolioDocumentMove : { id: moved.attr("id"), sibling : replaced.attr("id"),token : '{mfForm::getToken('EmployeePortfolioDocumentMoveForm')}' } };
            $.ajax2({    data : params,
                         url:"{url_to('employees_portfolio_ajax',['action'=>'MoveDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='MoveDocument') return ;
                                 $(".EmployeePortfolioDocument-count").each(function (id) { $(this).html(id+1); }); 
                            }                   
                       }); 
        }
    });
    
      $(".EmployeePortfolioDocumentPublic-btn").click(function () {     
           return $.ajax2({      
                          data : { EmployeePortfolioDocument : $(this).attr('id') },
                          url:"{url_to('employees_portfolio_ajax',['action'=>'PublicDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PublicDocument') return ;
                                $(".EmployeePortfolioDocumentPrivate-btn[id="+resp.id+"]").show();
                                $(".EmployeePortfolioDocumentPublic-btn[id="+resp.id+"]").hide(); 
                                $(".EmployeePortfolioDocumentPrivate-Text[id="+resp.id+"]").hide();
                                $(".EmployeePortfolioDocumentPublic-Text[id="+resp.id+"]").show(); 
                            }                          
                       });                      
     });     
     
     $(".EmployeePortfolioDocumentPrivate-btn").click(function () {     
           return $.ajax2({      
                          data : { EmployeePortfolioDocument : $(this).attr('id') },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'PrivateDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PrivateDocument') return ;
                                $(".EmployeePortfolioDocumentPrivate-btn[id="+resp.id+"]").hide();
                                $(".EmployeePortfolioDocumentPublic-btn[id="+resp.id+"]").show(); 
                                $(".EmployeePortfolioDocumentPrivate-Text[id="+resp.id+"]").show();
                                $(".EmployeePortfolioDocumentPublic-Text[id="+resp.id+"]").hide();    
                            }                   
                       });                      
     }); 
     
     
      $(".EmployerPortfolioDocument-Delete").click(function () { 
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;    
          return $.ajax2({      
                         data : { EmployeePortfolioDocument : $(this).attr('id') },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'DeleteDocument'])}",                                              
                         success : function (resp) { 
                            if (resp.action !='DeleteDocument') return ;
                            $(".Documents[id="+resp.id+"]").remove();     
                            $(".EmployeePortfolioDocument-count").each(function (id) { $(this).html(id+1); });
                         }                         
                       });            
     });      
        
     $(".EmployerPortfolioDocument-IsActive").click(function () {         
          return $.ajax2({      
                         data : { EmployeePortfolioDocument : { id: $(this).attr('id'), value :$(this).attr('name'), token : '{mfForm::getToken('EmployeePortfolioDocumentChangeForm')}'} },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'ChangeIsActiveDocument'])}",                                              
                         success : function (resp) { 
                            if (resp.action !='ChangeIsActiveDocument') return ;
                            $(".EmployerPortfolioDocument-IsActive[id="+resp.id+"]").attr('name',resp.value);
                            if (resp.value=='YES')
                                $(".EmployerPortfolioDocument-IsActive[id="+resp.id+"] i").removeClass("NoneActivePortfolio").addClass("ActivePortfolio");
                            else
                               $(".EmployerPortfolioDocument-IsActive[id="+resp.id+"] i").removeClass("ActivePortfolio").addClass("NoneActivePortfolio");
                         }                         
                       });            
     }); 
                  
    $(".EmployerPortfolioDocument-View").click(function () {         
          return $.ajax2({      
                         data : { EmployeePortfolioDocument : $(this).attr('id') },
                         url:"{url_to('employees_portfolio_ajax',['action'=>'ViewDocument'])}", 
                         success: function () { $("#DialogDocument").modal('show'); },
                         target : "#DialogDocument"                      
                       });            
     });
     
</script>
