{messages}
{*<fieldset>*}
{*<div>
    {if $user->hasCredential([['superadmin','admin','settings_user_modify']])}
        {if $item->isLoaded()}<a href="#" id="Save" class="btn btn-primary" style="display:none">  
                <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
           {__('Save')}</a>{/if}
    {/if}
    <a href="#" id="Cancel" class="btn btn-primary">
         <i class="fa fa-times" style="margin-right:10px;"></i>
         {__('Cancel')}</a>
</div>*}

<div class="row">
    <div class="col-sm-6">
      <h5 class="page-heading">{__('Users')} <small>{__('Edit user')}</small></h5>
    </div>
    <div class="col-sm-6">
      <div class="the-box full text-right no-border transparent buttons-bar">
        <div class="col-sm" style="padding: 0;">
            <div style="float: right;">
                <a href="#" id="Save" class="btn btn-success admin-header-button">
                    <i class="fa fa-save" style=" margin-right:10px;"></i>
                {__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                    <i style="margin-right: 5px;" class="fa fa-times" style="margin-right:10px;"></i>
                {__('Cancel')}</a>
            </div>
        </div>
      </div>
    </div>  
</div>
            
            
    <ol class="breadcrumb default square rsaquo sm rounded-0" style="font-size: 12px;">
    <li>
      <a href="#"><i class="fa fa-home" style="color: #37BC9B;"></i></a>
    </li>
     <li class="active item-list" ><a href="#">{__('Users')}</a></li>
    <li class="active item-list" >{__('Edit user')}</li>

  </ol>
            
{*if $item->isLoaded()*} 
    
    
    <div class="the-box bg-white p-3">                  
        <div class="row">
            <div class="form-group col-md-2">
                            <label>{__("Gender")}{if $form->getValidator('sex')->getOption('required')}*{/if}</label>
                            <div {if $form.sex->hasError()}class="ClassError"{/if}>{$form.sex->getError()}</div> 
                           {foreach $form->getValidator('sex')->getOption('choices') as $name=>$sex}  
                               <label style="width: 30%;">
                                   <input type="radio"  class="User Radio" name="sex" value="{$name}" value="{$name}" {if $item->get('sex')==$name}checked="checked"{/if}> {$sex}
                               </label>
                           {/foreach}
            </div>     
            <div class="col-md-5">
                <div class="form-group">
                    <div class="error-form">{$form.firstname->getError()}</div>  
                    <label>{__("Firstname")}{if $form->firstname->getOption('required')}*{/if}</label>
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="firstname" value="{$item->get('firstname')|escape}" size="30"/> 
                </div>
            </div>
            <div class="form-group col-md-5">
                <div class="form-group">
                    <div class="error-form">{$form.lastname->getError()}</div> 
                    <label>{__("Lastname")}{if $form->lastname->getOption('required')}*{/if}</label>
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="lastname" value="{$item->get('lastname')|escape}" size="30"/>
                </div>
            </div>
        </div>
   {*============================ second row ======================*}
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="error-form">{$form.username->getError()}</div> 
                    <label>{__("Username")}{if $form->username->getOption('required')}*{/if}</label>
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if}name="username" value="{$item->get('username')|escape}" size="30"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <div class="error-form">{$form.email->getError()}</div> 
                    <label>{__("Email")}{if $form->email->getOption('required')}*{/if}</label>
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="email" value="{$item->get('email')|escape}" size="30"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="error-form">{$form.mobile->getError()}</div> 
                <label>{__("Mobile")}{if $form->mobile->getOption('required')}*{/if}</label>
                <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="mobile" value="{$item->get('mobile')|escape}" size="30"/>
            </div> 
        </div>
{*============================ Third row ======================*}
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="error-form">{$form.updated_at->getError()}</div> 
                    <label>{__("Updated at")}</label>
                    {*<span>{$item->get('updated_at')|escape}</span>*}
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="updated_at" value="{$item->get('updated_at')|escape}{*$item->getFormatter()->getLastname()->getFormatted()*}" size="30"/>
                </div> 
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <div class="error-form">{$form.lastlogin->getError()}</div>
                    <label>{__("Last login")}</label>
                    <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="lastlogin" value="{$item->get('lastlogin')|escape}" size="30"/>
                </div> 
            </div>
            <div class="col-md-4">
                 <div class="form-group">
                     <div class="error-form">{$form.last_password_gen->getError()}</div>
                     <label>{__("Last password")}</label>
                     <input type="text" class="User Fields input-text form-control" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="last_password_gen" value="{$item->get('last_password_gen')|escape}" size="30"/>
                 </div> 
             </div>
        </div>
             
    </div>  

    
    
    
{*   <div class="form col-md-6"> 
             <label>{__("Title")}</label>
             <div class="form-group">              
               <div class="error-form">{$form.sex->getError()}</div> 
                {foreach $form->sex->getOption("choices") as $name=>$gender}
                    <div class="choicesGender">
                        {if $user->hasCredential([['superadmin','admin','settings_user_modify']])}
                        <input type="radio" class="User" name="sex" value="{$name}" {if $item->get('sex')==$name}checked="checked"{/if}/>
                        {else}
                        <input type="radio" name="sex" disabled="disabled" value="{$name}" {if $item->get('sex')==$name}checked="checked"{/if}/>
                        {/if}    
                        <label>{format_gender($gender,1,true)|capitalize}</label>
                    </div>
                 {/foreach}                
   
           </div>
               
         <div class="form-group">
             <div class="error-form">{$form.username->getError()}</div> 
             <label>{__("Username")}{if $form->username->getOption('required')}*{/if}</label>
             <input type="text" class="User Fields" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if}name="username" value="{$item->get('username')|escape}" size="30"/>
         </div>
         <div class="form-group">
             <div class="error-form">{$form.firstname->getError()}</div>  
             <label>{__("Firstname")}{if $form->firstname->getOption('required')}*{/if}</label>
             <input type="text" class="User Fields" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="firstname" value="{$item->get('firstname')|escape}" size="30"/> 
         </div>
         <div class="form-group">
             <div class="error-form">{$form.lastname->getError()}</div> 
             <label>{__("Lastname")}{if $form->lastname->getOption('required')}*{/if}</label>
             <input type="text" class="User Fields" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="lastname" value="{$item->get('lastname')|escape}" size="30"/>
         </div>
         <div class="form-group">
             <div class="error-form">{$form.email->getError()}</div> 
             <label>{__("Email")}{if $form->email->getOption('required')}*{/if}</label>
            <input type="text" class="User Fields" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="email" value="{$item->get('email')|escape}" size="30"/>
         </div>
        <div class="form-group">
       <div class="error-form">{$form.mobile->getError()}</div> 
        <label>{__("Mobile")}{if $form->mobile->getOption('required')}*{/if}</label>
            <input type="text" class="User Fields" {if !$user->hasCredential([['superadmin','admin','settings_user_modify']])}disabled="disabled"{/if} name="mobile" value="{$item->get('mobile')|escape}" size="30"/>
       </div>          
         <div class="form-group">
             <label>{__("Updated at")}</label>
                 <span>{$item->get('updated_at')|escape}</span>
          
         </div>  
        <div class="form-group">
            <label>{__("Last login")}</label>
                 <span>{$item->get('lastlogin')|escape}</span>
        </div>      
        <div class="form-group">
             <label>{__("Last password generated")}</label>
                 <span>{$item->get('last_password_gen')|escape}</span>
        </div>                          
   </div>  *}
{*else}
    <span>{__("This user is invalid.")}</span>
{*/if*}
    {*</fieldset>*}
<script type="text/javascript">

         $('#Cancel').click(function(){ return $.ajax2({ 
                    url: "{url_to('users_ajax',['action'=>'ListPartialUser'])}",                    
                    target: "#actions" });
         });
         
         {*$(".User").click(function() { $("#Save").show(); });*}
            
         $('#Save').click(function(){ 
                  var params= { User: { 
                                        id: "{$item->get('id')}", 
                                        team_id:  $(".User[name=team_id] option:selected").val(), 
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $("input.User[type=text]").each(function() { params.User[this.name]=$(this).val(); });                  
                  $("input.User[type=radio]:checked").each(function() { params.User[this.name]=$(this).val(); }); 
                  return $.ajax2({  data: params, 
                                    url: "{url_to('users_ajax',['action'=>'SaveUser'])}",                                   
                                    target: "#actions"}); 
         });
             
           $("[name=updated_at],[name=last_password_gen],[name=lastlogin]").datepicker();
          
</script>
