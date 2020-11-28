
<div class="row" style="margin: 0;padding-bottom: 10px;">
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("View social network")}</h3>
    </div>

    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"></i>Save</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"></i>Cancel</a>
        </div>
    </div>

</div>

<div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
    width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>      
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Social networks')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View social network')}
    </p>
</div>
      

{alerts}
       
{if $item->isLoaded()} 
   
<div class="bg-white px-2 ">

   <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col py-5"> 
         {*<div class="row">
              <div class="col-md-6" >
                       <span>{__("Name")}</span>
                    
                        <div id="error_name">{$form.name->getError()}</div> 
                         <input type="text" class="form-control SocialNetwork socialnetwork-input" name="name" value="{$item->get('name')|escape}"/>
                           {if $form->name->getOption('required')}<span class="Socialetoile">*</span>{/if}
              </div>
              <div class="col-md-6" >
                     <span>{__("Link")}</span></td>
                               
                        <div id="error_link">{$form.link->getError()}</div>
                        <input type="text" class=" form-control SocialNetwork socialnetwork-input" name="link" size="50" value="{$item->get('link')|escape}"/>                   
                        {if $form->link->getOption('required')}<span class="Socialetoile">*</span>{/if} 
              </div>
         </div>
         <div class="row">
              <div class="col-md-6" >
                   <span>{__("Awe")}</span>
                    
                        <div class="div-require" id="error_name">{$form.awe->getError()}</div>
                        <input type="text" class="form-control SocialNetwork socialnetwork-input" name="awe" value="{$item->get('awe')|escape}"/>
                        {if $form->awe->getOption('required')}<span class="Socialetoile">*</span>{/if} 
              </div>
              <div class="col-md-6" >
                 <span>{__('Picture')}</span>
                        
                                 
                     <div id="error_picture"></div>                          
                     <div id="picture_container" {if !$item->get('picture')}style="display:none"{/if}>
                         <img id="product_picture" {if $item->get('picture')}src="{$item->getPicture()->getURL()}"{/if} height="48" width="48" alt="{__('picture')}"/>
                         <span id="product_picture_filename">{$item->get("picture")}</span>
                         <a href="#" title="{__('Delete')}" id="DeletePicture" name="{$item->get('id')}">
                            <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
                         </a>
                     </div>
                     <a id="ChangePicture" href="#"><img src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>
                          <span id="text_picture">
                              {if $item->get("picture")} {__('Change picture')} {else} {__('Add picture')} {/if}
                          </span>
                     </a>
                     <div id="picture" style="display:none">
                     <input class="filePicture socialnetwork-input btnfile" type="file" name="SocialNetwork[picture]"/> 
                     <a href="#" id="uploadPicture"><img id="upload" src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                     <img id="pictureLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
             </div>                 
              </div>
         </div>*}
       
         <div class="row">
            <div class="col-md-2">         
                <div class="form-group">
                    <label>{__('Picture')}</label> 
                    <div>{*$form.picture->getError()*}</div>
                    <div id="pictureForm">                            
                        <div class="custom-FileInput" id="DivLogo">
                             {if $item->get('picture')}
                                <img id="product_picture" alt="" src="{$item->getPicture()->getURL()}" /><br/>
                                <span id="product_picture_filename" style="display: none;">{$item->get("picture")}</span>
                                {else}
                                    <img id="product_picture" alt="" style="display: none;" /><br/>
                            {/if}
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <a id="pictureAdd" href="javascript:void();" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                <input type='file' id="imgInp" hidden="" class="filePicture socialnetwork-input btnfile" type="file" name="SocialNetwork[picture]"/>
                            </div>
                            <div class="col-md-2" style="padding-top: 8px;float: right !important;">
                                <div class="thumbnail media-lib-item parent">
                                    <a href="javascript:void();" class="list-action Mode" name="NORMAL" id="BtnInverse" style=""><i class="ModeIcon Normal far fa-square"></i></a>
                                </div>
                            </div>
                            <div class="col-md-2" style="padding-top: 6px;padding-left: 0px;">
                                <div class="thumbnail media-lib-item parent">
                                    <a href="#" title="{__('Delete')}" id="DeletePicture" name="{$item->get('id')}">
                                        <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>       
            </div>
        {*==========================================================================================*}
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-6" >
                    <span>{__("Name")}{if $form->name->getOption('required')}*{/if}</span>
                    {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
                    <input type="text" class="form-control SocialNetwork Input socialnetwork-Input" name="name" value="{$item->get('name')|escape}"/>                       
                </div>
                <div class="col-md-6" >
                    <span>{__("Awe")}{if $form->awe->getOption('required')}*{/if}</span>
                    {if $form->hasErrors()}<div class="alert alert-{if $form.awe->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.awe->getError()}</div>{/if}      
                    <input type="text" class="form-control SocialNetwork Input" name="awe" value="{$item->get('awe')|escape}"/>                        
                </div>
                <div class="col-md-12" >
                    <span>{__("Link")}{if $form->link->getOption('required')}*{/if}</span>
                    {if $form->hasErrors()}<div class="alert alert-{if $form.link->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.link->getError()}</div>{/if}      
                    <input type="text" class=" form-control SocialNetwork Input socialnetwork Input" name="link" size="50" value="{$item->get('link')|escape}"/>                                           
                </div>
            </div>
        </div>
        
        </div>
         
         
    </div>
   </div>
</div>
{else}
    <span>{__("Social network doesn't exist.")}</span>
{/if}

<script type="text/javascript">  
    
    
    $('#pictureAdd').click(function() {
            $('#imgInp').click();
         });

        $("#imgInp").change(function() {   
            if (this.files && this.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {  $('#product_picture').css('display','block').attr('src', e.target.result); };
              reader.readAsDataURL(this.files[0]);
            }        
        });



        $(".Mode").click(function(){
            if ($(this).attr('name')=='NORMAL'){
                $(this).attr('name','INVERSE');
                    $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                    $("#DivLogo").css('background-color','rgb(202, 202, 202)');
                }
                else
                {
                    $(this).attr('name','NORMAL');
                    $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                    $("#DivLogo").css('background-color','');
                }
        });
    
    
    
         $(".socialnetwork").click(function() {  $('#Save').show(); });                  
         
         $('#Cancel').click(function(){                                
             return $.ajax2({ url:"{url_to('social_networks_ajax',['action'=>'ListPartialSocial'])}",target: "#actions"}); 
         });
                           
         $('#Save').click(function(){                   
          var params= { SocialNetwork: { 
                                id: "{$item->get('id')}",token :'{$form->getCSRFToken()}' 
                             } };
          $("input.SocialNetwork").each(function(id) { params.SocialNetwork[this.name]=$(this).val(); });           
          //    alert("Params="+params.toSource());                             
           return $.ajax2({ data : params,url: "{url_to('social_networks_ajax',['action'=>'SaveSocial'])}",target: "#actions"}); 
         });
         
            {* =========== P I C T U R E ===================================== *}           
      
        $("#ChangePicture").click(function() {
           $("#picture").show();
           $(this).hide();
        });

        $('#uploadPicture').click(function(){ 
          return $.ajax2({ 
              loading:"#pictureLoading",
              data : { SocialNetwork: { 
                                 id: "{$item->get('id')}",
                                 token :"{mfForm::getToken('SocialNetworkPictureForm')}"
                              } },
              url: "{url_to('social_networks_ajax',['action'=>'SavePictureSocial'])}",
              files: ".filePicture",
              complete: function()
                        {
                            $(".filePicture").val('');       
                        },
              success: function(response)
                       {
                            if (response.picture)
                            {    
                                 $("#product_picture").attr('src',"{$item->getPicture()->getURLPath('superadmin')}"+response.picture+"?"+$.now()); 
                                 $("#product_picture_filename").html(response.picture);
                                 $("#picture_container").show();

                                 $("#picture").hide(); 
                                 $("span#text_picture").html("{__('change picture')|capitalize}");
                                 $("#ChangePicture").show();
                            }  
                       }
             }); 
        }); 

       $('#DeletePicture').click(function(){ 
           if (!confirm('{__("picture will be deleted. Confirm ?")}')) return false; 
           return $.ajax2({ 
                             data : { SocialNetwork: "{$item->get('id')}" }, 
                             url: "{url_to('social_networks_ajax',['action'=>'DeletePictureSocial'])}",
                             success :function(response) {
                                         if (response.action=='DeletePictureSocial'&&response.id=="{$item->get('id')}")
                                         {           
                                                $("#product_picture").css('display','none');
                                                //$("#picture_container").hide(); 
                                                $("span#text_picture").html("{__('Add picture')}");
                                         }
                             }
           });  
        }); 

        {JqueryScriptsReady} 
             

   
        {/JqueryScriptsReady} 
</script>