<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Events')}</h3>
        <h3 class="admin-header-small-text">{__('Event management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
             {if !$event_i18n->getEvent()->hasPublishedAt()}                
                    <a href="#" id="Publish" class="btn btn-info admin-header-button"><i class="fa fa-reply"/>{__('Publish')}</a>                              
            {/if}
            {if !$event_i18n->getEvent()->hasRefusedAt()}                      
                    <a href="#" id="Refuse" class="btn btn-warning admin-header-button"><i class="fa fa-times-circle"/>{__('Refuse')}</a>               
            {/if}             
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Event')}
    </p>
</div>
{alerts}
{if $event_i18n->getEvent()->isLoaded()}
    <div id="Event-ctn" class="tablewhiteback" style="padding: 20px;">
        <div class="row">
            <div class="form-group col-md-6">                                                              
                {component name="/site_languages/selectListLanguagesFrontend" selected=$event_i18n->get('lang')}
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
                        <td>{__('Price')}:</td>
                        <td>                          
                            <input class="form-control" readonly="" type="text" size="10" value="{$event_i18n->getEvent()->getFormatter()->getPrice()->getAmount()}"/></td>
                    </tr>
                    <tr style="height: 60px;">
                        <td>{__('Starting at')}:</td>
                        <td>
                            <div style="color: red;"></div> 
                            <input id="last_time_from" class="form-control" type="text" readonly="" size="10" value="{format_date($event_i18n->getEvent()->get('in_at'),'a')}"/></td>
                    </tr>
                    <tr style="height: 60px;">
                        <td>{__('Ending at')}:</td>
                        <td>                           
                            <input class="form-control" readonly="" id="last_time_to" type="text" size="10" value="{format_date($event_i18n->getEvent()->get('out_at'),'a')}"/></td>
                    </tr> 
                    <tr style="height: 60px;">
                        <td>{__('Number of people')}:</td>
                        <td>                          
                            <input class="form-control"  readonly="" type="text" name="number_of_people" size="10" value="{$event_i18n->getEvent()->get('number_of_people')}"/></td>
                    </tr> 
                    <tr style="height: 60px;">
                        <td>{__('City')}:</td>
                        <td>                         
                            <input class="form-control" readonly="" type="text" size="10" value="{$event_i18n->getEvent()->get('city')}"/></td>
                    </tr> 
                    <tr style="height: 60px;">
                        <td>{__('Country')}:</td>
                        <td>                        
                            {$event_i18n->getEvent()->getFormatter()->getCountry()->ucfirst()}
                        </td>
                    </tr> 
                    <tr style="height: 60px;">
                        <td>{__('Place')}:</td>
                        <td>                         
                            {$event_i18n->getEvent()->getPlace()->getFormatter()->getName()}
                        </td>
                    </tr> 
                </table>
            </div>
            {* ============== R E F E R E N C E M E N T ========================================= *}
            <div class="tab-pane fade" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
                <table cellpadding="0" cellspacing="0">
                    <tr style="height: 60px;">
                        <td style="width: 150px;">{__('Url')}:</td>
                        <td>
                            <div style="color: red;"></div> 
                            <input class="form-control" type="text" readonly="" value="{$event_i18n->get('url')}"/>
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td>{__('Title')}:</td>
                        <td><input class="form-control" type="text" readonly="" value="{$event_i18n->get('meta_title')}"/></td>
                    </tr>
                    <tr style="height: 60px;">
                        <td>{__('Description')}:</td>
                        <td><textarea class="form-control" readonly=""  rows="5" cols="40" style="margin-bottom: 20px;">{$event_i18n->get('meta_description')}</textarea></td>
                    </tr>               
                    <tr style="height: 60px;">
                        <td>{__('Keywords')}:</td>
                        <td><textarea class="form-control" readonly="" rows="5" cols="40">{$event_i18n->get('meta_keyword')}</textarea>
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
                                {if $event_i18n->getEvent()->hasPicture()}
                                    <div class="PictureExist" id="Picture"> 
                                        <div class="div-img h-100">
                                            <img id="Picture-img" class="img-dpzone img-product" src="{$event_i18n->getEvent()->getPicture()->getMedium()->getUrl()}"/>
                                        </div>                                        
                                    </div>                                                                                              
                                {/if}
                            </div>
                            <figcaption>                             
                            </figcaption>                          
                        </figure>
                    </div>                            
                </div>
            </div>  
            {* ============== SPEAKERS ========================================= *}
            <div class="tab-pane fade" id="t-speakers" role="tabpanel" aria-labelledby="t-speakers-tab">           
                
                <div id="speakers-ctn">
                    <div id="SiteEventSpeakerUsers" style="padding-top: 15px;">                               
                        {foreach $event_i18n->getEvent()->getEventSpeakerUsers()->getSpeakerUsers() as $speaker} 
                            <div class="SiteEventSpeakerUser-list" id="{$speaker->get('id')}">                                              
                                <div class="btn btn-outline-primary SiteEventSpeakerUser" id="{$speaker->get('id')}">
                                    {$speaker->getFormatter()->getName()}                                                                                                                                                             
                                </div> 
                            </div>
                        {/foreach}    
                    </div>
                </div>

                

            </div> 
            {* ============== DOCUMENTS ========================================= *}
            <div class="tab-pane fade" id="t-documents" role="tabpanel" aria-labelledby="t-documents-tab">           
                <div class="row portfolio-grid">                   
                    {foreach $event_i18n->getEvent()->getDocuments() as $document}
                        <div class="SiteEventDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
                            <figure class="effect-text-in classBorderSolid">
                                <div class="div-img h-100 dz-image">
                                    {if  $document->getFile()->isPicture()}
                                        <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                    {else}
                                        <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                    {/if}
                                </div>
                                <figcaption class="text-left">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <div class="pr-1">
                                                <h6 class="PicturesCount">{$document@iteration}</h6>
                                            </div>
                                        </div>
                                        <div class="col-md-9" style="padding-left: 0px;padding-right: 0px;">
                                            <div class="pic-title text-left">
                                                <h6 class="picture-title w-100">                                                                          
                                                    <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                                </h6>
                                            </div>
                                        </div>
                                         
                                </figcaption> 
                            </figure>        
                        </div> 
                    {/foreach}                                                                                                                                         
                </div>  
            </div> 
            {* ============== DESCRIPTION ========================================= *}
            <div class="tab-pane fade" id="t-description" role="tabpanel" aria-labelledby="t-description-tab">           
                <textarea id="ShortDescription" readonly="" class="Fields form-control" rows="5" cols="40" style="margin-bottom: 20px;">{$event_i18n->get('description')}</textarea>           
            </div>           
            {* ============== C O N T E N T ========================================= *}
            <div class="tab-pane fade" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
                <textarea  id="Content" readonly="" rows="15" cols="80" style="margin-top: 15px;" class="Fields form-control">{$event_i18n->get('content')}</textarea>
            </div>
        </div>
    </div>  
</div>
<script type="text/javascript">
           
        
        
     
        $('#Cancel').click(function(){ 
                var params={ filter: {  
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                                
                                   token:'{mfForm::getToken('SiteEventFormFilter')}'
                       } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}",
                                 target: "#actions"});             
        });
      

        $('#Publish').click(function(){                
             return $.ajax2({ data : { SiteEvent : '{$event_i18n->getEvent()->get('id')}' },  
                              url : "{url_to('site_event_ajax',['action'=>'PublishEvent'])}",                                                 
                               success : function(resp)
                                {
                                    $("#Publish").hide();
                                    $("#Refuse").show();
                                }
        }); 
      });     
      
      $('#Refuse').click(function(){                
             return $.ajax2({ data : {  SiteEventI18n : '{$event_i18n->getEvent()->get('id')}' },  
                              url : "{url_to('site_event_ajax',['action'=>'RefuseEvent'])}",                                                 
                              success : function(resp)
                                {
                                     $("#Refuse").hide();
                                      $("#Publish").show();
                                }
                    }); 
      }); 
    
</script>
{else}
    {__('Event is invalid')}
{/if}    