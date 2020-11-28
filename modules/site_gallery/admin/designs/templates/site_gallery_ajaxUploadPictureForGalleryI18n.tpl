<div class="col-md-2 mediaPictures col-md Pictures-list" id="{$picture_gallery->get('id')}" style="margin-bottom: 10px;">
    <div style="background-color: white; padding: 0; border: 2px solid #e8e9ee; {*max-width: 300px; min-width: 200px;*}">    
    <div style="margin: 0; width:100%;" class="Img_Gallery" id="{$picture_gallery->get('id')}">
        <div class="pictures picture" style="width: 100%;">                       
           <img src="{$picture_gallery->getPicture()->getPictureManager()->getURL()}" style="width: 100%; height: 200px;" alt="{$picture_gallery->getPicture()->getI18n()->get('title')|escape}"/>
           <div style="width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: 300; font-size: 1.2em;">
                <span id="title-ctn">{$picture_gallery->getPicture()->getI18n()->get('title')|escape}</span>
           </div>
        </div>
        <div style="width: 100%; padding: 0;" class="pictures actions" id="{$picture_gallery->get('id')}">
            <div class="" style="width: 100%; padding: 0; overflow: auto;display: flex;">
                <div>
                    <div class="btn btn-default">
                        <input class="selection"  type="checkbox"/>
                    </div> 
                </div>
                <div style="width: 100%;text-align: right;">
                    <span>                                      
                        <a href="#" class="btn btn-default" name="{$picture_gallery->get('is_active')}" id="ChangeIsActive-{$picture_gallery->get('id')}"><i class="fa fa-circle text-{if $picture_gallery->isActive()}success{else}danger{/if}"></i></a>                                     
                    </span>
                    <span>                 
                        <a href="#" title="{__('Edit')}" class="btn btn-default" id="ViewPictureI18n-{$picture_gallery->getPicture()->get('id')}">
                        <i class="fa fa-pencil-alt"></i>
                        </a>                 
                    </span>
                    <span>                    
                        <a href="#" title="{__('Delete')}" class="btn btn-default" id="Delete-{$picture_gallery->get('id')}" name="{$picture_gallery->getPicture()->getI18n()->get('title')}" >
                        <i class="fa fa-trash-alt"></i>                                  
                        </a>                   
                    </span>
                </div>
            </div>                                                 
        </div>
    </div>
    </div>
 </div>
<script type="text/javascript"> 
  
                                              
             $("#ChangeIsActive-{$picture_gallery->get('id')}").click( function () {                 
                return $.ajax2({ data: { SitePictureGallery : { id: '{$picture_gallery->get('id')}', value: $(this).attr('name'), token: '{mfForm::getToken("ChangeForm")}' } },
                                 url: "{url_to('site_gallery_ajax',['action'=>'ChangeIsActivePictureGallery'])}",
                                 success: function(resp) {
                                               if (resp.action!='ChangeIsActivePictureGallery') return ;                                                 
                                                $("#ChangeIsActive-{$picture_gallery->get('id')} i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                                                $("#ChangeIsActive-{$picture_gallery->get('id')}").attr('name',resp.value);               
                                          }
                });    
            });   
            
            $("#Delete-{$picture_gallery->get('id')}").click( function () { 
                if (!confirm('{__("Picture \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ SitePictureGallery: '{$picture_gallery->get('id')}' },
                                 url :"{url_to('site_gallery_ajax',['action'=>'DeletePictureGallery'])}",
                                   success : function(resp) {
                                          if (resp.action!='DeletePictureGallery') return ;                                                                                       
                                          $(".Pictures-list[id={$picture_gallery->get('id')}]").remove();                                          
                                          if ($('.Pictures-list').length !=0) return ;                                          
                                          return $.ajax2({ data : { SiteGalleryI18n : { 
                                                                      gallery_id: "{$gallery_i18n->get('gallery_id')}",
                                                                      lang: "{$gallery_i18n->get('lang')}",                                               
                                                          } },
                                                          url:"{url_to('site_gallery_ajax',['action'=>'ListPartialPictureForGalleryI18n'])}",
                                                          target: "#actions"});                                                                                                           
                                 }
                     });                                         
            });
            
             $("#ViewPictureI18n-{$picture_gallery->getPicture()->get('id')}").click(function () {
                var params = { SitePictureI18n: { lang: $("#SelectListLanguages option:selected").attr('id'), picture_id : '{$picture_gallery->getPicture()->get('id')}' } };
                return $.ajax2({ data: params, 
                                url: "{url_to('site_gallery_ajax',['action'=>'ViewPictureI18n'])}",
                                success : function () { $("#SitePictureViewDialog").modal('show'); },
                                target: "#SitePictureViewDialog-ctn"
                            }); 


            });  
</script>