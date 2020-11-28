{if $project->isLoaded()}
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
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project [%s]',$project->get('reference'))}</p>
                     <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Documents')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employee-list-project-documents"}
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
          return $.ajax2({  url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
    
     $('#Tasks').click(function(){                                       
          return $.ajax2({  data : { Project : '{$project->get('id')}'},
                            url: "{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
        
    $(".Delete").click(function () {            
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
</script>

{else}
   {__('Project is invalid.') } 
{/if}


