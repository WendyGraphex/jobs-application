<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Events')}</h3>
        <h3 class="admin-header-small-text">{__('Event management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Event')}
    </p>
</div>
{alerts}
<div id="Event-ctn" class="tablewhiteback" style="padding: 20px;">
    <div class="row">
        <div class="form-group col-md-6">                                                              
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form->getLanguage()}
        </div>  
    </div>
    <ul class="nav nav-tabs" id="myTab" role="tablist">    
        <li class="nav-item">
            <a class="nav-link active" id="t-control-tab" data-toggle="tab" href="#t-control" role="tab" aria-controls="t-control" aria-selected="true">{__('Control')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-referencement-tab" data-toggle="tab" href="#t-referencement" role="tab" aria-controls="t-referencement" aria-selected="false">{__('Referencement')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-picture-tab" data-toggle="tab" href="#t-picture" role="tab" aria-controls="t-picture" aria-selected="false">{__('Picture')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-speakers-tab" data-toggle="tab" href="#t-speakers" role="tab" aria-controls="t-speakers" aria-selected="false">{__('Speakers')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-documents-tab" data-toggle="tab" href="#t-documents" role="tab" aria-controls="t-documents" aria-selected="false">{__('Documents')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link " id="t-description-tab" data-toggle="tab" href="#t-description" role="tab" aria-controls="t-description" aria-selected="false">{__('Description')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="t-content-tab" data-toggle="tab" href="#t-content" role="tab" aria-controls="t-content" aria-selected="false">{__('Content')} </a>
        </li>
    </ul>
    {* ============== C O N T R O L ========================================= *}
    <div class="tab-content" id="myTabContentViewEvent">         
        <div class="tab-pane fade show active" id="t-control" role="tabpanel" aria-labelledby="t-control-tab">  
            <table cellpadding="0" cellspacing="0">    
                <tr style="height: 60px;">
                    <td>{__('Price')}:{if $form->event.price->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.price->getError()}</div> 
                        <input class="SiteEvent Input form-control" type="text" name="price" size="10" value="{if $form->hasErrors()}{$form.event.price}{else}{$event_i18n->getEvent()->getFormatter()->getPrice()->getAmount()}{/if}"/></td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Starting at')}:{if $form->event.in_at->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.in_at->getError()}</div> 
                        <input id="last_time_from" class="SiteEvent Input form-control" type="text" name="in_at" size="10" value="{if $form->hasErrors()}{$form.event.in_at}{else}{format_date($event_i18n->getEvent()->get('in_at'),'a')}{/if}"/></td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Ending at')}:{if $form->event.out_at->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.out_at->getError()}</div> 
                        <input class="SiteEvent Fields Input form-control" id="last_time_to" type="text" name="out_at" size="10" value="{if $form->hasErrors()}{$form.event.out_at}{else}{format_date($event_i18n->getEvent()->get('out_at'),'a')}{/if}"/></td>
                </tr> 
                <tr style="height: 60px;">
                    <td>{__('Number of people')}:{if $form->event.number_of_people->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.number_of_people->getError()}</div> 
                        <input class="SiteEvent Fields Input form-control"  type="text" name="number_of_people" size="10" value="{$event_i18n->getEvent()->get('number_of_people')}"/></td>
                </tr> 
                <tr style="height: 60px;">
                    <td>{__('City')}:{if $form->event.city->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.city->getError()}</div> 
                        <input class="SiteEvent Fields Input form-control"  type="text" name="city" size="10" value="{$event_i18n->getEvent()->get('city')}"/></td>
                </tr> 
                <tr style="height: 60px;">
                    <td>{__('Country')}:{if $form->event.country->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.country->getError()}</div> 
                        {select_country name="country" class="SiteEvent js-example-responsive form-control Fields Select {if $form.event.country->hasError()}intro{/if}"  options=$form->event.country->getOption('choices') selected=$event_i18n->getEvent()->get('country')}
                    </td>
                </tr> 
                <tr style="height: 60px;">
                    <td>{__('Place')}:{if $form->event.place_id->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event.place_id->getError()}</div> 
                        {html_options name="place_id" class="SiteEvent js-example-responsive form-control Fields Select {if $form.event.place_id->hasError()}intro{/if}"  options=$form->event.place_id->getChoices()->toArray() selected=$event_i18n->getEvent()->get('place_id')}
                    </td>
                </tr> 
            </table>
        </div>
        {* ============== R E F E R E N C E M E N T ========================================= *}
        <div class="tab-pane fade" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
            <table cellpadding="0" cellspacing="0">
                <tr style="height: 60px;">
                    <td style="width: 150px;">{__('Url')}:{if $form.event_i18n.url->getValidator()->getOption('required')}*{/if}</td>
                    <td>
                        <div style="color: red;">{$form.event_i18n.url->getError()}</div> 
                        <input class="SiteEventI18n Fields Input form-control" type="text" name="url" value="{$event_i18n->get('url')}"/>
                    </td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Title')}:</td>
                    <td><input class="SiteEventI18n Fields Input form-control" type="text" name="meta_title" value="{$event_i18n->get('meta_title')}"/></td>
                </tr>
                <tr style="height: 60px;">
                    <td>{__('Description')}:</td>
                    <td><textarea class="SiteEventI18n Fields Input form-control" name="meta_description" rows="5" cols="40" style="margin-bottom: 20px;">{$event_i18n->get('meta_description')}</textarea></td>
                </tr>               
                <tr style="height: 60px;">
                    <td>{__('Keywords')}:</td>
                    <td><textarea class="SiteEventI18n Fields Input form-control" name="meta_keyword" rows="5" cols="40">{$event_i18n->get('meta_keyword')}</textarea>
                    </td>
                </tr> 
            </table>
        </div>
        {* ============== PICTURE ========================================= *}
        <div class="tab-pane fade" id="t-picture" role="tabpanel" aria-labelledby="t-picture-tab">           
            <div class="row portfolio-grid">
                <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                    <figure class="effect-text-in ModeDisplay" id="Picture">
                        <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                                                  
                            {if $form->hasEvent()}
                                {if $form->getEvent()->hasPicture()}
                                    <div class="PictureExist" id="Picture"> 
                                        <div class="div-img h-100">
                                            <img id="Picture-img" class="img-dpzone img-product" src="{$form->getEvent()->getPicture()->getMedium()->getUrl()}"/>
                                        </div> 
                                        <div class="dz-message" data-dz-message><span>{__('Drop file here to upload change')}</span></div>
                                    </div>                               
                                {/if}
                            {else}
                                <div id="NoPicture" style="position: absolute;width: 96%;top: 25%;" {if $event_i18n->getEvent()->hasPicture()}style= "display:none;"{/if}>
                                    <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                                    <img id="Picture-img" style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;" class="img-dpzone img-product" alt="image">                                
                                    <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                                </div>   
                            {/if}
                        </div>
                        <figcaption>                             
                        </figcaption>                          
                    </figure>
                </div>
                <div class="col-2">  
                    <a href="#" class="list-action Mode" id="Picture" name="NORMAL"><i id="Picture" class="ModeAwe far fa-square"></i></a>
                    <a href="#" style="display:none" id="DeletePicture" name="{$event_i18n->getEvent()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
                </div>           
            </div>
        </div>  
        {* ============== SPEAKERS ========================================= *}
        <div class="tab-pane fade" id="t-speakers" role="tabpanel" aria-labelledby="t-speakers-tab">           
            <div class="row mt-3" style="height: 20px;">                       
                <div class="form col-md-12">                                   
                    <div class="form-group">                                                    
                        <a href="javascript:void(0);" id="Dialog-SiteEventSpeakerUsers"><i class="fa fa-plus"></i></a>
                    </div>                    
                </div>  
            </div> 
            <div id="speakers-ctn">
                <div id="SiteEventSpeakerUsers">                               
                    {foreach $event_i18n->getEvent()->getEventSpeakerUsers()->getSpeakerUsers() as $speaker} 
                        <div class="SiteEventSpeakerUser-list" id="{$speaker->get('id')}">                                              
                            <div class="btn btn-outline-primary SiteEventSpeakerUser" id="{$speaker->get('id')}">
                                {$speaker->getFormatter()->getName()}                                                                         
                                <a href="javascript:void(0);" title="{__('Delete')}" class="SiteEventSpeakerUser-Delete" id="{$speaker->get('id')}"  name="{$speaker->get('title')}">
                                    <i  class="fa fa-times icon-font delete-color"></i>
                                </a>                                                       
                            </div> 
                        </div>
                    {/foreach}    
                </div>
            </div>

            <div id="Modal-Speakers" class="modal " role="dialog">
                <div class="modal-dialog modal-lg model-cat-product">    
                    <div class="modal-content">
                        <div class="px-2"><span class="close" id="Modal-Speakers-Close">&times;</span></div>
                        <div id="Modal-Speakers-ctn">            
                        </div>
                        <div class="col-md-12" style="padding: 0;">
                            <div class="Addbtn px-2"> 
                                <div style="width: 163px;margin: 0 auto;">
                                    <a href="#" id="AddSpeakers" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add speakers')}</a>                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        {* ============== DOCUMENTS ========================================= *}
        <div class="tab-pane fade" id="t-documents" role="tabpanel" aria-labelledby="t-documents-tab">           
            <div class="row portfolio-grid">
                <div class="SiteEventDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                    <figure class="effect-text-in">
                        <div id="DropZone" class="dropzone dp-addFile"> 
                            <div style="position: absolute;width: 96%;top: 25%;left: 2%;">
                                <i class="fa fa-plus plus-icon"></i>
                                <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div> 
                            </div>                             
                        </div>
                        <figcaption>                             
                        </figcaption>                          
                    </figure>
                </div>
                {foreach $event_i18n->getEvent()->getDocuments() as $document}
                    <div class="SiteEventDocuments-list col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
                        <figure class="effect-text-in classBorderSolid">
                            <div class="div-img h-100 dz-image">
                                {if  $document->getFile()->isPicture()}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                {else}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                {/if}
                            </div>
                            <figcaption class="text-left">
                                <div class="pr-1">
                                    <h6 class="PicturesCount">{$document@iteration}</h6>
                                </div>
                                <div class="pic-title text-left">
                                    <h6 class="picture-title w-100">                                                                          
                                        <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                    </h6>
                                </div>
                                <div class="conf-icons">
                                    <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action SiteEventDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                </div>
                            </figcaption> 
                        </figure>        
                    </div> 
                {/foreach}                                                                                                                                         
            </div>  
        </div> 
        {* ============== DESCRIPTION ========================================= *}
        <div class="tab-pane fade" id="t-description" role="tabpanel" aria-labelledby="t-description-tab">           
            <textarea id="ShortDescription" class="SiteEventI18n Fields Input form-control Editor" name="short_description" rows="5" cols="40" style="margin-bottom: 20px;">{$event_i18n->get('description')}</textarea>           
        </div>           
        {* ============== C O N T E N T ========================================= *}
        <div class="tab-pane fade" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
            <textarea  id="Content" name="content" rows="15" cols="80" style="margin-top: 15px;" class="SiteEventI18n Editor Input Fields form-control">{$event_i18n->get('content')}</textarea>
        </div>
    </div>
</div>  
</div>
<script type="text/javascript">
           
        $('#Content').ckeditor({
            height: $(window).height(),
        });
        
        $('#ShortDescription').ckeditor({
           
        });
           
         $(".SiteEventI18n.Input[name=meta_title]").keyup(function () { 
                $(".SiteEventI18n.Input[name=url]").val($(this).val().cleanup());
         });
         
        $(".Mode").click(function () {
        if ($(this).attr('name')=='NORMAL')
        {
            $(this).attr('name','INVERSE');
            $(".ModeAwe[id="+$(this).attr('id')+"]").removeClass('far fa-square').addClass('fa fa-square-full');        
            $(".ModeDisplay[id="+$(this).attr('id')+"]").css('background-color','#000');                                      
        }
        else
        {
             $(this).attr('name','NORMAL');
             $(".ModeAwe[id="+$(this).attr('id')+"]").removeClass('fa fa-square-full').addClass('far fa-square');         
             $(".ModeDisplay[id="+$(this).attr('id')+"]").css('background-color','');                
        }
    });
         
        var dates = $( "#last_time_from, #last_time_to" ).datepicker({
                            minDate : 0,
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "last_time_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    dates.not( this ).datepicker( "option", option, date );
                            }
                          });
        
        
     
        $('#Cancel').click(function(){ 
                var params={ filter: {  
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                                
                                   token:'{mfForm::getToken('SiteEventFormFilter')}'
                       } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}",
                                 target: "#actions"});             
        });
        
        $('#Save').click(function(){          
          var params= { SiteEventI18n : { 
                               speakers : [ ],
                               event :{ },
                               event_i18n: {  
                                    event_id: $("#Event-ctn").attr('data-id'),
                                    lang: $("#SelectListLanguages option:selected").attr('id')                              
                                         },
                               token :'{$form->getCSRFToken()}'
                              } };
          $(".SiteEventI18n.Input").each(function() { params.SiteEventI18n.event_i18n[$(this).attr('name')]=$(this).val(); });
          $(".SiteEvent.Input").each(function() { params.SiteEventI18n.event[$(this).attr('name')]=$(this).val(); });
          $(".SiteEvent.Select option:selected").each(function() { params.SiteEventI18n.event[$(this).parent().attr('name')]=$(this).val(); });
          $(".SiteEventSpeakerUser").each(function () { params.SiteEventI18n.speakers.push($(this).attr('id')); });
         // alert("Params="+params.toSource());   return;
          return $.ajax2({ 
                            data : params,
                            url: "{url_to('site_event_ajax',['action'=>'SaveNewEventI18n'])}",
                            target: "#actions",
                            success : function (resp) { 
                                    if (resp.action !='SaveNewEventI18n') return ;
                                    if (resp.errors)
                                    {                                    
                                        $('.Input').keyup(function () { 
                                            $(".SiteEventI18n").removeClass('intro');
                                        });
                                        $.each(resp.errors,function (name,error) { $(".SiteEventI18n[name="+name+"]").addClass('intro'); });
                                        return ;
                                    }
                                }
               }); 
        
        });
        
   $("#DeletePicture").click( function () { 
            if (!confirm('{__("Picture  #0# will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
            return $.ajax2({ data :{ SiteEvent: {if $event_i18n->getEvent()->isLoaded()}'{$event_i18n->get('event_id')}'{else}$("#Event-ctn").attr('data-id'){/if} },
                             url :"{url_to('site_event_ajax',['action'=>'DeletePictureEvent'])}",                               
                             success : function(resp) {                                     
                                   if (resp.action!='DeletePictureEvent') return ;                                          
                                   $(".PictureExist,#DeletePicture").hide();  
                                   $("#NoPicture").css({
                                        'display':'block',
                                        'position': 'absolute',
                                        'width': '96%',
                                        'top': '25%',
                                   });

                             }
                 });                                        
        });       

if ($("#DropZonePicture").find('.dz-default').length)
             $("#DropZonePicture")[0].dropzone.off().destroy();
           
            
     $("#DropZonePicture").dropzone({
      url: "{url_to("site_event_ajax",['action'=>'UploadPictureNewEvent'])}",
     // clickable: false,
      params: {                      
                "UploadPictureEvent[token]" : '{mfForm::getToken('UploadPictureEventNewForm')}' 
              },   
      paramName: "UploadPictureEvent[file]",
      parallelUploads : 20,
      maxFiles : 24,
      maxFilesize : 24,   
      sending : function (file, xhr, formData) {                               
          if ( !$("#Event-ctn").attr('data-id')) return ;                                  
          formData.append('UploadPictureEvent[id]', $("#Event-ctn").attr('data-id'));                                 
      },                   
      success : function (file,resp)
      {              
          // console.log("Status="+response.status);
           if (resp.errors || resp.status)                 
               return ;                                               
          $("#DropZonePicture").find('.dz-preview').remove();                
          $("#Picture-img").attr('src',resp.url).show(); 
          $("#Event-ctn").attr('data-id',resp.id);
          $('#DeletePicture').show();
      }                  
    });
    
    
       $("#Modal-Speakers-Close").click(function () {  $("#Modal-Speakers").hide(); });     
      
   $("#Dialog-SiteEventSpeakerUsers").click(function () { 
           var params = { SiteEventSpeakers : {  selection : {$event_i18n->getEvent()->getEventSpeakerUsers()->getSpeakerUsers()->getKeys()->toJson()},  
                                                  token : '{mfForm::getToken('SiteEventSpeakerSelectionForm')}' } };      
            $(".SiteEventSpeakerUsers-list").each(function() { params.SiteEventSpeakers.selection.push($(this).attr('id'));  }); 
             return $.ajax2({      
                         data : params,
                         url:"{url_to('site_event_ajax',['action'=>'ListPartialDialogSpeaker'])}",                                              
                         success : function () { $("#Modal-Speakers").show(); },
                         target: "#Modal-Speakers-ctn"
                       });     
     }); 
     
       $("#AddSpeakers").click(function () { 
            var params = { SiteEventSpeakerUsers : {  selection: $("#DialogSpeakerUserList").data("selection"), token : '{mfForm::getToken('SiteEventSpeakerUsersAddForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('site_event_ajax',['action'=>'AddSpeakersForEvent'])}",    
                  success : function () {   $("#Modal-Speakers").hide(); },
                  target: "#speakers-ctn"
              });
     });
      
     $(".SiteEventSpeakerUser-Delete").click(function () {                
            $(".SiteEventSpeakerUser-list[id="+$(this).attr('id')+"]").remove();
     }); 
     
     
     
      if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
                                                 
         $("#DropZone").dropzone({
            url: "{url_to("site_event_ajax",['action'=>'UploadDocumentEvent'])}",
            clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadDocumentEvent[token]" : '{mfForm::getToken('SiteEventUploadDocumentEventForm')}' 
                    },   
            paramName: "UploadDocumentEvent[file]",
            createImageThumbnails : false,          
            parallelUploads : 1,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                if ($(".SiteEventDocuments-list[name=id]").attr('id'))
                    formData.append('UploadDocumentEvent[id]',$(".SiteEventDocuments-list[name=id]").attr('id'));             
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                if (response.errors || response.status)
                {    
                    $("#alertErrors").css('display','block');
                    $("#alertErrors").html(response.errors.file);
                    return ;  
                }                                             
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();
                 $(".SiteEventDocuments-list:last").after(response);  
            }                  
    });
    
    
    
    $(".SiteEventDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { SiteEventDocument : $(this).attr('id') },
                         url:"{url_to('site_event_ajax',['action'=>'DeleteDocumentEvent'])}",                                              
                         success : function (resp) { 
                            $(".SiteEventDocuments-list[id="+resp.id+"]").remove();
                            }
                          
                       });                      
     });  
</script>