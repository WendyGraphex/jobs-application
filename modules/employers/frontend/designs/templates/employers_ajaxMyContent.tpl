<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My Page')}</h2>         
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
                    <p class="text-primary mb-0 hover-cursor">{__('My page')}</p>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;-&nbsp;</p>
                    <p class="text-primary mb-0 hover-cursor"><a href="{$form->getUser()->getUrl()}">{$form->getUser()->getFormatter()->getName()->ucfirst()}</a></p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employer-myPage"}
    </div>
</div>
{alerts}  

<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
            <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div>     

<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">             
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                {foreach $form->getLanguages() as $language}
                    <li class="nav-item">            
                        <a class="nav-link {if $language@first}active{/if}"  id="language-{$language->get('code')}-tab" data-toggle="tab" href="#{$language->get('code')}" role="tab" aria-controls="{$language->get('code')}" aria-selected="true">
                            {$language->getFormatter()->getText()->ucfirst()}
                            {if $form.contents[$language@index]->hasError()}<span style="color:red">?</span>{/if}
                        </a>
                    </li>        
                {/foreach}
                <li class="nav-item">            
                    <a class="nav-link" id="picture-tab" data-toggle="tab" href="#picture" role="tab" aria-controls="picture" aria-selected="true">
                        {__('Picture')}
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                {foreach $form->getLanguages()->byIndex() as $index=>$language}
                    <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Title")}{if $form->contents[$index].meta_title->getOption('required')}*{/if}</label>
                                    <div>{$form.contents[$index].meta_title->getError()}</div>
                                    <input type="text" class="EmployerContentI18n Input form-control" data-lang="{$language->get('code')}" name="meta_title" value="{if $form->hasErrors()}{$form.contents[$index].meta_title|escape}{else}{$form->getUser()->getContents()->getItemByIndex($index)->get('meta_title')|escape}{/if}">
                                </div>                    
                            </div>  
                        </div>
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Short description")}{if $form->contents[$index].meta_description->getOption('required')}*{/if}</label>
                                    <div>{$form.contents[$index].meta_description->getError()}</div>
                                    <textarea cols="40" rows="5" class="EmployerContentI18n Input form-control" data-lang="{$language->get('code')}" name="meta_description">{if $form->hasErrors()}{$form.contents[$index].meta_description|escape}{else}{$form->getUser()->getContents()->getItemByIndex($index)->get('meta_description')|escape}{/if}</textarea>
                                </div>                    
                            </div>  
                        </div>
                        <div class="row mt-3">                       
                            <div class="form col-md-12">                                   
                                <div class="form-group">                          
                                    <label>{__("Description")}{if $form->contents[$index].description->getOption('required')}*{/if}</label>
                                    <div>{$form.contents[$index].description->getError()}</div>
                                    <textarea cols="40" rows="10" class="EmployerContentI18n Textarea Input form-control" data-lang="{$language->get('code')}" name="description">{if $form->hasErrors()}{$form.contents[$index].description|escape}{else}{$form->getUser()->getContents()->getItemByIndex($index)->get('description')|escape}{/if}</textarea>
                                </div>                    
                            </div>  
                        </div>                  
                    </div> 
                {/foreach}
                {*===============================================================================================================*}
                <div class="tab-pane fade show" id="picture" role="tabpanel" aria-labelledby="picture-tab" style="padding-top: 10px;">                                                                                    
                    <div class="row portfolio-grid">
                        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                            <figure class="effect-text-in ModeDisplay" id="Picture">
                                <div id="DropZonePicture" class="dropzone dp-addFile pt-1">                                                  
                                    {if $form->getUser()->getContent()->isLoaded()}
                                        {if $form->getUser()->getContent()->hasPicture()}
                                            <div class="PictureExist" id="Picture"> 
                                                <div class="div-img h-100">
                                                    <img id="Picture-img" class="img-dpzone img-product" src="{$form->getUser()->getContent()->getPicture()->getMedium()->getUrl()}"/>
                                                </div> 
                                                <div class="dz-message" data-dz-message style="margin-bottom: 0px;"><span style="font-size: 14px;">{__('Drop file here to upload change')}</span></div>
                                            </div>    
                                        {else}
                                            <div id="NoPicture" {if $form->getUser()->getContent()->hasPicture()}style= "display:none;"{/if}>
                                                <i class="fa fa-plus plus-icon" style="z-index: 1;position: relative;"></i>                                
                                                <img id="Picture-img" style="position: absolute; left: 0px; margin: 0px auto;top: 0px;padding: 10px;text-align: center;right: 0px;" {*style="display:none;position: absolute;left: 0px;margin: 0 auto;width: 100%;top: 20px;"*} class="img-dpzone img-product img-NoPicture">                                
                                                <div class="dz-message" data-dz-message><span style="font-size: 14px;">{__('Drop file here to upload')}</span></div>
                                            </div>
                                        {/if} 
                                    {/if}
                                </div>
                                <figcaption>                             
                                </figcaption>                          
                            </figure>
                        </div>
                        <div class="col-2">  
                            <a href="#" class="list-action Mode" id="Picture" name="NORMAL"><i id="Picture" class="ModeAwe far fa-square"></i></a>
                            <a href="#" {if !$form->getUser()->getContent()->hasPicture()}style="display:none"{/if} id="DeletePicture" name="{$form->getUser()->getContent()->get('picture')}" class="list-action"><i class="fa fa-trash"></i></a>
                        </div>           
                    </div>
                </div>
            </div>
        </div>
    </div>
            
<script type="text/javascript">
    
    $( '.Textarea' ).ckeditor();
       
    $("#Save").click(function () { 
        var params = {   MyContent :  {  contents : [ ],token : '{$form->getCSRFToken()}' } };
        $(".Languages").each(function () { 
              var i18n = { lang : $(this).attr('id') };
              $(".EmployerContentI18n[data-lang="+$(this).attr('id')+"]").each(function () {  i18n[$(this).attr('name')]=$(this).val(); });            
              params.MyContent.contents.push(i18n);
        });           
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('employers_ajax',['action'=>'MyContent'])}",           
            target: "#page-wrapper"
        });
    
    });
       
    $('#Dashboard').click(function(){                                       
      return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                       target: "#page-wrapper"}); 
    });

    if ($("#DropZonePicture").find('.dz-default').length)
         $("#DropZonePicture")[0].dropzone.off().destroy();
                                                 
    $("#DropZonePicture").dropzone({
        url: "{url_to("employers_ajax",['action'=>'UploadPictureContent'])}",
        dictDefaultMessage : '{__('Drop file to upload')}',
        params: {  
                    "EmployerPictureContentUpload[token]" : '{mfForm::getToken('EmployerPictureContentUploadForm')}' 
                },   
        paramName: "EmployerPictureContentUpload[file]",
        createImageThumbnails : false,          
        parallelUploads : 1,
        maxFiles : 1,
        maxFilesize : 24,                             
        success : function (file,resp)
        {              
            if (resp.errors || resp.status)
            {    
                $("#alertErrors").css('display','block');
                $("#alertErrors").html(resp.errors.file);
                return ;  
            }                                             
            $("#DropZonePicture").find('.dz-preview').remove();                
            $("#Picture-img").attr('src',resp.url).show(); 
            $('#DeletePicture').show();
        }                  
    }); 
       
    $("#DeletePicture").click( function () { 
        if (!confirm('{__("Picture  will be deleted. Confirm ?")}')) return false; 
        return $.ajax2({ url :"{url_to('employers_ajax',['action'=>'DeletePictureContent'])}",                               
                        success : function(resp) {                                     
                            if (resp.action!='DeletePictureContent') return ;                                          
                            $(".PictureExist,#DeleteContent").hide();  
                            $("#NoPicture").css({
                                 'display':'block',
                                 'position': 'absolute',
                                 'width': '96%',
                                 'top': '25%',
                            });
                            $("#NoPicture").show();
                            $(".img-NoPicture").hide();                
                        }
             });                                        
    });
        
</script> 
            