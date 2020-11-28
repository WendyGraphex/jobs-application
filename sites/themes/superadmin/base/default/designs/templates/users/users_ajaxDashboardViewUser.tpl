{messages class="errors"}
<h3>{__("edit user")|capitalize}</h3>
<div>
    {if $user->isLoaded()}<a href="#" class="btn" id="Save" style="display:none">
             <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
             {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>{/if}
    <a href="#" id="List" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
{if $user->isLoaded()} 
    <table class="tab-form" cellpadding="0" cellspacing="0">
         <tr>
             <td class="label">{__("title")}</td>
           <td>
               <div class="error-form">&nbsp;{$form.sex->getError()}</div> 
                {foreach $form->sex->getOption("choices") as $name=>$gender}
                        <input type="radio" class="user" name="sex" value="{$name}" {if $user->get('sex')==$name}checked="checked"{/if}/>
                        <span>{format_gender($gender,1,true)|capitalize}</span>
                 {/foreach} 
           </td>
          </tr>       
         <tr>
             <td class="label">{__("username")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form.username->getError()}</div> 
                 <input type="text" class="user" name="username" value="{$user->get('username')|escape}" size="30"/>{if $form->getValidator('username')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("firstname")}</td>
             <td>
                <div class="error-form">&nbsp;{$form.firstname->getError()}</div>  
                <input type="text" class="user" name="firstname" value="{$user->get('firstname')|escape}" size="30"/>{if $form->getValidator('firstname')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("lastname")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form.lastname->getError()}</div> 
                 <input type="text" class="user" name="lastname" value="{$user->get('lastname')|escape}" size="30"/>{if $form->getValidator('lastname')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("email")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form.email->getError()}</div> 
                 <input type="text" class="user" name="email" value="{$user->get('email')|escape}" size="30"/>{if $form->getValidator('email')->getOption('required')}*{/if}
             </td>
         </tr>   
          <tr>
             <td class="label">{__("updated at")}</td>
             <td> 
                 <span>{$user->get('updated_at')|escape}</span>
             </td>
         </tr>   
         <tr>
             <td class="label">{__("last login")}</td>
             <td> 
                 <span>{$user->get('lastlogin')|escape}</span>
             </td>
         </tr>      
         <tr>
             <td class="label">{__("last password generated")}</td>
             <td> 
                 <span>{$user->get('last_password_gen')|escape}</span>
             </td>
         </tr>                
         <tr>
             <td class="label">{__('picture')}:</td>
            <td><div id="picture_container" {if !$user->get('picture')}style="display:none"{/if}>
                     <img id="user_picture" {if $user->get('picture')}src="{$user->getPicture()->getURL()}"{/if} height="128" alt="{__('my picture')}"/>
                     <span id="user_picture_filename">{$user->get("picture")}</span>
                     <a href="#" title="{__('delete')}" id="DeletePicture" name="{$user->get('id')}">
                        <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>
                     </a>
                 </div>
                 <a id="ChangePicture" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>
                      <span id="text_picture">
                          {if $user->get("picture")} {__('change picture')|capitalize} {else} {__('add picture')|capitalize} {/if}
                      </span>
                  </a>
                  <div id="picture" style="display:none">                     
                      <input class="files" type="file" name="user[picture]"/> 
                      <a href="#" id="Upload"><img id="upload" src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                      <img id="pictureLoading" height="16" width="16" src="{url('/icons/loading.gif?toto','picture')}" alt="" style="display:none;"> 
                  </div>
            </td>
         </tr>           
    </table>  
{else}
    <span>{__("this user doesn't exist")}</span>
{/if}

<script type="text/javascript">

         $('#List').click(function(){ return $.ajax2({ 
                    url: "{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}", 
                    target : "#actions" });
         });
         
         $(".user").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){ 
                  var params= { User: { 
                                        id: "{$user->get('id')}",
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $("input.user[type=text]").each(function() { params.User[this.name]=this.value; });                  
                  $("input.user[type=radio]:checked").each(function() { params.User[this.name]=$(this).val(); }); 
                  return $.ajax2({ data: params, 
                                   url: "{url_to('users_dashboard_ajax',['action'=>'DashboardSaveUser'])}", 
                                   target: "#actions"}); 
             });
             
         $('#DeletePicture').click(function(){ 
              if (!confirm('{__("picture  will be deleted. Confirm ?")}')) return false; 
              return $.ajax2({ 
                     data:{ User:"{$user->get('id')}" }, 
                     url: "{url_to('users_dashboard_ajax',['action'=>'DashboardDeletePictureUser'])}",
                     success: function(response) {
                                if (response.action=='deletePicture' && response.id=="{$user->get('id')}")
                                {
                                         
                                          $("#picture_container").hide(); 
                                          $("span#text_picture").html("{__('add picture')|capitalize}");
                                }
                             }
                  }); 
         });
          
         $('#ChangePicture,#AddPicture').click(function(){ 
              $("#picture").show();
              $(this).hide();
         });
         
         $('#Upload').click(function(){ 
                 return $.ajax2({ 
                     loading:"#pictureLoading",
                     data : { user: { 
                                        id: "{$user->get('id')}",
                                        token :"{mfForm::getToken('UserPictureForm')}"
                                     } },
                     url: "{url_to('users_dashboard_ajax',['action'=>'DashboardUserSavePicture'])}",
                     files: ".files",
                     success: function(response)
                              {
                                    if (response.picture)
                                   {    
                                        $("#user_picture").attr('src',"{$user->getPicture()->getURLPath()}"+response.picture+"?"+$.now());                                       
                                        $("#user_picture_filename").html(response.picture);
                                        $("#picture_container").show();
                                        $(".files").val('');     
                                        $("#picture").hide(); 
                                        $("span#text_picture").html("{__('change picture')|capitalize}");
                                        $("#ChangePicture").show(); 
                                   }  
                              }
                    }); 
            }); 
          
</script>
