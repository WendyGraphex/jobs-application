<span id="Projects-Dialog-btn" class="ChooseProjects" data-toggle="modal">{__('Link your projects')} <i class="mdi mdi-format-list-bulleted"></i></span>
<span id="Projects-Create-Dialog-btn" class="ChooseProjects" data-toggle="modal">{__('Create a new project')} <i class="mdi mdi-plus"></i></span> 


<div id="list-project-ctn" class="row" style="padding-top: 10px;padding-bottom: 20px;">
   <span id="EmployerProject-NoProjectText">{__('No project')}</span>
</div> 

<div class="modal fade" id="Projects-Dialog" role="dialog">
    <div class="ModalProjects modal-dialog modal-lg" style="width: 50%;top: 0%;width: 31%;left: 41%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" id="Projects-Dialog-close-btn" class="close" data-dismiss-modal="modal2">&times;</button>
            </div>
            <div class="modal-body">
                <div id="Projects-Dialog-ctn"><div id="errors" class="alert-container errors"><div class="alert w-auto alert-danger error" id="error" role="alert" style="display:none;"></div><div class="alert w-auto alert-warning warning" id="warning" role="alert" style="display:none;"></div><div class="alert w-auto alert-info info" id="info" role="alert" style="display:none;"></div></div>                              
                </div>
                <div class="row"><button class="btn btn-info" id="AddProjects-btn" style="margin: 0 auto;">{__('Add projects')}</button></div>      
            </div>
        </div>
    </div>
</div>
   
            
<div class="modal fade" id="Projects-Create-Dialog" role="dialog">
    <div class="ModalProjects modal-dialog modal-lg" style="width: 50%;top: 0%;width: 37%;left: 38%;">
        <div class="modal-content" style="max-height: 740px;overflow: auto;overflow-x: hidden;height: 740px;">
            <div class="modal-header">
                <button type="button" class="close" id="Projects-Create-Dialog-close-btn" data-dismiss-modal="modal2">&times;</button>
            </div>
            <div class="modal-body">
                <div id="Projects-Create-Dialog-ctn" class="col-lg-12 pt-2 stretch-card" style="height: 100%;">
                    
                </div>
            </div>
        </div>
    </div>
</div>
            
<script type="text/javascript">
    
     $("#Projects-Dialog-btn").click(function () {   
          var params = { filter : { selection : [ ], token :'{mfForm::getToken('EmployerProjectDialogFormFilter')}' } };          
          $(".EmployerProject").each(function () { params.filter.selection.push($(this).attr('id')); });
          return $.ajax2({ data : params,
                          url :"{url_to('employers_project_ajax',['action'=>'ListPartialDialogProject'])}",   
                          success : function () {  $("#Projects-Dialog").appendTo("body").modal('show') },
                          target :"#Projects-Dialog-ctn"
          }); 
    
     });  
     
     $("#Projects-Create-Dialog-btn").click(function () {            
          return $.ajax2({ 
                          url :"{url_to('employers_project_ajax',['action'=>'CreateProjectForQuote'])}",   
                          success : function () {  $("#Projects-Create-Dialog").appendTo("body").modal('show') },
                          target :"#Projects-Create-Dialog-ctn"
          }); 
    
     });  
     
     $("#Projects-Dialog-close-btn").click(function () { $("#Projects-Dialog").modal('hide'); });     
     
     $("#AddProjects-btn").click(function () {            
            var params = { AddEmployerProject : {  selection: $("#DialogProjectList").data('selection'), token : '{mfForm::getToken('EmployerProjectAddForQuoteForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employers_project_ajax',['action'=>'AddProjectsForQuote'])}",    
                  success : function () {   $("#Projects-Dialog").modal('hide'); },
                  target: "#list-project-ctn"
              });
     });
</script>     