<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My projects')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <a id="Cancel"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My projects')}</p></a>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('New project')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-new-projects"}
    </div>
</div>
{include file="./includes/_new_project.tpl"}                         
<script type="text/javascript">                  
        $( '.Textarea' ).ckeditor();
        
      $('#Cancel').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_project_ajax',['action'=>'ListPartialProject'])}",
                           target: "#actions"}); 
      }); 
     
      $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_project_ajax',['action'=>'Dashboard'])}",
                           target: "#actions"}); 
      }); 
     
      $("#Save").click(function () { 
        var params = {  EmployerProjectMultiple :  { id: {if $form->getProject()->isLoaded()}'{$form->getProject()->get('id')}'{else}$(".EmployerProjectDocuments-list[name=id]").attr('id'){/if}, projects : [ ], token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerProjectI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.EmployerProjectMultiple.projects.push(i18n);
        });              
        $(".EmployerProject.Input").each(function () { params.EmployerProjectMultiple[$(this).attr('name')]=$(this).val(); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_project_ajax',['action'=>'NewProject'])}",           
            target: "#actions"
        });
    
      });                   
      
     if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
     $("#DropZone").dropzone({
            url: "{url_to("employers_project_ajax",['action'=>'UploadProjectDocument'])}",
            clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadProjectDocument[token]" : '{mfForm::getToken('EmployerUploadProjectDocumentForm')}' 
                    },   
            paramName: "UploadProjectDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                if ($(".EmployerProjectDocuments-list[name=id]").attr('id'))
                    formData.append('UploadProjectDocument[id]',$(".EmployerProjectDocuments-list[name=id]").attr('id'));             
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();
                 $(".EmployerProjectDocuments-list:last").after(response);  
            }                  
    }); 
</script>           
  