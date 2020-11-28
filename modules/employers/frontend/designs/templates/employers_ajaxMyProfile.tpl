<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My profile')}</h2>                   
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

    <div class="card classMargin">
        <div class="card-body">   

            {include file="./includes/_myprofile_tabs.tpl"}

            {include file="./includes/_myprofile_panels.tpl"}
        </div>         
    </div>
</div>
                
                          
<script type="text/javascript">                  
    {include file="./includes/_myprofile_languages_js.inc"}   
      
    $(".EmployerUser").click(function(){ 
        $(".EmployerUser.Input").removeClass('intro');
    });
    
    $(".SelectLanguage").select2({
       width: 'resolve',
    });
      
    $('#pictureAdd').click(function() {
        $('#imgInp').click();
    });       
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
            reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
    $(".ModePicture").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconForPicture").removeClass('Normal fa fa-square-o').addClass('Inverse fa fa-square');
                $("#DivAvatar").css('background-color','rgb(155, 155, 155)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconForPicture").removeClass('Inverse fa fa-square').addClass('Normal fa fa-square-o');
                $("#DivAvatar").css('background-color','');
            }
   });
   
   {*=============================================================================================================*}
                  
      $('#Save').click(function(){                             
          var  params= { MyProfile: {   
                                categories :  [],  languages : [ ],
                                token :'{$form->getCSRFToken()}'
                             } };                              
          $(".EmployerUser.Input").each(function() { params.MyProfile[$(this).attr('name')]=$(this).val(); });                                       
          $(".EmployerUser.Select option:selected").each(function () { params.MyProfile[$(this).parent().attr('name')]=$(this).val(); });  
          $(".EmployerCategories").each(function () { params.MyProfile.categories.push($(this).attr('id')); });
          $(".languages-ctn").each(function (index) {     
              var item = { };  $(".EmployeeLanguage[data-index="+index+"]").each(function () { item[$(this).attr('name')]= $(this).val(); });           
              params.MyProfile.languages.push(item);
          });
          //  console.log(params);
          return $.ajax2({ data : params,    
                           files: ".files",
                           url: "{url_to('employers_ajax',['action'=>'MyProfile'])}",
                           target: "#page-wrapper"}); 
        }); 
     
     
       $("#EmployerUserAvatar-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employers_ajax',['action'=>'DeleteMyAvatar'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteMyAvatar') return ;
                                     $("#avatar-ctn").html("")
                                }
                     });
    });
    
    
    
    
     $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
     $("#DialogCategories").click(function () { 
           var params = { EmployerCategory : {   selection : [ ],  token : '{mfForm::getToken('EmployerPartnerWorkCategorySelectionForm')}' } };      
            $(".EmployerCategories-list").each(function() { params.EmployerCategory.selection.push($(this).attr('id'));  }); 
             return $.ajax2({      
                         data : params,
                         url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCategoryForMyProfile'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
       $("#AddCategories").click(function () { 
            var params = { AddCategoriesForMyProfile : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForMyProfileForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employers_ajax',['action'=>'AddCategoriesForMyProfile'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
      
     $(".EmployerCategory-Delete").click(function () {            
     {* if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  *}
            $(".EmployerCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
     
      $("#Birthday").datepicker({ maxDate : '-{$form->getSettings()->getMinAge()}Y' });
      
      
       $(".EmployerUser[name=username]").keyup(function () { 
            if ($(this).val().length < 3) return ;                   
            return $.ajax2({
                  data : { EmployerUsernameCheck : {  username: $(this).val(), token : '{mfForm::getToken('EmployerCheckUsernameForm')}' } },
                  url: "{url_to('employers_ajax',['action'=>'CheckUsername'])}",    
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
</script>    