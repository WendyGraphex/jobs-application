<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My jobs')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <a id="Cancel"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My jobs')}</p></a>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('New job')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-new-advert"}
    </div>
</div>
          
    {component name="/site_warning/warning" warning="employer-new-advert"}

    <div id="alertErrors" class="w-auto alert alert-danger" style="display:none;"></div>
          
{include file="./includes/_new_advert.tpl"}                         
<script type="text/javascript">                  
      $( '.Textarea' ).ckeditor();
          
      $('#Cancel').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'ListPartialAdvert'])}",
                           target: "#actions"}); 
      }); 
     
      $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",
                           target: "#actions"}); 
      }); 
     
      $("#Save").click(function () { 
        var params = {  EmployerAdvertMultiple :  { id: {if $form->getAdvert()->isLoaded()}'{$form->getAdvert()->get('id')}'{else}$(".EmployerDocuments-list[name=id]").attr('id'){/if}, adverts : [ ], categories :  [],token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerAdvertI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.EmployerAdvertMultiple.adverts.push(i18n);
        });        
        $(".EmployerAdvertCategories").each(function () { params.EmployerAdvertMultiple.categories.push($(this).attr('id')); });
        $(".EmployerAdvert.Input").each(function () { params.EmployerAdvertMultiple[$(this).attr('name')]=$(this).val(); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_ajax',['action'=>'NewAdvert'])}",           
            target: "#actions"
        });
    
      });
     
      $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
      $("#DialogCategories").click(function () { 
              return $.ajax2({      
                          data : { EmployerAdvertCategory : {  
                                            selection : $("#EmployerAdvertCategories").data('selection'), 
                                            token : '{mfForm::getToken('EmployerAdvertCategory')}' } },
                         url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCategoryForAdvert'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
      $("#AddCategories").click(function () { 
            var params = { AddCategoriesForAdvert : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForNewAdvertForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employers_ajax',['action'=>'AddCategoriesForNewAdvert'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
      
     $(".EmployerAdvertCategory-Delete").click(function () {            
     {* if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  *}
            $(".EmployerAdvertCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
     
      
     if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
     $("#DropZone").dropzone({
            url: "{url_to("employers_ajax",['action'=>'UploadAdvertDocument'])}",
            clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadAdvertDocument[token]" : '{mfForm::getToken('EmployerUploadAdvertDocumentForm')}' 
                    },   
            paramName: "UploadAdvertDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 1,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                if ($(".EmployerDocuments-list[name=id]").attr('id'))
                    formData.append('UploadAdvertDocument[id]',$(".EmployerDocuments-list[name=id]").attr('id'));             
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                if (response.errors || response.status)
                {    
                    $("#alertErrors").css('display','block');
                    $("#alertErrors").html(response.errors.file);
                    return ; 
                }    
                $("#DropZone").find('.dz-preview').remove();
                $("#DropZone").find('.dz-default').show();
                $(".dz-message").show();
                $(".EmployerDocuments-list:last").after(response);  
            }                  
    }); 
</script>           
  