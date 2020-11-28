<span class="ChooseProjects"><a href="{url_to("employers_project",['action'=>'New'])}">{__('Create project')}<i class="mdi mdi-plus"></i></a></span>
        {*if $user->getNumberOfProjects() > 1*}
<span id="LinkProjects" class="ChooseProjects" data-toggle="modal">{__('Link Project')}<i class="mdi mdi-format-list-bulleted"></i></span>
<span id="ProjectAdvertshowAdverts" class="ChooseProjects" data-toggle="modal">{__('aaaaaa')}<i class="mdi mdi-plus"></i></span> 
<div class="modal fade" id="DialogProjects" role="dialog">
    <div class="ModalProjects modal-dialog modal-lg" style="width: 50%;top: 0%;width: 31%;left: 41%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close closeModalProject" data-dismiss-modal="modal2">&times;</button>
            </div>
            <div class="modal-body">
                <div id="Modal-Categories-ctn"><div id="errors" class="alert-container errors"><div class="alert w-auto alert-danger error" id="error" role="alert" style="display:none;"></div><div class="alert w-auto alert-warning warning" id="warning" role="alert" style="display:none;"></div><div class="alert w-auto alert-info info" id="info" role="alert" style="display:none;"></div></div>          
                    <div class="NewClassAtTable bg-white px-2 py-2">   
                        <div class="row">
                            <!-- component=/employers/path - not cached internally - id=5f4c3b2cac668d9e5972715a0cc23ea6 - begin --><div class="col-md-10 text-left ">
                                <span id="1" class="EmployerWorkCategoryCurrent" name="current"><i class="fa fa-globe"></i></span>
                                /

                            </div><!-- component=/employers/path - end [View not cached] -->   
                        </div> 
                        <div class="col-md-12  padd-col">

                            <div class="float-left w-50">
                                <label class="float-left" style="line-height: 39px;">show</label>
                                <div class="form-group float-left mr-2">
                                    <select name="dialog-pager-nbitemsbypage" class="form-control form-control-sm float-left mx-1">
                                        <option value="5" class="form-control form-control-sm float-left mx-1 option">5</option>
                                        <option value="10" class="form-control form-control-sm float-left mx-1 option">10</option>
                                        <option value="20" selected="selected" class="form-control form-control-sm float-left mx-1 option">20</option>
                                        <option value="50" class="form-control form-control-sm float-left mx-1 option">50</option>
                                        <option value="100" class="form-control form-control-sm float-left mx-1 option">100</option>
                                        <option value="*" class="form-control form-control-sm float-left mx-1 option">*</option>
                                    </select>

                                </div>
                                <label style="line-height: 39px;">entries</label> 



                            </div>
                            <div class="float-right w-50">                   
                                <button style="float: right;" id="dialog-filter" class="btn btn-secondary btn-f">Filter</button>   
                                <button style="float: right;margin-right: 10px;" id="dialog-init" class="btn btn-secondary btn-init btn-f">Init</button>
                            </div>
                        </div>



                        <table id="DialogCategoryList" class="table table-bordered table-hover table-striped list-user" role="grid" aria-describedby="Myliste_info">
                            <thead class="thead-color">
                                <tr role="row">
                                    <th>#</th>           
                                    <th><span class="mr-1">Title</span></th>                                             

                                    <th>Actions</th>            
                                </tr>
                            </thead>
                            <tbody class="tablebody">
                                <tr role="row">
                                    <td></td>             
                                    <td><input class="form-control form-control-sm ml-1 dialog-search" name="title" value=""></td>                                          
                                    <td></td>        
                                </tr>
                                <tr class="DialogCategoryList list " id="2" role="row">
                                    <td class="count">1</td>                  
                                    <td>                    Graphic Design
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="2" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="4" role="row">
                                    <td class="count">2</td>                  
                                    <td>                    Writing/Translation
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="4" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="5" role="row">
                                    <td class="count">3</td>                  
                                    <td>                    Video/ Logo Animation
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="5" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="6" role="row">
                                    <td class="count">4</td>                  
                                    <td>                    Web/Mob. Development
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="6" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="7" role="row">
                                    <td class="count">5</td>                  
                                    <td>                    Wellness &amp; Healthy Living
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="7" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="28" role="row">
                                    <td class="count">6</td>                  
                                    <td>                    Data Science
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="28" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="29" role="row">
                                    <td class="count">7</td>                  
                                    <td>                    Music Productions
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="29" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>
                                <tr class="DialogCategoryList list " id="98" role="row">
                                    <td class="count">8</td>                  
                                    <td>                    Marketing &amp; Advertisement
                                    </td>                                      
                                    <td>   
                                        <a href="#" class="list-action text-info Categories" id="98" title="Categories"><i class="fa fa-list "></i></a>             
                                    </td>
                                </tr>

                            </tbody>         
                        </table>
                    </div>
                    <div class="row"><button class="btn btn-info" id="AddProjects" style="margin: 0 auto;">{__('Create project')}</button></div>
                </div>
            </div>
        </div>
    </div>
</div>
{*================================ Other Modal =======================================*}
<div class="modal fade" id="SecondModal" role="dialog">
    <div class="ModalProjects modal-dialog modal-lg" style="width: 50%;top: 0%;width: 37%;left: 38%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close closeSecondModal" data-dismiss-modal="modal2">&times;</button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12 pt-2 stretch-card">
                    <div class="card classMargin">
                        <div class="card-body">             
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                {*foreach $form->getLanguages() as $language}
                                <li class="nav-item">            
                                <a class="nav-link"  id="english-tab" data-toggle="tab" href="#english" role="tab" aria-controls="english" aria-selected="true">
                                {__('English')}
                                </a>
                                </li>        
                                {/foreach*}
                                <li class="nav-item">            
                                    <a class="nav-link"  id="languages-tab" data-toggle="tab" href="#languages" role="tab" aria-controls="languages" aria-selected="true">
                                        {__('Languages')}
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
                                        {*if $form.budget->hasError()}<span style="color:red">?</span>{/if*}
                                    </a>
                                </li> 
                            </ul>

                            <div class="tab-content">
                                {*foreach $form->getLanguages()->byIndex() as $index=>$language}
                                <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                                <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                <label>{__("Title")}{if $form->adverts[$index].title->getOption('required')}*{/if}</label>
                                <div>{$form.adverts[$index].title->getError()}</div>
                                <input type="text" class="EmployerAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.adverts[$index].title|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('title')|escape}{/if}">
                                </div>                    
                                </div>  
                                </div>
                                <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                <label>{__("Short description")}{if $form->adverts[$index].short_description->getOption('required')}*{/if}</label>
                                <div>{$form.adverts[$index].short_description->getError()}</div>
                                <textarea cols="40" rows="5" class="EmployerAdvertI18n Input" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.adverts[$index].short_description|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('short_description')|escape}{/if}</textarea>
                                </div>                    
                                </div>  
                                </div>
                                <div class="row mt-3">                       
                                <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                <label>{__("Content")}{if $form->adverts[$index].content->getOption('required')}*{/if}</label>
                                <div>{$form.adverts[$index].content->getError()}</div>
                                <textarea cols="40" rows="10" class="EmployerAdvertI18n Textarea Input" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.adverts[$index].content|escape}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('content')|escape}{/if}</textarea>
                                </div>                    
                                </div>  
                                </div>                  
                                </div> 
                                {/foreach*}

                                {* ==================================== CATEGORIES  ====================================*}
                                <div class="tab-pane fade show active" id="languages" role="tabpanel" aria-labelledby="languages-tab">                                   
                                    <div class="tab-pane fade show active Languages" id="en" role="tabpanel" aria-labelledby="language-en-tab">                 
                                        <div class="row mt-3">                       
                                            <div class="form col-md-12">                                   
                                                <div class="form-group">                          
                                                    <label>Title*</label>
                                                    <div></div>
                                                    <input type="text" class="EmployerAdvertI18n Input form-control" data-lang="en" name="title" value="">
                                                </div>                    
                                            </div>  
                                        </div>
                                        <div class="row mt-3">                       
                                            <div class="form col-md-12">                                   
                                                <div class="form-group">                          
                                                    <label>Short description*</label>
                                                    <textarea class=""></textarea>
                                                </div>                    
                                            </div>  
                                        </div>
                                        <div class="row mt-3">                       
                                            <div class="form col-md-12">                                   
                                                <div class="form-group">                          
                                                    <label>Content*</label>
                                                    <textarea class=""></textarea>
                                                </div>                    
                                            </div>  
                                        </div>                  
                                    </div>
                                </div>  

                                {* ==================================== DOCUMENTS  ====================================*}
                                <div class="tab-pane fade show" id="documents" role="tabpanel" aria-labelledby="documents-tab">                                                                                    
                                    <div class="row portfolio-grid">
                                        <div class="EmployerDocuments-list col-lg-4 col-md-6">
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


                                {* ==================================== DETAILS  ====================================*}
                                <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                                    <div class="row mt-3">                       
                                        <div class="form col-md-4">                                   
                                            <div class="form-group">                          
                                                <label>{__("Budget")}</label>
                                                <div></div>
                                                <input type="text" class="EmployerAdvert Input form-control" name="budget" value="">
                                                <span style="position: absolute;top: 41px;right: 20px;line-height: 42px;font-size: 22px;">$</span>
                                            </div>                    
                                        </div>  
                                    </div>                               
                                </div>   
                            </div> 
                        </div>         
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="row" style="padding-top: 10px;">
    <div class="col-md-3">
        <label>{__('Project1')}</label> <i class="mdi mdi-trash-can" style="color: #d73535;"></i>       
    </div>
    <div class="col-md-3">
        <label>{__('Project2')}</label> <i class="mdi mdi-trash-can" style="color: #d73535;"></i>
    </div>
</div>
{*elseif $user->getNumberOfProjects() == 1}
    <div class="row" style="padding-top: 10px;">
        <div class="col-md-3">
         <label>{$project->getFormatter()->getName()->ucfirst()}</label> 
        </div>
    </div> 
{/if*}


    
    
<script type="text/javascript">
    
        $("#LinkProjects").click(function () {
            $("#DialogProjects").appendTo("body").modal('show');; 
        });
        
        $("#ProjectAdvertshowAdverts").click(function () { $("#SecondModal").appendTo("body").modal('show'); });
        
        
        $("#DialogProjects tr").click(function(){
            $(this).toggleClass('selected');
        }); 
        
        $(".closeSecondModal").click(function () {
            $("#SecondModal").appendTo("body").modal('hide');
        });
        
        $(".closeModalProject").click(function () { $("#DialogProjects").appendTo("body").modal('hide') });
       
        $("#AddProjects").click(function () { 
         var params = { EmployerProjectRequest :  {  projects : [ ], token : ''  }  };
        // $(".EmployerProjects").each(function () { params.EmployerProjectRequest.projects.push($(this).attr('id')); });
         return $.ajax2({ data : params,               
                          url :"{url_to('sales_quotation_ajax',['action'=>'AddProjects'])}",   
                          success : function () {  $("#DialogProjects").modal('show'); },
                          target :"#DialogEmployeeQuote"
          }); 
     });
</script>     