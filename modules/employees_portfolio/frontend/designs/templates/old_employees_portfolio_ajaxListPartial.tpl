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
      </div>
    </div>
</div>
{alerts}
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
      <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card">
        <div class="card classMargin" style="border-radius: 10px;border: 2px dashed gray !important;">
            <div class="effect-text-in">
                <div id="DropZone" class="dropzone dp-addFile"> 
                    <i class="fa fa-plus plus-icon"></i>
                    <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                </div>
             </div>
        </div>
    </div>
    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card" id="1">
        <div class="card classMargin classBorderSolid" style="border-radius: 10px;">
            <div class="effect-text-in">
                <img class="img-dpzone img-product" src="/web/pictures/person_1.jpg" alt="">               
                <label class="PublicPrivate btn btn-success EmployeeAdvertDocumentPublic-Text" id="">{__('Public')}</label>
                <label class="PublicPrivate btn btn-danger EmployeeAdvertDocumentPrivate-Text" id="">{__('Private')}</label>
                <div class="dropdown DropPublicPrivate">
                    <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                    <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPublic-btn-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                    </ul>
                </div> 
             </div>
            <figcaption class="text-left">
                <div class="row" style="padding: 4px;">
                    <div class="col-md-1">
                        <div class="pr-1">
                            <h6 class="PicturesCount">1</h6>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="pic-title text-left">
                            <h6 class="picture-title w-100">                                                                          
                              <span class="picture-title"><a href="#" target="_blank">aaaaa-12Mo</a></span>                    
                           </h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="conf-icons">
                            <a href="javascript:void(0);" name="aaaaa" class="list-action" id="EmployerDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                        </div>
                        <a href="javascript:void(0);" name="aaaaa" class="list-action Openmodal" id="EmployerDocuments-{$document->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil"></i></a>
                    </div>
                </div>
            </figcaption> 
        </div>
    </div>
    {*======================================================================================*}
    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card" id="2">
        <div class="card classMargin classBorderSolid" style="border-radius: 10px;">
            <div class="effect-text-in">
                <img class="img-dpzone img-product" src="/web/pictures/person_1.jpg" alt="">               
                <label class="PublicPrivate btn btn-success EmployeeAdvertDocumentPublic-Text" id="">{__('Public')}</label>
                <label class="PublicPrivate btn btn-danger EmployeeAdvertDocumentPrivate-Text" id="">{__('Private')}</label>
                <div class="dropdown DropPublicPrivate">
                    <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                    <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPublic-btn-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                    </ul>
                </div> 
             </div>
            <figcaption class="text-left">
                <div class="row" style="padding: 4px;">
                    <div class="col-md-1">
                        <div class="pr-1">
                            <h6 class="PicturesCount">2</h6>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="pic-title text-left">
                            <h6 class="picture-title w-100">                                                                          
                              <span class="picture-title"><a href="#" target="_blank">aaaaa-12Mo</a></span>                    
                           </h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="conf-icons">
                            <a href="javascript:void(0);" name="aaaaa" class="list-action" id="EmployerDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                        </div>
                        <a href="javascript:void(0);" name="aaaaa" class="list-action Openmodal" id="EmployerDocuments-{$document->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil"></i></a>
                    </div>
                </div>
            </figcaption> 
        </div>
    </div>
{*===================================================================================*}
<div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12 pt-2 stretch-card" id="3">
        <div class="card classMargin classBorderSolid" style="border-radius: 10px;">
            <div class="effect-text-in">
                <img class="img-dpzone img-product" src="/web/pictures/person_1.jpg" alt="">               
                <label class="PublicPrivate btn btn-success EmployeeAdvertDocumentPublic-Text" id="">{__('Public')}</label>
                <label class="PublicPrivate btn btn-danger EmployeeAdvertDocumentPrivate-Text" id="">{__('Private')}</label>
                <div class="dropdown DropPublicPrivate">
                    <button class="btn btn-DefaultDrop btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-cog"></i></button>
                    <ul class="dropdown-menu" style="min-width: 50px;padding: 10px;margin-top: 2px;">
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPublic-btn-{$document->get('id')}" {if $document->isOpened()}style="display:none"{/if}>{__('Public')}</a></li>
                        <li><a href="javascript:void();" id="EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}" {if !$document->isOpened()}style="display:none"{/if}>{__('Private')}</a></li>
                    </ul>
                </div> 
             </div>
            <figcaption class="text-left">
                <div class="row" style="padding: 4px;">
                    <div class="col-md-1">
                        <div class="pr-1">
                            <h6 class="PicturesCount">3</h6>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="pic-title text-left">
                            <h6 class="picture-title w-100">                                                                          
                              <span class="picture-title"><a href="#" target="_blank">aaaaa-12Mo</a></span>                    
                           </h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="conf-icons">
                            <a href="javascript:void(0);" name="aaaaa" class="list-action" id="EmployerDocuments-Delete-{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                        </div>
                        <a href="javascript:void(0);" name="aaaaa" class="list-action Openmodal" id="EmployerDocuments-{$document->get('id')}" title="{__('Edit')}"><i class="fa fa-pencil"></i></a>
                    </div>
                </div>
            </figcaption> 
        </div>
    </div>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">  
                         <a class="nav-link active"  id="english-tab" data-toggle="tab" href="#english" role="tab" aria-controls="english" aria-selected="true">
                           {__('English')}
                        </a>
                     </li>
                    <li class="nav-item">  
                       <a class="nav-link"  id="spanish-tab" data-toggle="tab" href="#spanish" role="tab" aria-controls="spanish" aria-selected="true">
                           {__('Spanish')}
                        </a>
                    </li>   
                    <li class="nav-item">            
                        <a class="nav-link"  id="frensh-tab" data-toggle="tab" href="#frensh" role="tab" aria-controls="frensh" aria-selected="true">
                           {__('french')}
                        </a>
                     </li>
                </ul>
                <div class="tab-content" style="padding-top: 20px;">
                    <div class="tab-pane fade show active" id="english" role="english-tab">                 
                        <input type="text" placeholder="English" class="form-control Fields Input" name="commercial" value="">                  
                    </div>
                    <div class="tab-pane fade show" id="spanish" role="spanish-tab">                 
                        <input type="text" placeholder="Spanish" class="form-control Fields Input" name="commercial" value="">                   
                    </div>
                    <div class="tab-pane fade show" id="frensh" role="frensh-tab">                 
                        <input type="text" placeholder="French" class="form-control Fields Input" name="commercial" value="">                   
                    </div>
                </div>
                <div style="margin-top: 20px;text-align: center;">
                    <button type="button" class="btn btn-success" style="margin: 0 auto;">Ok</button>
                </div>
              </div>
            </div>
        </div>
    </div>               
</div>

<script type="text/javascript">      
    $( ".row-prtfolio" ).sortable({
        stop: function (event, ui) {
            var moved = ui.item,
                replaced = ui.item.prev();

            // if replaced.length === 0 then the item has been pushed to the top of the list
            // in this case we need the .next() sibling
            if (replaced.length == 0) {
                replaced = ui.item.next();
            }

           console.log("moved ID:" + moved.attr("id") + "replaced ID:" + replaced.attr("id"));
        }
    });
    $("#EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}").click(function () {                     
           return $.ajax2({      
                          data : { EmployeeAdvertDocument : '{$document->get('id')}' },
                         url:"{url_to('employees_ajax',['action'=>'PrivateAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PrivateAdvertDocument') return ;
                                $("#EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}").hide();
                                $("#EmployeeAdvertDocumentPublic-btn-{$document->get('id')}").show(); 
                                $("#EmployeeAdvertDocumentPrivate-Text-{$document->get('id')}").show();
                                $("#EmployeeAdvertDocumentPublic-Text-{$document->get('id')}").hide();    
                            }                          
                       });                      
     });
     $("#EmployeeAdvertDocumentPublic-btn-{$document->get('id')}").click(function () {                     
           return $.ajax2({      
                          data : { EmployeeAdvertDocument : '{$document->get('id')}' },
                         url:"{url_to('employees_ajax',['action'=>'PublicAdvertDocument'])}",                                              
                         success : function (resp) { 
                                if (resp.action !='PublicAdvertDocument') return ;
                                $("#EmployeeAdvertDocumentPrivate-btn-{$document->get('id')}").show();
                                $("#EmployeeAdvertDocumentPublic-btn-{$document->get('id')}").hide(); 
                                $("#EmployeeAdvertDocumentPrivate-Text-{$document->get('id')}").hide();
                                $("#EmployeeAdvertDocumentPublic-Text-{$document->get('id')}").show(); 
                            }                          
                       });                      
     }); 
    
    $(".Openmodal").click(function () { $("#myModal").modal('show'); });
    
</script>
