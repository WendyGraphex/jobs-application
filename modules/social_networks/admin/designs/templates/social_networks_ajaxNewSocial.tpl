<div class="row" style="margin: 0;padding-bottom: 10px;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("new social network")}</h3>
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
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New social network')}
                </p>
            </div>
{*<div class="row admin-header-container">
    <div class="col-sm">
        <h3>{__("new social network")|capitalize}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right; padding-top: 13px;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"></i>Save</a>
                  <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"></i>Cancel</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">    
   <p>      
       <i class="fa fa-home" style="color: #37bc9b;"></i>      
       <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
       <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Social networks')}
       <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New social network')}
   </p>
 </div>*}
{alerts}
  <div class="bg-white px-2 ">

   <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col py-5"> 
         {*<div class="row">
              <div class="col-md-6" >
                       <span>{__("Name")}{if $form->name->getOption('required')}*{/if}</span>
                       {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
                        <input type="text" class="form-control SocialNetwork Input socialnetwork-Input" name="name" value="{$item->get('name')|escape}"/>                       
              </div>
              <div class="col-md-6" >
                     <span>{__("Link")}{if $form->link->getOption('required')}*{/if}</span>
                         {if $form->hasErrors()}<div class="alert alert-{if $form.link->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.link->getError()}</div>{/if}      
                        <input type="text" class=" form-control SocialNetwork Input socialnetwork Input" name="link" size="50" value="{$item->get('link')|escape}"/>                                           
              </div>
         </div>
         <div class="row">
              <div class="col-md-6" >
                   <span>{__("Awe")}{if $form->awe->getOption('required')}*{/if}</span>
                    {if $form->hasErrors()}<div class="alert alert-{if $form.awe->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.awe->getError()}</div>{/if}      
                        <input type="text" class="form-control SocialNetwork Input" name="awe" value="{$item->get('awe')|escape}"/>                        
              </div>
              <div class="col-md-6">
                       <span>{__('Picture')}</span>
                        <div>{$form.picture->getError()}</div>    
                        <form id="uploadfile" action="{url_to('social_networks_ajax',['action'=>'NewSocial'])}" method="post" enctype="multipart/form-data">    
                                 <div>{$form.picture->getError()}</div>
                                 <input type="file" class="btnfile files" name="SocialNetwork[picture]"/>                                           
                        </form>   
              </div>
         </div>*}
         
        <div class="row">
            <div class="col-md-2">         
                <div class="form-group">
                    <label>{__('Picture')}</label> 
                    <div>{$form.picture->getError()}</div>
                    <div id="pictureForm">                            
                        <div class="custom-FileInput" id="DivLogo">
                            {*if $item->hasAvatar()*}
                                {*<img id="blah" alt="" src="{$item->getAvatar()->getURL('superadmin')}"/><br/>
                                {*else*}
                                    <img id="blah" alt="" style="display: none;" /><br/>
                            {*/if*}
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <a id="pictureAdd" href="javascript:void();" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                <input type='file' id="imgInp" hidden="" class="btnfile files" name="SocialNetwork[picture]"/>
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

<script type="text/javascript">        
    
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
    
    $('#DeletePicture').click(function(){ 
           if (!confirm('{__("picture will be deleted. Confirm ?")}')) return false; 
           return $.ajax2({ 
                             data : { SocialNetwork: "{$item->get('id')}" }, 
                             url: "{url_to('social_networks_ajax',['action'=>'DeletePictureSocial'])}",
                             success :function(response) {
                                         if (response.action=='DeletePictureSocial'&&response.id=="{$item->get('id')}")
                                         {                                                     
                                               $("#picture_container").hide(); 
                                               //$("span#text_picture").html("{__('Add picture')}");
                                         }
                             }
           });  
        }); 
    
    
    
         $(".Socialnetwork").click(function() {  $('#Save').show(); });                  
         
         $('#Cancel').click(function(){                                
             return $.ajax2({ url:"{url_to('social_networks_ajax',['action'=>'ListPartialSocial'])}",target: "#actions"}); 
         });
                           
         $('#Save').click(function(){                   
          var params= { SocialNetwork: { 
                                token :'{$form->getCSRFToken()}' 
                             } };
          $(".SocialNetwork.Input").each(function(id) { params.SocialNetwork[this.name]=$(this).val(); });           
          //    alert("Params="+params.toSource());                             
           return $.ajax2({ data : params,
                            files : ".files",     
                            url: "{url_to('social_networks_ajax',['action'=>'NewSocial'])}",target: "#actions"}); 
         });
         
         
</script>