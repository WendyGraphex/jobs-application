
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Freelancer Function")}</h3>
        <h3 class="admin-header-small-text">{__("Configuration Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Freelancer Function')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.function_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.function_i18n.lang}
          </div>          
        </div>
          
          
          
          <div class="row">
              <div class="col-md-2">
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    <img id="blah" alt="" style="display: none;" /><br/>
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" function="file" class="form-control Files Fields" name="EmployeeFunctionI18n[function][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->function.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployeeFunction form-control Fields Input" function="text" value="{$item_i18n->getFunction()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->function.color->getOption('required')}*{/if}</label>            
                            <input class="EmployeeFunction form-control Fields Input Color General input-color" function="text" value="{$item_i18n->getFunction()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->function_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployeeFunctionI18n form-control Fields Input" function="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
          
          
          
          
          
        {*<div class="row">          
            <div class="form-group col-md-6">             
               {if $form->hasErrors()}<div class="alert alert-{if $form.function.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.name->getError()}</div>{/if}
             <label for="name">{__('Name')}{if $form->function.name->getOption('required')}*{/if}</label>           
             <div class="field_with_errors">
                <input class="EmployeeFunction form-control Fields Input" function="text" value="{$item_i18n->getFunction()->get('name')}" name="name" id="name">
             </div>
          </div>   
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.function_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function_i18n.title->getError()}</div>{/if}
            <label for="title">{__('Title')}{if $form->function_i18n.title->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeFunctionI18n form-control Fields Input" function="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
          </div>  
        </div>*}
             {*<div class="row">   
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.function.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.color->getError()}</div>{/if}
            <label for="color" class="d-block">{__('Color')}{if $form->function.color->getOption('required')}*{/if}</label>            
            <input class="EmployeeFunction form-control Fields Input Color General input-color" function="text" value="{$item_i18n->getFunction()->get('color')}" name="color" id="color"/>
          </div> 
                     
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.function.icon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.icon->getError()}</div>{/if}
            <label for="icon">{__('Icon')}{if $form->function.icon->getOption('required')}*{/if}</label> 
                <div class="input-group">
                  <span class="input-group-btn">
                  <span class="btn btn-default btn-file bg-primary">
                     <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input function="file" class="Files Fields" style="display:none" name="EmployeeFunctionI18n[function][icon]" id="item_file">
                  </span>
                          </span>
                          <input function="text" id="item_file_name" class="form-control" readonly="" value="">
                </div>
          </div>               
        </div> *}          
    </div>          
</div>
<script function="text/javascript">
    
    
    
     $('#pictureAdd').click(function() {
        $('#item_file').click();
     });
      
    $("#item_file").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    }); 
    
    
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
     $("#item_file_browse").click(function () { $("#item_file").click(); }); 
          $("#item_file").change(function (e) { $("#item_file_name").val(e.target.files[0].name);$("#item_file_name").addClass("active-file");  });

         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('EmployeeFunctionFormFilter')}" } },                              
                              url : "{url_to('employees_ajax',['action'=>'ListPartialFunction'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployeeFunctionI18n: { 
                                   function_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   function : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeFunctionI18n.Input").each(function() { params.EmployeeFunctionI18n.function_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployeeFunction.Input").each(function() {  params.EmployeeFunctionI18n.function[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employees_ajax',['action'=>'SaveNewFunctionI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
