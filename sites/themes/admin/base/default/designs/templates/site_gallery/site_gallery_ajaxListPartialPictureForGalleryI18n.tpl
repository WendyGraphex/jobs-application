<div class="row" style="width: 100%; margin: 0;">
    <div class="col-sm" style="padding: 0; padding: 10px 0 10px 0; ">
        <h3>{__("View pictures for gallery [%s]",$gallery_i18n->getGallery()->get('name'))}</h3>   
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">   
             
            <a style="margin-top: 10px; float: right; border-radius: 0;" id="Add" class="btn btn-success edit-picture-gallery" href="#">
                <i class="fa fa-plus" style=" margin-right: 10px;"></i>{__('Add pictures')}
            </a>                  
            <a style="margin-top: 10px; float: right; border-radius: 0; color: white;" href="#" class="btn btn-warning edit-picture-gallery" id="Cancel">
                <i class="fa fa-reply" style=" margin-right: 10px; color: white;"></i>
                {__('Cancel')}</a> 
        </div>
    </div>
</div>
<div style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin: 10px 0 15px 0;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Media')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Galleries')}
    </p>
</div>
    
{alerts}
<div style="clear: both"></div>
<div style="width: 100%; background-color: white; padding: 20px;">
     <div>                    
       {component name="/site_languages/selectListLanguagesFrontend" selected=$gallery_i18n->get('lang')}
    </div>   
    <div id="Pictures-ctn" class="row">
        <div id="DropZonePicture-ctn" class="mediaPictures col-md-2" style="background-color: white; padding: 0; {*margin: 10px; max-width: 300px; min-width: 200px;*}">
            <div style="margin: 10px;">
                <figure class="effect-text-in ModeDisplay" style="height: 100%;">
                    <div id="DropZonePicture" class="dropzone dp-addFile pt-0 ModeDisplay" style="padding-top: 30% !important;"> 
                        <i class="fa fa-plus plus-icon"></i>                                                              
                        <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                    </div>
                    <figcaption>                             
                    </figcaption>                          
                </figure>
            </div>
        </div> 
    {if !$gallery_i18n->getGalleryPictures()->isEmpty()}

        {foreach $gallery_i18n->getGalleryPictures() as $item}

            <div class="col-md-2 Pictures" id="{$item->get('id')}">
                <div style="background-color: white; padding: 0; border: 2px solid #e8e9ee;{* max-width: 300px; min-width: 200px;*}">
                    <div style="margin: 0; width:100%;" class="Img_Gallery">
                        <div class="divImageAndText pictures picture" style="width: 100%;">
                            <i class="fa fa-arrows-alt IconChangePlace" aria-hidden="true" style="position: absolute;z-index: 1000;top: 40%;left: 47%;font-size: 25px;color: #fff;display: none;"></i>
                            <img style="width: 100%; height: 200px;" src="{$item->getPicture()->getPictureManager()->getURL()}"  alt="{if $item->getPicture()->hasI18n()}{$item->getPicture()->getI18n()->get("title")}{else}{$item->getPicture()->get('name')}{/if}"/>    
                            <div id="title-ctn" style="width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: 300; font-size: 1.2em;">
                                {if $item->getPicture()->hasI18n()}{$item->getPicture()->getI18n()->get("title")}{else}{$item->getPicture()->get('name')}{/if}
                            </div>
                        </div>
                        <div style="width: 100%; padding: 0;" class="pictures actions" id="actions-{*$item->getSitePictureGallery()->get('id')*}">
                            <div class="" style="width: 100%; padding: 0; overflow: auto;display: flex;">
                                <div>
                                    <div class="btn btn-default">
                                        <input class="selection"  type="checkbox"/>
                                    </div> 
                                </div>
                                <div style="width: 100%;text-align: right;">
                                     <span>                                      
                                        <a href="#" class="ChangeIsActive btn btn-default" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>                                     
                                    </span>
                                    <span>                                     
                                         {if $item->getPicture()->hasI18n()}
                                        <a href="#" title="{__('Edit')}" class="ViewPictureI18nForGallery btn btn-default" id="{$item->getPicture()->get('id')}">
                                        <i class="fa fa-pencil-alt"></i>
                                        </a>
                                        {else}
                                          <a href="#" title="{__('New')}" class="NewPictureI18nForGallery btn btn-default" id="{$item->getPicture()->get('id')}">
                                        <i class="fa fa-plus"></i>
                                        </a>    
                                        {/if}
                                    </span>
                                    <span>
                                        <a href="#" title="{__('Delete')}" class="Delete btn btn-default" id="{$item->get('id')}" name="{if $item->getPicture()->hasI18n()}{$item->getPicture()->getI18n()->get("title")}{else}{$item->getPicture()->get('name')}{/if}" >
                                            <i class="fa fa-trash-alt"></i>                                 
                                        </a> 
                                    </span>
                                </div>
                            </div>                                                 
                        </div>
                    </div>
                </div>
            </div>

        {/foreach}      

    {else}
        <div>{__('No picture available.')}</div>
    {/if}
    </div>
</div>
<div class="modal fade" id="SitePictureViewDialog" role="dialog">
        <div class="modal-dialog" style="top: 30%;">
            <div id="SitePictureViewDialog-ctn" class="modal-content">
                
            </div>
        </div>
</div>

                    
<div class="modal fade" id="SitePictureListDialog" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="SitePictureListDialog-ctn" class="modal-body">
                
            </div>
            <div style="text-align: center;padding-bottom: 10px;">
                <button class="btn btn-success" id="AddPictures" style="width: 120px;">{__('Add pictures')}</button>
            </div>
        </div>
    </div>
</div>
            
<script type="text/javascript"> 
     function change(action,resp) {
               $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                    $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                    $("."+action+"[id="+this+"]").attr('name',resp.value);
               });
     }
       
     $("#Add").click(function () { 
             return $.ajax2({     url:"{url_to('site_gallery_ajax',['action'=>'DialogListPartialPicture'])}",
                                 target: "#SitePictureListDialog-ctn",
                                 success : function () {  
                                        $("#SitePictureListDialog").modal('show');                                                                       
                                    }
                });
               
     });
        
     $("#Pictures-ctn").sortable({
        items: ".Pictures",      
        stop: function (event, ui) {                        
           var params = {
                        SitePicturePosition: {
                            node : ui.item.attr('id'),
                            sibling_id : ui.item.next().attr('id'),
                            token: '{mfForm::getToken('SitePictureForGalleryI18nMoveForm')}'
                        }
               };
            $.ajax2({
            data: params,
            url: "{url_to('site_gallery_ajax',['action'=>'MovePictureForGalleryI18n'])}" 
            });
        }
    });  
    
    
    
    $(".ViewPictureI18nForGallery").click(function () {
        var params = { SitePictureI18n: { lang: $("#SelectListLanguages option:selected").attr('id'), picture_id : $(this).attr('id') } };
        return $.ajax2({ data: params, 
                        url: "{url_to('site_gallery_ajax',['action'=>'ViewPictureI18n'])}",
                        success : function () { $("#SitePictureViewDialog").modal('show'); },
                        target: "#SitePictureViewDialog-ctn"
                    }); 
        
        
    });  
    
       $(".NewPictureI18nForGallery").click(function () {
        var params = { SitePictureI18n: { lang: $("#SelectListLanguages option:selected").attr('id'), picture_id : $(this).attr('id') } };
        return $.ajax2({ data: params, 
                        url: "{url_to('site_gallery_ajax',['action'=>'NewPictureI18nForGalleryI18n'])}",
                        success : function () { $("#SitePictureViewDialog").modal('show'); },
                        target: "#SitePictureViewDialog-ctn"
                    }); 
        
        
    });  
              
        $('#Cancel').click(function() {              
           return $.ajax2({ data: { filter: { 
                                lang: $("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('SiteGalleryFormFilter')}" } }, 
                                url: "{url_to('site_gallery_ajax',['action'=>'ListPartialGallery'])}",target: "#actions"}); 
        });
        
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Picture \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ SitePictureGallery: $(this).attr('id') },
                                 url :"{url_to('site_gallery_ajax',['action'=>'DeletePictureGallery'])}",
                                 success : function(resp) {
                                          if (resp.action!='DeletePictureGallery') return ;                                                                                       
                                          $(".Pictures[id="+resp.id+"]").remove();                                          
                                          if ($('.Pictures').length !=0) return ;                                          
                                          return $.ajax2({ data : { SiteGalleryI18n : { 
                                                                      gallery_id: "{$gallery_i18n->get('gallery_id')}",
                                                                      lang: "{$gallery_i18n->get('lang')}",                                               
                                                          } },
                                                          url:"{url_to('site_gallery_ajax',['action'=>'ListPartialPictureForGalleryI18n'])}",
                                                          target: "#actions"});                                                                                                           
                                 }
                     });                         
                return false;
        });
        
        $(".ChangeIsActive").click( function () {                 
                return $.ajax2({ data: { SitePictureGallery : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken("ChangeForm")}' } },
                                 url: "{url_to('site_gallery_ajax',['action'=>'ChangeIsActivePictureGallery'])}",
                                 success: function(resp) {
                                               if (resp.action!='ChangeIsActivePictureGallery') return ;
                                                    change('ChangeIsActive',resp);
                                          }
                });    
        });   
        
       
        
        $("#NewPicture").click( function () { 
               return $.ajax2({
                    data : { SiteGalleryI18n: '{$gallery_i18n->get('id')}' },
                    url: "{url_to('site_gallery_ajax',['action'=>'NewPictureForGalleryI18n'])}",
                    target: "#actions"
               });
          });
          
       
        if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
                                                 
         $("#DropZonePicture").dropzone({
            url: "{url_to("site_gallery_ajax",['action'=>'UploadPictureForGalleryI18n'])}",
         //   clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadPicture[token]" : '{mfForm::getToken('SitePictureUploadForGalleryI18nForm')}' ,
                      "SiteGalleryI18n" :   '{$gallery_i18n->get('id')}',
                    },   
            paramName: "UploadPicture[picture]",
            createImageThumbnails : false,          
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                         
            },               
            success : function (file,response)
            {                             
                 if (response.errors || response.status)                 
                     return ;                                               
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();               
                 $("#DropZonePicture-ctn").after(response);  
            }                  
    });
    
    $("#AddPictures").click(function () { 
       $("#SitePictureListDialog").modal('hide');       
       var params = { SiteGalleryI18n: '{$gallery_i18n->get('id')}',
                      SitePictureMultiple :  { selection : $("#DialogPictures").data('selection') , token : '{mfForm::getToken('SitePictureMultipleForGalleryI18nForm')}' }
                    } ;
        return $.ajax2({
                    data : params,
                    url: "{url_to('site_gallery_ajax',['action'=>'SaveMultiplePictureForGalleryI18n'])}",
                    success : function (resp) {                         
                                      //  $("#SitePictureListDialog").modal('hide');                                                                       
                                    },
                    target: "#actions"                     
               });   
    });
   

  $("#SelectListLanguages").change(function() { 
     return $.ajax2({ data : { SiteGalleryI18n : { 
                                                gallery_id: '{$gallery_i18n->get('gallery_id')}',
                                                lang: $("#SelectListLanguages option:selected").attr('id'),                                                 
                                    } },
                                url:"{url_to('site_gallery_ajax',['action'=>'ListPartialPictureForGalleryI18n'])}",
                                target: "#actions"}); 
  }); 
</script>           
