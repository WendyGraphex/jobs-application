<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('Finalize your registration')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor">{__('My profile')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm" style="padding: 0;">
        <div class="buttonSave">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div>                 
        
<div class="col-12 grid-margin" style="padding: 20px;">
    <div class="card">
        <div class="card-body">  
            {if $is_block}
                {include file="./../includes/_myprofile_tabs.tpl"}           
                {include file="./../includes/_myprofile_panels.tpl"}                                                             
            {else}
                {include file="./includes/_myprofile_tabs.tpl"}           
                {include file="./includes/_myprofile_panels.tpl"}         
            {/if}    
        </div>                                                                               
    </div>
</div>
                
                          
<script type="text/javascript">      
    {JqueryScriptsReady}
        
    {if $is_block}    
        {include file="./../includes/_myprofile_skills_js.inc"}
        {include file="./../includes/_myprofile_languages_js.inc"} 
        {include file="./../includes/_myprofile_diplomas_js.inc"}      
    {else}
        {include file="./includes/_myprofile_skills_js.inc"}
        {include file="./includes/_myprofile_languages_js.inc"} 
        {include file="./includes/_myprofile_diplomas_js.inc"}         
    {/if}  
     
    $(".EmployeeSelect").select2({
       width: 'resolve',
    });
    
    
    $('#logoAdd').click(function() {
        $('#logoInp').click();
     });
      
    $("#logoInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#logo').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
    $(".ModeLogo").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconForLogo").removeClass('Normal fa fa-square-o').addClass('Inverse fa fa-square');
                $("#DivLogo").css('background-color','rgb(155, 155, 155)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconForLogo").removeClass('Inverse fa fa-square').addClass('Normal fa fa-square-o');
                $("#DivLogo").css('background-color','');
            }
   });
    
    
     $("#Birthday").datepicker({ maxDate : '-18Y' }); 
      
      $('#Save').click(function(){                             
           var  params= {  EmployeeCompletion: {         
                                     categories :  [],languages : [ ], diplomas : [ ], skills : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };                        
          $(".Employee.Input").each(function() { params.EmployeeCompletion[$(this).attr('name')]=$(this).val(); });                                  
          $(".Employee.Select option:selected").each(function () { params.EmployeeCompletion[$(this).parent().attr('name')]=$(this).val(); });  
          $(".EmployeeCategories").each(function () { params.EmployeeCompletion.categories.push($(this).attr('id')); });
          
          $(".languages-ctn").each(function () {     
              var item = { };  $(".EmployeeLanguage[data-index="+$(this).attr('data-index')+"]").each(function () { item[$(this).attr('name')]= $(this).val(); });           
              params.EmployeeCompletion.languages.push(item);
          });
          
          $(".skills-ctn").each(function () {     
              var item = { i18n : [] };  $(".EmployeeSkill[data-index="+$(this).attr('data-index')+"]").each(function () { item[$(this).attr('name')]= $(this).val(); });  
              $(".EmployeeSkillLanguages[data-index="+$(this).attr('data-index')+"] option").each(function () { 
                  var i18n = { };
                  $(".EmployeeSkillI18n[data-index="+$(this).attr('data-index')+"][data-lang="+$(this).val()+"]").each(function () { if ($(this).val()) i18n[$(this).attr('name')]=$(this).val(); });
                  if (Object.entries(i18n).length !==0) { i18n.lang = $(this).val(); item.i18n.push(i18n); }
              }); 
              params.EmployeeCompletion.skills.push(item);
         });
         
         $(".diplomas-ctn").each(function () {     
              var item = { i18n : [] };                
              $(".EmployeeDiploma[data-index="+$(this).attr('data-index')+"].Select option:selected").each(function () { item[$(this).parent().attr('name')]= $(this).val(); });   
              $(".EmployeeDiploma[data-index="+$(this).attr('data-index')+"].Input").each(function () { item[$(this).attr('name')]= $(this).val(); });   
              $(".EmployeeDiplomaLanguages[data-index="+$(this).attr('data-index')+"] option").each(function () { 
                  var i18n = { };
                  $(".EmployeeDiplomaI18n[data-index="+$(this).attr('data-index')+"][data-lang="+$(this).val()+"]").each(function () { if ($(this).val()) i18n[$(this).attr('name')]=$(this).val(); });                  
                  if (Object.entries(i18n).length !==0) { i18n.lang = $(this).val(); item.i18n.push(i18n); }
              });     
              params.EmployeeCompletion.diplomas.push(item);
         });   
          
          return $.ajax2({ data : params,     
                           files: ".files",
                           url: "{url_to('employees_ajax',['action'=>'SaveCompletion'])}",
                           target: "#page-wrapper"}); 
        }); 
     
      $("#EmployeeAvatar-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employees_ajax',['action'=>'DeleteAvatar'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteAvatar') return ;
                                     $("#avatar-ctn").html("")
                                }
                     });
    });
      
      
      
      
     $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
     $("#DialogCategories").click(function () { 
           var params = { EmployeeCategory : {   selection : [ ],  token : '{mfForm::getToken('EmployeePartnerWorkCategorySelectionForm')}' } };      
            $(".EmployeeCategories-list").each(function() { params.EmployeeCategory.selection.push($(this).attr('id'));  }); 
             return $.ajax2({      
                         data : params,
                         url:"{url_to('employees_ajax',['action'=>'ListPartialDialogCategoryForMyProfile'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
       $("#AddCategories").click(function () { 
            var params = { AddCategoriesForMyProfile : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForMyProfileForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employees_ajax',['action'=>'AddCategoriesForMyProfile'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
      
     $(".EmployeeCategory-Delete").click(function () {            
     {* if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  *}
            $(".EmployeeCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
     $("#languages").sortable({ 
     });
     {*$("#skills").sortable({ 
     });
     $("#diplomas").sortable({ 
     });*}
     
      $(".Employee[name=username]").keyup(function () { 
            if ($(this).val().length === 0 || $(this).val().length < 3) {
                $(".correctForm").css("display","none");
                $(".inCorrectForm").css("display","none");
                return ; 
            }
           // if ($(this).val().length < 3) return ;                   
            return $.ajax2({
                  data : { EmployeeUsernameCheck : {  username: $(this).val(), token : '{mfForm::getToken('EmployeeCheckUsernameForm')}' } },
                  url: "{url_to('employees_ajax',['action'=>'CheckUsername'])}",    
                  success : function (resp) {   
                        if (resp.errors)
                        {
                            $(".correctForm").css("display","none");
                            $(".inCorrectForm").css("display","block");
                        }
                        else{
                            $(".inCorrectForm").css("display","none");
                            $(".correctForm").css("display","block");
                        }
                    }                    
              });
     });
     {/JqueryScriptsReady}
</script>    