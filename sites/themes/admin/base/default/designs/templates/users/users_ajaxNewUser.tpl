{messages}
        <!-- Begin page heading -->
          <div class="row">
            <div class="col-sm-6">
              <h5 class="page-heading">{__('Users')} <small>{__('New user')}</small></h5>
            </div>
            <div class="col-sm-6">
              <div class="the-box full text-right no-border transparent buttons-bar">
                    <div style="float: right;">
                        <a href="#" id="Save" class="btn btn-success admin-header-button">
                            <i class="fa fa-save" style=" margin-right:10px;"></i>
                        {__('Create')}</a>
                        <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                            <i style="margin-right: 5px;" class="fa fa-times" style="margin-right:10px;"></i>
                        {__('Cancel')}</a>
                    </div>
              </div>
            </div>  
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <ol class="breadcrumb default square rsaquo sm rounded-0" style="font-size: 12px;">
            <li>
              <a href="#"><i class="fa fa-home" style="color: #37BC9B;"></i></a>
            </li>
             <li class="active item-list" ><a href="#">{__('Users')}</a></li>
            <li class="active item-list" >{__('New user')}</li>
  
          </ol>
          <!-- End breadcrumb -->

          <!-- Begin Add User -->
          <div class="the-box bg-white p-3">                  
                    <div class="row">
                      <div class="form-group col-md-4">
                        <label for="user_email">{__('E-mail')}</label>
                        <div class="field_with_errors"><input class="form-control Fields Input User" type="email" value="" name="email" id="user_email"></div>
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_firstname">{__('First name')}</label>
                        <input class="form-control Fields Input User" type="text" value="" name="firstname" id="user_firstname">
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_lastname">{__('Last name')}</label>
                        <input class="form-control Fields fields Input User" type="text" value="" name="lastname" id="user_lastname">
                      </div>
                      
                    
                      <div class="form-group col-md-4 p-4">
                        <input class="Checkboxs Fields Checkbox" type="checkbox" value="1" name="is_fictive_email" id="user_is_fictive_email">
                        <label for="user_is_fictive_email">{__('Is fictive e-mail ?')}</label>
                        <!-- <input name="user[is_fictive_email]" type="hidden" value="0"> -->
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_role" >{__('Role')}</label>
                        <select class="form-control form-control-chosen" name="user[role]" id="user_role" style="display:none;">
                          <option value=""></option>
                          <option value="admin">admin</option>
                          <option value="country_admin">country_admin</option>
                          <option value="sponsor">sponsor</option>
                          <option value="representative">representative</option>
                          <option value="doctor">doctor</option> 
                        </select>                
                      </div>
                      
                    
                  <div class="form-group col-md-4">
                        <label for="user_profession_id">{__('Profession')}</label>
                        <select class="form-control form-control-chosen" name="user[profession_id]" id="user_profession_id" style="display: none;">
                  <option value="">No profession</option>
                  <option value="1">Physician</option>
                  <option value="2">Veterinarian</option>
                  <option value="3">Pharmacist</option>
                  <option value="4">Nurse</option>
                  <option value="5">Animal Breeder</option>
                  <option value="6">Marketing Pharma</option>
                  <option value="7">Health Media</option>
                  <option value="8">Other</option>
                  <option value="9">Medical Student</option>
                  <option value="10">Representative pharma</option>
                  
                  </select>    
                  </div>
                  
                      <div class="form-group col-md-4">
                        <label for="user_real_specialty_id">{__('Real Specialty')}</label>
                        <select class="form-control form-control-chosen" name="user[real_specialty_id]" id="user_real_specialty_id" style="display:none;">
                  <option value="">No specialty</option>
                  <option value="1">Cardiology</option>
                  <option value="2">Dentistry</option>
                  <option value="3">Dermatolgy</option>
                  <option value="4">Endocrinology</option>
                  <option value="5">Gastroenterology</option>
                  <option value="6">Geriatry</option>
                  <option value="7">Gynecology</option>
                  <option value="8">Hematology</option>
                  <option value="9">General Medecine</option>
                  <option value="10">Veterinary Medicine</option>
                  <option value="11">Neurology</option>
                  <option value="12">Oncology</option>
                  <option value="13">Ophtalmology</option>
                  <option value="14">ORL</option>
                  <option value="15">Pediatrics</option>
                  <option value="16">Pneumology</option>
                  <option value="17">Rheumatology</option>
                  <option value="18">Urology</option>
                  </select>
                  
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_physician_number">{__('National number')}</label>
                        <input class="form-control Input User" type="text" value="" name="physician_number" id="user_physician_number">
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_country_iso_code">{__('Country ISO code')}</label>
                        <input disabled="disabled" class="form-control Input User" type="text" name="country_iso_code" id="user_country_iso_code">
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_employer_name">{__('Employer Name')}</label>
                        <input class="form-control Input User" type="text" value="{$item->get('email')}" name="employer_name" id="user_employer_name">
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <label for="user_password">{__('Password')}</label>
                        <input autocomplete="off" class="form-control Input User" type="password" name="password" id="user_password">
                      </div>
                      
                    
                      <div class="form-group col-md-4">
                        <div class="field_with_errors"><label for="user_password_confirmation">{__('Password Confirmation')}</label></div>
                        <div class="field_with_errors"><input autocomplete="off" class="form-control Input User" type="password" name="password_confirmation" id="user_password_confirmation"></div>
                      </div>
                      
                    
                  
                        
                      <div class="form-group col-md-4">
                        <label for="country_id">{__('Country')}</label>
                        <select class="form-control form-control-chosen" name="content_group[country_id]" id="content_group_country_id" style="display:none;">
                        <option value="">Select a country</option>
                        <option value="1">Belgium</option>
                        <option value="6">Default</option>
                        <option value="3">Demo</option>
                        <option value="15">France</option>
                        <option value="5">Luxembourg</option>
                        <option value="7">Morocco</option>
                        <option value="4">Russia</option>
                        <option value="2">Test</option> 
                      </select>
                  
                      </div>
                      
<!-- 
                      <div id="specialty-select-container" class="col-sm-4">
                      </div>
                      <div id="language-select-container" class="col-sm-4">
                      </div> -->

                      <div class=" col-md-4">
                        <label for="user_sponsor_id">{__('Sponsor')}</label>
                        <select id="single" class="form-control form-control-chosen" data-placeholder="Please select...">
                <option></option>
                <option>Option One</option>
                <option>Option Two</option>
                <option>Option Three</option>
                <option>Option Four</option>
                <option>Option Five</option>
                <option>Option Six</option>
                <option>Option Seven</option>
                <option>Option Eight</option> 
              </select><!-- <div class="chosen-container chosen-container-single" style="width: 1037px;" title="" id="user_sponsor_id_chosen"><a class="chosen-single" tabindex="-1"><span>No sponsor</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off"></div><ul class="chosen-results"></ul></div></div> -->
                      </div>

                      <div class="form-group col-md-12">
                        <label for="user_authorized_specialties">{__('Authorized specialities')}</label>
                        <div class="the-box full no-border">
                          <div class="row mx-0">
                      
                                    <div class="col-md-12 text-white p-2 pl-5" style="background: #37BC9B;"><b>Name</b></div>

                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="1" value="">
                                      <label for="1">CardioConnect</label>
                                    </div>
                                                                     
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="2" value="">
                                      <label for="2">DemoConnect</label>
                                    </div>
                                
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="3" value="">
                                      <label for="3">DemoConnect</label>
                                    </div>
                                                                    
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="4" value="">
                                      <label for="4">CardioConnect</label>
                                    </div>
                                                                     
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="5" value="">
                                      <label for="5">DemoConnect</label>
                                    </div>
                                
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="6" value="">
                                      <label for="6">DemoConnect</label>
                                    </div>

                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="7" value="">
                                      <label for="7">CardioConnect</label>
                                    </div>
                                                                     
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="8" value="">
                                      <label for="8">DemoConnect</label>
                                    </div>
                                
                                    <div class="col-md-3 col-sm-4 col-6 my-1 Speciality">
                                      <input type="checkbox" class="Checkboxs Input User" name="" id="9" value="">
                                      <label for="9">DemoConnect</label>
                                    </div>
                          </div>
                        </div>
                      </div>

                      <div class="form-group col-md-12 mt-2">
                  {*<button name="button" id="New"  class="btn btn-primary btn-square square rounded-0"><i class="fa fa-plus"></i>{__('Create')}</button></div>*}
                </div>                  
            </div>
                <!-- End Add User -->
        



{*


<fieldset>
    <legend><h3>{__("New user")}</h3></legend>
<div>
    <a href="#" id="Save" class="btn btn-primary" style="display:none">
          <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
         {__('Save')}</a>
    <a href="#" id="Cancel" class="btn btn-primary">
        <i class="fa fa-times" style="margin-right:10px;"></i>
        {__('Cancel')}</a>
</div>
<div class="tab-form form col-md-6" cellspacing="0">
    <div class="form-group">
          <div {if $form.sex->hasError()} class="alert alert-danger"{/if}>{$form.sex->getError()}</div>                
          <label>{__("Title")}{if $form->getValidator('sex')->getOption('required')}*{/if}</label>
                 {foreach $form->sex->getOption("choices") as $name=>$sex}
                     <div class="choicesGender">  
                     <input type="radio" class="User " name="sex" value="{$name}" {if $item->get('sex')==$name}checked="checked"{/if}/>
                        <label class="" for="{$name}">{format_gender($sex,1,true)|capitalize}</label>
                        <span></span>
                     </div>
                 {/foreach} 
                
         </div>
    <div class="form-group">
        <label>{__("Username")}{if $form->username->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.username->getError()}</div> 
            <input type="text" class="User form-ctr" name="username" value="{$item->get('username')|escape}" size="30"/>
        </div>
    </div>
       <div>
        <label>{__("Lastname")}{if $form->lastname->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.lastname->getError()}</div> 
            <input type="text" class="User form-ctr" name="lastname" value="{$item->get('lastname')|escape}" size="30"/>
        </div>
    </div>
    <div class="form-group">
        <label>{__("Firstname")}{if $form->firstname->getOption('required')}*{/if}</label>
        <td>
            <div class="error-form">{$form.firstname->getError()}</div>  
            <input type="text" class="User form-ctr" name="firstname" value="{$item->get('firstname')|escape}" size="30"/>
        </td>
    </div>
 
    <div class="form-group">
        <label>{__("Email")}{if $form->email->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.email->getError()}</div> 
            <input type="text" class="User form-ctr" name="email" value="{$item->get('email')|escape}" size="30"/>
        </div>
    </div>  
     <div class="form-group">
        <label>{__("mobile")}{if $form->mobile->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.mobile->getError()}</div> 
            <input type="text" class="User form-ctr" name="mobile" value="{$item->get('mobile')|escape}" size="30"/>
        </div>
    </div> 
      <div class="form-group">
        <label>{__("Password")}{if $form->password->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.password->getError()}</div> 
            <input type="password" class="User form-ctr" name="password" value="" size="30"/>
        </div>
    </div> 
      <div class="form-group">
        <label>{__("Repassword")}{if $form->repassword->getOption('required')}*{/if}</label>
        <div> 
            <div class="error-form">{$form.repassword->getError()}</div> 
            <input type="password" class="User form-ctr" name="repassword" value="" size="30"/>
        </div>
    </div> 
 </div> 
            {if $form->hasValidator('groups')}
<h4>{__('Groups')}</h4>
  {if $form->groups->getOption('choices')}        
        <div class="formulair col-md-6">
        {foreach $form->groups->getOption('choices') as $id=>$group}
            <div class="form-group-div form-group">
                    <input type="checkbox" class="UserGroup" id="{$id}" {if in_array($id,(array)$form->getDefault('groups'))}checked="checked"{/if}/><span>{__($group->get('name'),[],'groups')}</span>
            </div>
        {/foreach}  
        </div>
    {/if}
{/if}    
 </fieldset>
 


<script type="text/javascript">
        
        $('#Cancel').click(function(){  return $.ajax2({ 
                        url: "{url_to('users_ajax',['action'=>'ListPartialUser'])}",                      
                        target: "#actions"}); 
        });
         
        $(".User,.UserFunction,.UserGroup").click(function() { $("#Save").show(); });
        
     
         
        $('#Save').click(function(){ 
              var params= { User: { team_id:  $(".User[name=team_id] option:selected").val(), 
                                    functions : [], groups : [],
                                    token :'{$form->getCSRFToken()}' } };
              $("input.User[type=text]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.User[type=radio]:checked").each(function() { params.User[this.name]=$(this).val(); }); 
              $("input.User[type=password]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.UserFunction[type=checkbox]:checked").each(function() { params.User.functions.push($(this).attr('id')); });               
              $("input.UserGroup[type=checkbox]:checked").each(function() { params.User.groups.push($(this).attr('id')); });
          //    console.log(params);
              return  $.ajax2({  data: params, 
                              //  files: ".files",
                                url: "{url_to('users_ajax',['action'=>'NewUser'])}",                              
                                target: "#actions"
                               }); 
        });  
    
    $(".User[name=email]").focusout(function(){  
       $(".errors").messagesManager('clear');
       if ($(this).val().indexOf('@')==-1)
           return ;
       return $.ajax2({  data: { UserEmail : { email: $(this).val(),token:"{mfForm::getToken('UserNewCheckEmailForm')}" } },                               
                                url: "{url_to('users_ajax',['action'=>'NewUserCheckEmail'])}",                                
                                sucess: function (resp)
                                        {
                                            
                                        }
                               });
    });
    
    $(".User[name=email]").keyup(function(){  
       $(".errors").messagesManager('clear');
       if ($(this).val().length < 6 || $(this).val().indexOf('@')==-1)
           return ;     
       return $.ajax2({  data: { UserEmail : { email: $(this).val(),token:"{mfForm::getToken('UserNewCheckEmailForm')}" } },                               
                                url: "{url_to('users_ajax',['action'=>'NewUserCheckEmail'])}",                              
                                sucess: function (resp)
                                        {
                                            
                                        }
                               });
    });
</script>
*}


 <script type="text/javascript">

  
        $('.form-control-chosen').chosen({
  allow_single_deselect: true,
  width: '100%'
}); 



$('#Cancel').click(function(){ return $.ajax2({ 
                    url: "{url_to('users_ajax',['action'=>'ListPartialUser'])}",                    
                    target: "#actions" });
         });
         
         
         $('#Save').click(function(){ 
              var params= { User: { team_id:  $(".User[name=team_id] option:selected").val(), 
                                    functions : [], groups : [],
                                    token :'{$form->getCSRFToken()}' } };
              $("input.User[type=text]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.User[type=radio]:checked").each(function() { params.User[this.name]=$(this).val(); }); 
              $("input.User[type=password]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.UserFunction[type=checkbox]:checked").each(function() { params.User.functions.push($(this).attr('id')); });               
              $("input.UserGroup[type=checkbox]:checked").each(function() { params.User.groups.push($(this).attr('id')); });
          //    console.log(params);
              return  $.ajax2({  data: params, 
                              //  files: ".files",
                                url: "{url_to('users_ajax',['action'=>'NewUser'])}",                              
                                target: "#actions"
                               }); 
        }); 

    </script>