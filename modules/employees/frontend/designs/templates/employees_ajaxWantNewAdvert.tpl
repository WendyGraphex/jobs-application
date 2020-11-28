<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">

    <h3>{__('Create your advert')}</h3>
    <div class="col-lg-12 pt-2 stretch-card">
        <div class="card classMargin">
            <div class="card-body">             
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    {foreach $form->getLanguages() as $language}
                        <li class="nav-item">            
                            <a class="nav-link {if $language@first}active{/if}"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                                {$language->getFormatter()->getText()->ucfirst()}
                                {if $form.adverts[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                            </a>
                        </li>        
                    {/foreach}
                    <li class="nav-item">            
                        <a class="nav-link"  id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                            {__('Categories')}
                        </a>
                    </li>   
                    <li class="nav-item">            
                        <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="true">
                            {__('Documents')}
                        </a>
                    </li>  
                    <li class="nav-item">            
                        <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                            {__('Experience')}
                            {if $form.budget->hasError()}<span style="color:red">?</span>{/if}
                        </a>
                    </li> 
                </ul>

                <div class="tab-content">
                    {foreach $form->getLanguages()->byIndex() as $index=>$language}
                        <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Title")}{if $form->adverts[$index].title->getOption('required')}*{/if}</label>
                                        <div>{$form.adverts[$index].title->getError()}</div>
                                        <input type="text" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.adverts[$index].title|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('title')|escape}{/if}">
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Short description")}{if $form->adverts[$index].short_description->getOption('required')}*{/if}</label>
                                        <div>{$form.adverts[$index].short_description->getError()}</div>
                                        <textarea cols="40" rows="5" class="Editor EmployeeAdvertI18n Input" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.adverts[$index].short_description|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('short_description')|escape}{/if}</textarea>
                                    </div>                    
                                </div>  
                            </div>
                            <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                    <div class="form-group">                          
                                        <label>{__("Content")}{if $form->adverts[$index].content->getOption('required')}*{/if}</label>
                                        <div>{$form.adverts[$index].content->getError()}</div>
                                        <textarea cols="40" rows="10" class="Editor EmployeeAdvertI18n Textarea Input" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.adverts[$index].content|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('content')|escape}{/if}</textarea>
                                    </div>                    
                                </div>  
                            </div>                  
                        </div> 
                    {/foreach}

                    {* ==================================== CATEGORIES  ====================================*}
                    <div class="tab-pane fade show" id="categories" role="tabpanel" aria-labelledby="categories-tab">                                   
                        <div class="row mt-3" style="height: 20px;">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                                                    
                                    <a href="javascript:void();" id="DialogCategories"><i class="mdi mdi-plus"></i>{__('Add categories')}</a>
                                </div>                    
                            </div>  
                        </div>

                        <div id="categories-ctn">
                            <div id="EmployeeAdvertCategories" style="padding-top: 15px;">                               
                                {foreach $form->getCategories() as $category} 
                                    <div class="EmployeeAdvertCategories-list" id="{$category->get('id')}">                                              
                                        <div class="btn btn-secondary-perso EmployeeAdvertCategories" id="{$category->get('id')}">
                                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                                    <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeAdvertCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}" style="color: #fff;">
                                        <i  class="mdi mdi-close delete-color"></i>
                                    </a>                                                       
                                </div> 
                            </div>
                        {/foreach}    
                    </div>

                </div>


                <div id="Modal-Categories" class="modal " role="dialog">
                    <div class="modal-dialog modal-lg model-cat-product" style="top: 25%;{*width: 32%;*}width: 40%;left: 40%;">    
                        <div class="modal-content" style="max-height: 740px;top: 0%;width: 100%;overflow: auto;overflow-x: hidden;">
                            <div class="px-2"><span class="close" style="cursor: pointer;" id="Modal-Categories-Close">&times;</span></div>
                            <div id="Modal-Categories-ctn">            
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <div class="Addbtn px-2"> 
                                    <div style="width: 163px;margin: 0 auto;">
                                        <a href="#" id="AddCategories" class="btn btn-primary admin-header-button mb-2" style="line-height: 17px;padding: 14px;"><i class="mdi mdi-plus"></i><span style="vertical-align: text-top;margin-left: 10px;"> {__('Add categories')}</span></a>                
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>     
            </div>  

            {* ==================================== DOCUMENTS  ====================================*}
            <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab">                                                                                    
                <div class="row portfolio-grid" style="margin-top: 15px;">
                    <div class="EmployerDocuments-list col-lg-3 col-md-4 {*col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12*}">
                        <div class="classDropezoneBorder">
                            <figure class="effect-text-in">
                                <div id="DropZone" class="dropzone dp-addFile"> 
                                    <i class="mdi mdi-plus plus-icon"></i>
                                    <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                                </div>
                                <figcaption>                             
                                </figcaption>                          
                            </figure>
                        </div>
                    </div>
                </div>                                    
            </div>    


            {* ==================================== DETAILS  ====================================*}
            <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                <div class="row mt-3">                       
                    <div class="form col-md-3">                                   
                        <div class="form-group">                          
                            <label>{__("Budget")}{if $form->budget->getOption('required')}*{/if}</label>
                            <div>{$form.budget->getError()}</div>
                            <input type="text" class="EmployeeAdvert Input form-control" name="budget" value="{if $form->hasErrors()}{$form.budget}{else}{$form->getAdvert()->getFormatter()->getBudget()}{/if}">
                            <span style="position: absolute;top: 41px;right: 20px;line-height: 38px;font-size: 22px;">$</span>
                        </div>                    
                    </div>  
                </div>                               
            </div>    
        </div> 
    </div>         
</div>
</div>
<div style="margin-top: 20px;">                              
    {*<button id="EmployeeSignin-Previous"  class="btn btn-success">{__('Previous')}</button>*}
    <button id="EmployeeSignin-Send"  class="btn btn-primary">{__('Send')}</button>
</div> 
</div>  

<script type="text/javascript">   
    
    $("#ModalPostAtJob").modal({
        show: false,
        backdrop: 'static'
    });
    
    $("#Modal-Categories").modal({
        show: false,
        backdrop: 'static'
    });
    
        $( '.Editor' ).ckeditor();
     
        $('.EmployeeAdvertI18n').keyup(function () {   $(".EmployeeAdvertI18n").removeClass('intro');  });
        
        $("#EmployeeSignin-Send").click(function () { 
             $(".EmployeeAdvertI18n").removeClass('intro');
            var params = {  EmployeeAdvertMultiple :  { id: {if $form->getAdvert()->isLoaded()}'{$form->getAdvert()->get('id')}'{else}$(".EmployeeDocuments-list[name=id]").attr('id'){/if}, adverts : [ ], categories :  [],token : '{$form->getCSRFToken()}' } };               
             $(".Languages").each(function () { 
                  var i18n = { lang : $(this).attr('id') };
                  $(".EmployeeAdvertI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
                  params.EmployeeAdvertMultiple.adverts.push(i18n);
            });        
            $(".EmployeeAdvertCategories").each(function () { params.EmployeeAdvertMultiple.categories.push($(this).attr('id')); });
            $(".EmployeeAdvert.Input").each(function () { params.EmployeeAdvertMultiple[$(this).attr('name')]=$(this).val(); });      
          return $.ajax2({
            data : params,
            url: "{url_to('employees_ajax',['action'=>'SaveWantAJobAdvertProfile'])}",           
            success : function (resp)
                    {
                        if (resp.errors)
                        {
                            $.each(resp.errors,function (name,error) { $(".EmployeeAdvertI18n[name="+name+"]").html(error); });
                            return ;
                        }
                        $("#want-a-job-ctn").html(resp);
                        $(".modal-body").html(resp);  
                     }  
            });  
    
      });
     
     
    $("#Modal-Categories-Close").click(function () { 
        $('#Modal-Categories').modal('hide'); 
        $('body').css('overflow', 'auto');
    });  
      
      $("#DialogCategories").click(function () { 
              return $.ajax2({      
                          data : { EmployeeAdvertCategory : {  
                                            selection : $("#EmployeeAdvertCategories").data('selection'), 
                                            token : '{mfForm::getToken('EmployeeAdvertCategory')}' } },
                         url:"{url_to('employees_ajax',['action'=>'ListPartialDialogCategoryForAdvert'])}",                                              
                         success : function () { 
                            $('#Modal-Categories').modal('show'); 
                            $('body').css('overflow', 'hidden');
                         },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
      $("#AddCategories").click(function () { 
            var params = { AddCategoriesForAdvert : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForNewAdvertForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employees_ajax',['action'=>'AddCategoriesForNewAdvert'])}",    
                  success : function () {   $("#Modal-Categories").modal('hide'); },
                  target: "#categories-ctn"
              });
     });
     
     $(".EmployeeAdvertCategory-Delete").click(function () {            
            $(".EmployeeAdvertCategories-list[id="+$(this).attr('id')+"]").remove();
     });            
      
     if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
     $("#DropZone").dropzone({
            url: "{url_to("employees_ajax",['action'=>'UploadAdvertDocumentProfile'])}",
          //  clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadAdvertDocument[token]" : '{mfForm::getToken('EmployeeUploadAdvertDocumentForm')}' 
                    },   
            paramName: "UploadAdvertDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                if ($(".EmployeeDocuments-list[name=id]").attr('id'))
                    formData.append('UploadAdvertDocument[id]',$(".EmployeeDocuments-list[name=id]").attr('id'));             
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();
                 $(".EmployeeDocuments-list:last").after(response);  
            }                  
    }); 
    
     $("#EmployeeSignin-Previous").click(function () { 
        return $.ajax2({    url:"{url_to('employees_ajax',['action'=>'WantAJob'])}",                                
                              target: "#t-employee-advert",
                            success: function (resp)
                            {                                                               
                                $("#t-employee-account-tab").addClass('active');
                                $("#t-employee-advert-tab").removeClass('active');
                                $("#t-employee-account").addClass('show active');
                                $("#t-employee-advert").removeClass('show active');
                                $("#t-employee-advert-tab").addClass('nonePointer');
                            }
            });
    });
   
    
</script>           
    
