{messages class="errors"}
<div class="row" style="width: 100%; padding: 10px 0 10px 0; margin: 0;">
    <div class="col-sm" style="padding: 0;">
        <h3 style="color: rgb(101, 109, 120); font-family: Lato, Calibri, Arial, sans-serif; font-size: 1.5em; font-weight: 600;">{__("New picture for [%s] gallery",$gallery_i18n->getGallery()->get('name'))}</h3>
        <h4 style="color: rgb(172, 181, 190); font-family: Lato, Calibri, Arial, sans-serif; font-size:1em; font-weight: 300;">{__("Pictures management")}</h4>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" class="btn btn-success" id="Save" style="display:none; border-radius: 0;">
                <i class="fas fa-save" style="margin-right: 10px;"></i>{__('Save')}</a>
            <a href="#" class="btn btn-danger" id="Cancel" style="margin-left: 10px;  border-radius: 0;">
                <i class="fa fa-times" style=" margin-right: 10px;"></i>{__('Cancel')}</a> 
        </div>
    </div>
</div>
<div style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Media')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Ajouter une Image')}
    </p>
</div>

{if $gallery_i18n->isLoaded()}
    
<style> .ui-dialog { font-size: 62.5%; }</style> 
{component name="/languages/dialogListLanguagesFrontend" selected=$picture_i18n->get('lang')} 
<div style="background-color: white; padding: 10px; width: 100%;">
    <table cellpadding="0" cellspacing="0" >
        <tr>
            <td></td>
            <td>
                <img id="{$picture_i18n->get('lang')}" name="lang" src="{url("/flags/`$picture_i18n->get('lang')`.png","picture")}" title="{format_country($picture_i18n->get('lang'))}" />            
            </td>
        </tr>
        <tr style="height: 60px;">
            <td style="padding: 10px;">{__('Name')}{if $form->picture.name->getOption('required')}*{/if}</td>
            <td>
                <div class="errors-form">{$form.picture.name->getError()}</div>
                <input type="text" class="Picture Input form-control" name="name" value="{$picture_i18n->getPicture()->get('name')}"/>
            </td>
        </tr> 
        <tr style="height: 60px;">
            <td style="padding: 10px;">{__('Title')}{if $form->picture_i18n.title->getOption('required')}*{/if}</td>
            <td>
                <div class="errors-form">{$form.picture_i18n.title->getError()}</div>
                <input type="text" class="PictureI18n Input form-control" name="title" value="{$picture_i18n->get('title')}"/>
            </td>
        </tr>
        <tr style="height: 60px;">
            <td style="padding: 10px;">{__('Link')}{if $form->picture_i18n.link->getOption('required')}*{/if}</td>
            <td>
                <div class="errors-form">{$form.picture_i18n.link->getError()}</div>
                <input type="text" class="PictureI18n Input form-control" name="link" size="64" value="{$picture_i18n->get('link')}"/>
            </td>
        </tr>
         <tr style="height: 60px;">
            <td style="padding: 10px;">{__('Target')}</td>
            <td>
               <div></div>  
               {html_options class="PictureI18n" name="target" options=$form->picture_i18n.target->getOption('choices') selected=$picture_i18n->get('target')}    
            </td>
        </tr>
        <tr style="height: 60px;">
            <td style="padding: 10px;">{__('Description')}</td>
            <td>
                <div class="errors-form">{$form.picture_i18n.description->getError()}</div>
                <textarea class="PictureI18n Textarea form-control" name="description">{$picture_i18n->get('description')}</textarea>
                <span>{if $form->picture_i18n.description->getOption('required')}*{/if}</span>
            </td>
        </tr>
        <tr style="height: 60px;">
            <td style="padding: 10px;"><span>{__("Picture")}:</span></td>
            <td>
                <div id="error_picture">{$form.picture_i18n.picture->getError()}</div>                                               
                <input class="files" type="file" name="SitePictureI18n[picture_i18n][picture]"/>                   
                {if $form->picture_i18n.picture->getOption('required')}*{/if} 
            </td>
        </tr> 
     </table>   
</div>
{else}
    {__('Gallery is invalid.')}
{/if}    
<script type="text/javascript">       
    
        {* === A C T I O N S  ==== *}
        $('#Cancel').click(function() {    
           $(".dialogs").dialog("destroy").remove();              
           return $.ajax2({ data: { SiteGalleryI18n: '{$gallery_i18n->get('id')}' },
                            url: "{url_to('site_gallery_ajax',['action'=>'ViewGalleryI18nPictures'])}",target: "#actions"}); 
        });
        
        $(".PictureI18n,.Picture").click(function() {  $('#Save').show(); });
          
         $('#Save').click(function(){                             
            var  params= {      SiteGalleryI18n: '{$gallery_i18n->get('id')}' ,       
                                SitePictureI18n: { 
                                   picture_i18n : { 
                                                   description: $("textarea.PictureI18n").val()
                                                 },
                                   picture : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".PictureI18n.Input,.PictureI18n.Textarea").each(function() { params.SitePictureI18n.picture_i18n[this.name]=$(this).val(); });
          $(".Picture.Input").each(function() {  params.SitePictureI18n.picture[this.name]=$(this).val();  });  // Get foreign key  
           //   alert("Params="+params.toSource());   return ;
          $(".dialogs").dialog("destroy").remove(); 
          return $.ajax2({ data : params,
                           files: ".files",
                           url: "{url_to('site_gallery_ajax',['action'=>'NewPictureForGalleryI18n'])}",target: "#actions"}); 
        });    
</script>        