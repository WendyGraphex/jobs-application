<div class="col-md-2 mediaPictures col-md Pictures-list" id="{$item->get('id')}" style="margin-bottom: 10px;">
    <div style="background-color: white; padding: 0; border: 2px solid #e8e9ee; {*max-width: 300px; min-width: 200px;*}">    
    <div style="margin: 0; width:100%;" class="Img_Gallery" id="{$item->get('id')}">
        <div class="pictures picture" style="width: 100%;">                       
           <img src="{$item->getPictureManager()->getURL()}" style="width: 100%; height: 200px;" alt="{$item->getI18n()->get('title')|escape}"/>
           <div style="width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: 300; font-size: 1.2em;">
                <span id="title-ctn">{$item->getI18n()->get('title')|escape}</span>
           </div>
        </div>
        <div style="width: 100%; padding: 0;" class="pictures actions" id="{$item->get('id')}">
            <div class="" style="width: 100%; padding: 0; overflow: auto;display: flex;">
                <div>
                    <div class="btn btn-default">
                        <input class="selection"  type="checkbox"/>
                    </div> 
                </div>
                <div style="width: 100%;text-align: right;">
                    <span>                                      
                        <a href="#" class="btn btn-default" name="{$item->get('is_active')}" id="ChangeIsActive-{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>                                     
                    </span>
                    <span>                 
                        <a href="#" title="{__('Edit')}" class="btn btn-default" id="ViewPictureI18n-{$item->get('id')}">
                        <i class="fa fa-pencil-alt"></i>
                        </a>                 
                    </span>
                    <span>                    
                        <a href="#" title="{__('Delete')}" class="btn btn-default" id="Delete-{$item->get('id')}" name="{$item->getI18n()->get('title')}" >
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
  
                                              
             $("#ChangeIsActive-{$item->get('id')}").click( function () {                 
                return $.ajax2({ data: { SitePicture : { id: '{$item->get('id')}', value: $(this).attr('name'), token: '{mfForm::getToken("ChangeForm")}' } },
                                 url: "{url_to('site_gallery_ajax',['action'=>'ChangeIsActivePicture'])}",
                                 success: function(resp) {
                                               if (resp.action!='ChangeIsActivePicture') return ;
                                               change('ChangeIsActive',resp);
                                          }
                });    
            });   
            
            $("#Delete-{$item->get('id')}").click( function () { 
                if (!confirm('{__("Picture \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ SitePicture: '{$item->get('id')}' },
                                 url :"{url_to('site_gallery_ajax',['action'=>'DeletePicture'])}",
                                 success : function(resp) {
                                         if (resp.action!='DeletePicture') return ;                                       
                                          $(".Pictures-list[id={$item->get('id')}]").remove();  
                                          if ($('.Pictures-list').length==0) return updateFilter();
                                          updatePager(1);
                                     
                                 }
                     });                                         
            });
            
            
            $("#ViewPictureI18n-{$item->get('id')}").click(function () {
                var params = { SitePictureI18n: { lang: $("#SelectListLanguages option:selected").attr('id'), picture_id : '{$item->get('id')}' } };
                return $.ajax2({ data: params, 
                                url: "{url_to('site_gallery_ajax',['action'=>'ViewPictureI18n'])}",
                                success : function () { $("#SitePictureViewDialog").modal('show'); },
                                target: "#SitePictureViewDialog-ctn"
                            }); 


            });  
            
</script>