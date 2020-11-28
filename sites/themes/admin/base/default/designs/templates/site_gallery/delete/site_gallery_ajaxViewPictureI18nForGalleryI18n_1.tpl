{messages class="errors"}
{if $picture_gallery->isLoaded()}
    <div class="row" style="width: 100%; ">
        <div class="col-sm-6" style="">
            <h3>{__("View picture [%s] for [%s] gallery",[$picture_gallery->getPicture()->getI18n()->get('title'),$picture_gallery->getGallery()->getI18n()->get('title')])}</h3>
        </div>
        <div class="col-sm-6" style="">
            <div style="float: right;">
                <a href="#" class="btn btn-primary" id="Save" style="display:none">
                    <i class="fa fa-floppy-o" style=" margin-right: 10px;"></i>
                    {__('Save')}
                </a>
                <a href="#" class="btn btn-primary" id="Cancel">
                    <i class="fa fa-times" style=" margin-right: 10px;"></i>
                    {__('Cancel')}
                </a> 
            </div>
        </div>
    </div>
        
  <table cellpadding="0" cellspacing="0">
    <tr>
        <td></td>
        <td><img  name="lang" src="{url("/flags/`$picture_gallery->getPicture()->getI18n()->get('lang')|default:"__"`.png","picture")}" title="{format_country($picture_gallery->getPicture()->getI18n()->get('lang'))}" /></td>
    </tr>
      <tr>
        <td>{__('Name')}</td>
        <td>
            <div class="errors-form">{$form.picture.name->getError()}</div>
            <input type="text" class="Picture Input" name="name" value="{$picture_gallery->getPicture()->get('name')}"/>
            <span>{if $form->picture.name->getOption('required')}*{/if}</span>
        </td>
    </tr> 
    <tr>
        <td>{__('Title')}</td>
        <td>
            <div class="errors-form">{$form.picture_i18n.title->getError()}</div>
            <input type="text" class="PictureI18n Input" name="title" value="{$picture_gallery->getPicture()->getI18n()->get('title')}"/>
            <span>{if $form->picture_i18n.title->getOption('required')}*{/if}</span>
        </td>
    </tr>
     <tr>
        <td>{__('Link')}</td>
        <td>
            <div class="errors-form">{$form.picture_i18n.link->getError()}</div>
            <input type="text" class="PictureI18n Input" name="link" size="64" value="{$picture_gallery->getPicture()->getI18n()->get('link')}"/>
            <span>{if $form->picture_i18n.link->getOption('required')}*{/if}</span>
        </td>
    </tr>
     <tr>
        <td>{__('Target')}</td>
        <td>
           <div></div>  
           {html_options class="PictureI18n Select" name="target" options=$form->picture_i18n.target->getOption('choices') selected=$picture_gallery->getPicture()->getI18n()->get('target')}    
        </td>
    </tr>
    <tr>
        <td>{__('Description')}</td>
        <td>
            <div class="errors-form">{$form.picture_i18n.description->getError()}</div>
            <textarea class="PictureI18n Input" name="description">{$picture_gallery->getPicture()->getI18n()->get('description')}</textarea>
            <span>{if $form->picture_i18n.description->getOption('required')}*{/if}</span>
        </td>
    </tr>
    <tr>
        <td>{__('Dimensions')}</td>
        <td>           
            <span class="picture-info" name="dimensions">{$picture_gallery->getPicture()->getI18n()->picture()->getWidth()} x {$picture_gallery->getPicture()->getI18n()->picture()->getHeight()}</span>          
        </td>
    </tr>
    <tr>
        <td>{__('Size')}</td>
        <td>           
            <span class="picture-info" name="size">{format_size($picture_gallery->getPicture()->getI18n()->picture()->getInformation()->getSize())} {$picture_gallery->getPicture()->getI18n()->picture()->getInformation()->getSize()} {__('Bytes')}</span>          
        </td>
    </tr>
    <tr>
        <td>{__('Date')}</td>
        <td>           
            <span class="picture-info" name="date">{format_date($picture_gallery->getPicture()->getI18n()->picture()->getInformation()->getTime(),['p','q'])}</span>          
        </td>
    </tr>
    <tr>
        <td>
            <span>{__("Picture")}:</span>
        </td>
        <td>                      
             <div id="error_picture"></div>                          
             <div id="picture_container" {if !$picture_gallery->getPicture()->getI18n()->get('picture')}style="display:none"{/if}>
                 <img id="picture_picture" {if $picture_gallery->getPicture()->getI18n()->get('picture')}src="{$picture_gallery->getPicture()->getI18n()->picture()->getURL('superadmin')}"{/if} height="128" width="128" alt="{__('picture')}"/>
                 <span id="picture_picture_filename">{$picture_gallery->getPicture()->getI18n()->get("picture")}</span>                
             </div>             
             <a id="ChangePicture" class="btn btn-default" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>
                  <span id="text_picture">
                      {if $picture_gallery->getPicture()->getI18n()->get("picture")} {__('Change picture')} {else} {__('Add picture')} {/if}
                  </span>
             </a>           
             <div id="picture" style="display:none">
                  <input class="filePicture" type="file" name="SitePictureI18n[picture]"/> 
                  <a href="#" id="uploadPicture"><img id="upload" src="{url('/icons/upload.png','picture')}" alt="{__('Upload')}"></a>
                  <img id="pictureLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
             </div>                           
         </td>
     </tr>
       <tr>
        <td>{__('Content')}</td>
        <td>
            <div class="errors-form">{$form.picture_i18n.content->getError()}</div>
            <textarea class="PictureI18n Input" name="content" cols="40" rows="10">{$picture_gallery->getPicture()->getI18n()->get('content')}</textarea>
            <span>{if $form->picture_i18n.content->getOption('required')}*{/if}</span>
        </td>
    </tr>
</table> 
    
       
<script type="text/javascript">       
    
       
        $(".PictureI18n,.Picture").click(function() {  $('#Save').show(); });
          
         $("#ChangePicture").click(function() {
            $("#picture").show();
            $(this).hide();
       });
       
        $('#uploadPicture').click(function(){ 
            var params = { SitePictureI18n: { 
                                   picture_id: "{$picture_gallery->getPicture()->get('id')}",
                                   lang: "{$picture_gallery->getPicture()->getI18n()->get('lang')}",                                  
                                   token :"{mfForm::getToken('PictureI18nSaveForm')}"
                                } };           
           $(".PictureI18n.Input").each(function() { params.SitePictureI18n[$(this).attr('name')]=$(this).val(); });
           $(".PictureI18n.Select option:selected").each(function() { params.SitePictureI18n[$(this).parent().attr('name')]=$(this).val(); });                                
            return $.ajax2({ 
                loading:"#pictureLoading",
                data : params,
                url: "{url_to('site_gallery_ajax',['action'=>'SavePictureI18n'])}",
                files: ".filePicture",
                complete: function()
                          {
                              $(".filePicture").val('');       
                          },
                success: function(response)
                         {
                              if (response.picture)
                              {    
                                   $("#picture_picture").attr('src',"{$picture_gallery->getPicture()->getI18n()->picture()->getURLPath()}"+response.picture+"?"+$.now()); 
                                   $("#picture_picture_filename").html(response.picture);
                                   $("#picture_container").show();
                                   $(".picture-info").each(function(){ $(this).html(response[$(this).attr('name')]); });
                                   $("#picture").hide(); 
                                   $("span#text_picture").html("{__('Change picture')}");
                                   $("#ChangePicture").show();
                              }  
                         }
               }); 
          }); 
          
      {* === A C T I O N S  ==== *}
        $('#Cancel').click(function() {                      
           return $.ajax2({ data: { SiteGalleryI18n: '{$picture_gallery->getGallery()->getI18n()->get('id')}' },
                            url: "{url_to('site_gallery_ajax',['action'=>'ViewGalleryI18nPictures'])}",target: "#actions"}); 
        }); 
          
       $("#Save").click(function() { 
       var params = { 
                    SitePictureGalleryI18n: { gallery_i18n_id: '{$picture_gallery->getGallery()->getI18n()->get('id')}',picture_i18n_id: '{$picture_gallery->getPicture()->getI18n()->get('id')}'  },
                    SitePictureI18nForGalleryI18n: { picture : { }, picture_i18n : { } ,  
                                                 token :'{$form->getCSRFToken()}' } 
                    }; 
           $(".Picture.Input").each(function() { params.SitePictureI18nForGalleryI18n.picture[$(this).attr('name')]=$(this).val(); });
           $(".PictureI18n.Input").each(function() { params.SitePictureI18nForGalleryI18n.picture_i18n[$(this).attr('name')]=$(this).val(); });
           $(".PictureI18n.Select option:selected").each(function() { params.SitePictureI18nForGalleryI18n.picture_i18n[$(this).parent().attr('name')]=$(this).val(); });
        //   console.log(params);
           return $.ajax2({                 
                data : params,
                url: "{url_to('site_gallery_ajax',['action'=>'SavePictureI18nForGalleryI18n'])}",
                files: ".filePicture",
                target: "#actions"
                });
       });
</script>     

{else}
   {__('Picture is invalid.')}        
{/if} 
