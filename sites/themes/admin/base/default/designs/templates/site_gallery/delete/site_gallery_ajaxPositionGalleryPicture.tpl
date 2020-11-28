{messages}
<div class="row" style="width: 100%; padding: 10px 0 10px 0; margin: 0;">
    <div class="col-sm" style="padding: 0;">
        <h3 style="color: rgb(101, 109, 120); font-family: Lato, Calibri, Arial, sans-serif; font-size: 1.5em; font-weight: 600;">{__("Pictures position in gallery")}</h3>
        <h4 style="color: rgb(172, 181, 190); font-family: Lato, Calibri, Arial, sans-serif; font-size:1em; font-weight: 300;">{__("Pictures position management")}</h4>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">   
            <a href="#" id="Cancel" class="btn btn-warning" style="border-radius: 0; color: white;">
                 <i class="fa fa-reply" style=" margin-right: 10px; color: white;"></i>{__('Cancel')}</a> 
            <a href="#" id="Save" class="btn btn-success" style="display:none; border-radius: 0; margin-left: 10px">
                  <i class="fa fa-save" style=" margin-right: 10px;"></i>{__('Save')}
            </a>
        </div>
    </div>
</div>
<div style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Media')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Picture position')}
    </p>
</div>  
<div id="Gallery" style="padding: 10px; background-color: white; width: 100%;">
    <div class="GalleryCont" style="width: 100%;">  
    {foreach $gallery_i18n->getPictures() as $item}
        <div id="{$item->getSitePictureGallery()->get('id')}" style="width: 200px; margin: 10px;"  name="{$item->getSitePictureGallery()->get('position')}" class="Img_Gallery ui-state-default">
            
            <div class="picture" style="width: 100%; height: 150px;">
                <img style="width: 100%; height: 100%;" src="{$item->getSitePictureI18n()->picture()->getURL()}" alt="{$item->getSitePictureI18n()->get('title')|escape}"/>    
            </div>
            <div style="text-align: center; padding: 10px;">
                   {$item->getSitePictureI18n()->get('title')|escape} (<span class="Position">{$item->getSitePictureGallery()->get('position')}</span>)
            </div>
                 
       </div>          
    {/foreach}  
    </div>
</div>
<script type="text/javascript">   
    
     $("#Gallery").data("movedItems",[]);
     
     function saveMovedItems(selected)
     {
        found=false;
        $.each($("#Gallery").data("movedItems"),function (i){ 
           if (this.id==selected.id)
           {
               found=true;
               $("#Gallery").data("movedItems")[i]=selected;
               return true;
           }    
        });
        if (!found)
           $("#Gallery").data("movedItems").push(selected);
     }
     
     $("#Cancel").click( function () {            
           return $.ajax2({ data : { SiteGalleryI18n : { 
                                                gallery_id: "{$gallery_i18n->getGallery()->get('id')}",
                                                lang: "{$gallery_i18n->get('lang')}",                                                
                                    } },
                                url:"{url_to('site_gallery_ajax',['action'=>'ViewGalleryI18nPictures'])}",
                                target: "#actions"});
     });
     
      $("#Gallery .GalleryCont").sortable({
                            cursor: 'move',
                            start: function( event, ui ) {
                                  $(ui.item).addClass('selected')  ;
                            },
			    stop: function( event, ui ) {
                                        $("#Save").show();
                                        selected={ id: $(ui.item).attr('id')};
                                        if (typeof $(ui.item).prev().attr('id')=='undefined'||$(ui.item).attr('name')>$(ui.item).prev().attr('name'))
					{
                                          selected.node=$(ui.item).next().attr('id');
					}
					else
					{
                                          selected.node=$(ui.item).prev().attr('id');
					}
                                       // alert("move="+selected.toSource());
                                        if (selected.node)
                                           saveMovedItems(selected);
                            }
    });
    
     $("#Save").click(function(){   
       movedItems=$("#Gallery").data("movedItems");
       //alert("Move node="+movedItems.toSource()); return ;
       if (movedItems.length==0)
                    return false;
       if (movedItems.length==1)
       {
                    return $.ajax2({ data : { 
                                        SiteGalleryPicture :  $.extend(movedItems[0],{ token : "{mfForm::getToken('movePositionForm')}" })
                                        } ,
                                   url: "{url_to('site_gallery_ajax',['action'=>'MoveGalleryPicture'])}",
                                   success:function (response) { 
                                               if (response.action=='moveGalleryPicture' && response.id==movedItems[0].id)
                                               {  
                                                             $.each($("#Gallery tbody").children(),function (id) {  $(this).attr('name',id+1); });
                                                             $(".Position").each(function (id) { $(this).html((id+1))});
                                                             $("#Gallery .selected").removeClass('selected');
                                               }
                                               $("#Gallery").data("movedItems",[]);
                                               $("#Save").hide();
                                   }    
                    });
       }
       else
       {
          alert("Move a selection not implemented."); 
       }    
    });
</script>  