{messages class="errors"}
<h3>{__("new user")|capitalize}</h3>
<div>
    <a href="#" id="Save" class="btn" style="display:none">
        <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
        {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
    <a href="#" id="Cancel" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
<table class="tab-form" cellpadding="0" cellspacing="0">
    <tr>
        <td class="label">{__("title")}</td>
             <td> 
                 <div class="errors_newuser_form" id="error_newuser_sex"></div>                
                 {foreach $form->sex->getOption("choices") as $name=>$gender}
                        <input type="radio" class="user" name="sex" value="{$name}" {if (string)$form.sex==$name}checked="checked"{/if}/>
                        <span for="id_gender" class="top">{format_gender($gender,1,true)|capitalize}</span>
                 {/foreach} {if $form->getValidator('sex')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("username")}</td>
             <td> 
                 <div class="errors_newuser_form" id="error_newuser_username"></div> 
                 <input type="text" class="user" name="username" value="{$user->get('username')|escape}" size="30"/>{if $form->getValidator('username')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("firstname")}</td>
             <td>
                <div class="errors_newuser_form" id="error_newuser_firstname"></div>   
                <input type="text" class="user" name="firstname" value="{$user->get('firstname')|escape}" size="30"/>{if $form->getValidator('firstname')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("lastname")}</td>
             <td> 
                <div class="errors_newuser_form" id="error_newuser_lastname"></div> 
                 <input type="text" class="user" name="lastname" value="{$user->get('lastname')|escape}" size="30"/>{if $form->getValidator('lastname')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("email")}</td>
             <td> 
                 <div class="errors_newuser_form" id="error_newuser_email"></div> 
                 <input type="text" class="user" name="email" value="{$user->get('email')|escape}" size="30"/>{if $form->getValidator('email')->getOption('required')}*{/if}
             </td>
         </tr>       
          <td class="label">{__('picture')}:</td>
            <td>
                <div class="errors_newuser_form" id="error_newuser_picture"></div> 
                <div>
                    <a id="AddPicture" class="pictureNotExist" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>{__('add picture')|capitalize}</a> 
                </div>
                <div id="picture" style="display:none">
                      <input class="files" type="file" name="user[picture]"/> 
                </div>
            </td>
    </tr>  
    </table>  
<script type="text/javascript">
 
         $('#Cancel').click(function(){ return $.ajax2({ 
                    loading: "#tab-dashboard-superadmin-loading",
                    url: "{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}",
                    target: "#actions" }); });
         
         $(".user").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){ 
              var params= { user: { token :'{$form->getCSRFToken()}' } };
              $("input.user[type=text]").each(function() { params.user[this.name]=$(this).val(); });
              $("input.user[type=radio]:checked").each(function() { params.user[this.name]=$(this).val(); });
              return $.ajax2({ data: params, 
                               files: ".files",
                               url: "{url_to('users_dashboard_ajax',['action'=>'DashboardNewUserSave'])}",
                               success: function (response)
                                       {
                                           $(".errors_newuser_form").html(""); // clear form error fields 
                                           if (response.errors)
                                              $.each(response.errors,function(id,value) {  $("#error_newuser_"+id).html(value); });
                                           if (response.info)
                                              return $.ajax2({ 
                                                 loading: "#tab-dashboard-superadmin-loading",
                                                 url: "{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}",
                                                 target: "#actions",
                                                 success: function () { $(".errors").messagesManager('info',response.info); }
                                                });
                                       }
                               }); 
        });  
             
        $('#AddPicture').click(function(){ 
               $("#picture").show();
             $(this).hide();
        });
     
</script>
