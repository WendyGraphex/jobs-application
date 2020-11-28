{if $task->isLoaded()}
<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('Project Manager')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Projects"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Project Manager')}</p></a>
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project [%s]',$task->getProject()->get('reference'))}</p>
                     <a id="Tasks"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Tasks')}</p></a>                       
                        <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Task [%s]',$task->get('name'))}</p>
                     <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Documents')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employee-list-project-task-documents"}
    </div>
</div>
{alerts}

<div class="table-responsive bg-white px-2 py-2">            
    <div class="col-md-12 padd-col">
        
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
        </div> 
        <div class="float-right w-50">                   
            <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
            <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>
    </div>
    <table class='table table-bordered table-hover table-striped'> 
        
          
    </table>
     <div class="row" id="rowPicturesMedia" style="max-width: 100%;margin: 0 auto;">
            <div id="DropZoneDocument-ctn" class="col-md-2" style="background-color: white; padding: 0;">
                <div style="margin: 10px;">
                    <figure class="effect-text-in ModeDisplay" style="height: 100%;">
                        <div id="DropZoneDocument" class="dropzone dp-addFile pt-0" style="padding-top: 30% !important;"> 
                            <i class="fa fa-plus plus-icon"></i>                                                              
                            <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                        </div>
                       <figcaption>                             
                       </figcaption>                          
                     </figure> 
                </div>        
            </div> 
   {foreach $pager as $item}                       
        <div class="ProjectDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" id="{$item->get('id')}">   
                            <figure class="effect-text-in classBorderSolid">
                                <div class="div-img h-100 dz-image">
                                    {if  $item->getFile()->isPicture()}
                                        <img class="img-dpzone img-product" src="{$item->getFile()->getImages()->getSmall()->getUrl()}" alt="{$item->get('file')}">
                                    {else}
                                        <img class="img-dpzone img-product" src="{$item->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$item->get('file')}">               
                                    {/if}                                     
                                </div>
                                <figcaption class="text-left">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <div class="pr-1">
                                                <h6 class="PicturesCount">{$item@iteration}</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="pic-title text-left">
                                                <h6 class="picture-title w-100">                                                                          
                                                    <span class="picture-title"><a href="{$item->getFile()->getUrl()}" target="_blank">{$item->getFile()} ({$item->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <div class="conf-icons">
                                                <a href="javascript:void(0);" name="{$item->getFile()}" class="list-action ProjectDocuments-Delete" id="{$item->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </figcaption> 
                            </figure>        
                        </div> 
   {/foreach}              
     </div>        
     {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>


<script type="text/javascript">      
       
     $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
    
     $('#Projects').click(function(){                                       
          return $.ajax2({  url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployer'])}",                           
                           target: "#actions"});
        }); 
    
     $('#Tasks').click(function(){                                       
          return $.ajax2({  data : { Project : '{$task->getProject()->get('id')}' },
                            url: "{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployer'])}",                           
                           target: "#actions"});
        }); 
    
$(".ProjectDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { ProjectDocument : $(this).attr('id') },
                         url:"{url_to('projects_documents_ajax',['action'=>'DeleteDocument'])}",                                              
                         success : function (resp) { 
                              if (resp.action !='DeleteDocument') return ; 
                              $(".ProjectDocuments-list[id="+resp.id+"]").remove();
                            }
                          
                       });                      
    });    
    
      if ($("#DropZoneDocument").find('.dz-default').length)
             $("#DropZoneDocument")[0].dropzone.off().destroy();
                                                 
          $("#DropZoneDocument").dropzone({
            url: "{url_to("projects_documents_ajax",['action'=>'UploadDocument'])}",
         //   clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadDocument[id]" : '{$task->get('id')}',  
                      "UploadDocument[token]" : '{mfForm::getToken('ProjectDocumentUploadForm')}'                     
                    },   
            paramName: "UploadDocument[file]" ,     
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 16,   
             sending : function (file, xhr, formData) {              
                         
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();               
                 $("#DropZoneDocument-ctn").after(response);  
            }                  
       }); 
</script>

{else}
   {__('Task is invalid.') } 
{/if}


