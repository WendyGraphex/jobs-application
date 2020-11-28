{messages class="{$site->getSiteID()}-site-errors"}
<h3>{__("New user")}</h3>
<div>
    <a href="#" id="{$site->getSiteID()}-Save" class="btn" style="display:none">
          <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
          {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
    <a href="#" id="{$site->getSiteID()}-Cancel" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
<table class="tab-form" cellspacing="0">
      <tr>
          <td class="label">{__("title")}</td>
             <td> 
                 <div class="error-form">{$form.sex->getError()}</div>                
                 {foreach $form->sex->getOption("choices") as $name=>$gender}
                        <input type="radio" class="{$site->getSiteID()}-User" name="sex" value="{$name}" {if $item->get('sex')==$name}checked="checked"{/if}/>
                        <span for="id_gender" class="top">{format_gender($gender,1,true)|capitalize}</span>
                 {/foreach} {if $form->getValidator('sex')->getOption('required')}*{/if}
             </td>
         </tr>
    <tr>
        <td class="label">{__("username")}</td>
        <td> 
            <div class="error-form">{$form.username->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-User" name="username" value="{$item->get('username')|escape}" size="30"/>{if $form->username->getOption('required')}*{/if}
        </td>
    </tr>
    <tr>
        <td class="label">{__("firstname")}</td>
        <td>
            <div class="error-form">{$form.firstname->getError()}</div>  
            <input type="text" class="{$site->getSiteID()}-User" name="firstname" value="{$item->get('firstname')|escape}" size="30"/>{if $form->firstname->getOption('required')}*{/if}
        </td>
    </tr>
    <tr>
        <td class="label" >{__("lastname")}</td>
        <td> 
            <div class="error-form">{$form.lastname->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-User" name="lastname" value="{$item->get('lastname')|escape}" size="30"/>{if $form->lastname->getOption('required')}*{/if}
        </td>
    </tr>
    <tr>
        <td class="label">{__("email")}</td>
        <td> 
            <div class="error-form">{$form.email->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-User" name="email" value="{$item->get('email')|escape}" size="30"/>{if $form->email->getOption('required')}*{/if}
        </td>
    </tr> 
     <tr>
        <td class="label">{__("mobile")}</td>
        <td> 
            <div class="error-form">{$form.mobile->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-User" name="mobile" value="{$item->get('mobile')|escape}" size="30"/>{if $form->mobile->getOption('required')}*{/if}
        </td>
    </tr> 
     <tr>
        <td class="label">{__("Password")}</td>
        <td> 
            <div class="error-form">{$form.password->getError()}</div> 
            <input type="password" class="{$site->getSiteID()}-User" name="password" value="" size="30"/>{if $form->password->getOption('required')}*{/if}
        </td>
    </tr> 
      <tr>
        <td class="label">{__("Repassword")}</td>
        <td> 
            <div class="error-form">{$form.repassword->getError()}</div> 
            <input type="password" class="{$site->getSiteID()}-User" name="repassword" value="" size="30"/>{if $form->repassword->getOption('required')}*{/if}
        </td>
    </tr> 
    <tr>
        <td class="label">{__('Team')}</td>
        <td>
            <div class="error-form">{$form.team_id->getError()}</div> 
            {html_options_format format="__" class="`$site->getSiteID()`-User" name="team_id" options=$form->team_id->getOption('choices') selected=$item->get('team_id')}
        </td>
    </tr>
   {* <tr>
        <td>{__('picture')}:</td>
        <td>
                    <div class="errors_newuser_form" id="error_newuser_picture"></div> 
                    <div>
                        <a id="AddPicture" class="pictureNotExist" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>{__('add picture')|capitalize}</a> 
                    </div>
                    <div id="picture" style="display:none">
                          <input class="{$site->getSiteID()}-files" type="file" name="User[picture]"/> 
                    </div> 
         </td>
    </tr>     *}   
</table>  

<h4>{__('Functions')}</h4>
{if $form->functions->getOption('choices')}        
    <table class="tab-form">
    {foreach $form->functions->getOption('choices') as $id=>$function}
        <tr>
            <td>
                <input type="checkbox" class="{$site->getSiteID()}-UserFunction" id="{$id}" {if in_array($id,(array)$form->getDefault('functions'))}checked="checked"{/if}/><span>{$function}</span>
            </td>
        </tr>
    {/foreach}  
    </table>
{/if}

<h4>{__('Groups')}</h4>
  {if $form->groups->getOption('choices')}        
        <table class="tab-form">
        {foreach $form->groups->getOption('choices') as $id=>$group}
            <tr>
                <td>
                    <input type="checkbox" class="{$site->getSiteID()}-UserGroup" id="{$id}" {if in_array($id,(array)$form->getDefault('groups'))}checked="checked"{/if}/><span>{$group}</span>
                </td>
            </tr>
        {/foreach}  
        </table>
    {/if}
<script type="text/javascript">
        
        $('#{$site->getSiteID()}-Cancel').click(function(){  return $.ajax2({ 
                        url: "{url_to('users_site_ajax',['action'=>'ListPartial'])}",
                        loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                        errorTarget: ".{$site->getSiteID()}-site-errors",
                        target: "#{$site->getSiteID()}-actions"}); 
        });
         
        $(".{$site->getSiteID()}-User,.{$site->getSiteID()}-UserGroup,.{$site->getSiteID()}-UserFunction").click(function() { $("#{$site->getSiteID()}-Save").show(); });
        
      {*  $("#{$site->getSiteID()}-AddPicture").click(function() {
             $("#{$site->getSiteID()}-picture").show();
             $(this).hide();
         }); *}
         
        $('#{$site->getSiteID()}-Save').click(function(){ 
              var params= { User: { team_id:  $(".{$site->getSiteID()}-User[name=team_id] option:selected").val(), 
                                    functions : [], groups : [],
                                    token :'{$form->getCSRFToken()}' } };
              $("input.{$site->getSiteID()}-User[type=text]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.{$site->getSiteID()}-User[type=password]").each(function() { params.User[this.name]=$(this).val(); });
              $("input.{$site->getSiteID()}-User[type=radio]:checked").each(function() { params.User[this.name]=$(this).val(); });
              $("input.{$site->getSiteID()}-UserFunction[type=checkbox]:checked").each(function() { 
                                    params.User.functions.push($(this).attr('id')); 
                                }); 
               $("input.{$site->getSiteID()}-UserGroup[type=checkbox]:checked").each(function() { 
                                    params.User.groups.push($(this).attr('id')); 
                                }); 
                                
           //   alert("params"+params.toSource());
              return $.ajax2({  data: params, 
                              //  files: ".{$site->getSiteID()}-files",
                                url: "{url_to('users_site_ajax',['action'=>'NewUser'])}",
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                target: "#{$site->getSiteID()}-actions"
                               }); 
        });  
    
    $(".{$site->getSiteID()}-User[name=email]").focusout(function(){  
       $(".{$site->getSiteID()}-site-errors").messagesManager('clear');
       if ($(this).val().indexOf('@')==-1)
           return ;
       return $.ajax2({  data: { UserEmail : { email: $(this).val(),token:"{mfForm::getToken('UserNewCheckEmailForm')}" } },                               
                                url: "{url_to('users_site_ajax',['action'=>'NewUserCheckEmail'])}",
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                sucess: function (resp)
                                        {
                                            
                                        }
                               });
    });
    
    $(".{$site->getSiteID()}-User[name=email]").keyup(function(){  
       $(".{$site->getSiteID()}-site-errors").messagesManager('clear');
       if ($(this).val().length < 6 || $(this).val().indexOf('@')==-1)
           return ;     
       return $.ajax2({  data: { UserEmail : { email: $(this).val(),token:"{mfForm::getToken('UserNewCheckEmailForm')}" } },                               
                                url: "{url_to('users_site_ajax',['action'=>'NewUserCheckEmail'])}",
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                sucess: function (resp)
                                        {
                                            
                                        }
                               });
    });
  
</script>
