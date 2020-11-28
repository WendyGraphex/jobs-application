{messages}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Menus')}</h3>
        <h3 class="admin-header-small-text">Menus{__('Gestion CMS pages')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Pages" class="btn btn-info admin-header-button">
                <i class="fa fa-list-ul" style="margin-right:5px;"></i>
                {__('Pages')}
            </a> 
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CMS pages')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Menu')}
    </p>
</div> 
<div style="background-color: white; padding: 10px;">
  
    {component name="/site_languages/selectListLanguagesFrontend" selected=(string)$form.lang}
        
    {component name="/cms_pages/menuTree" lang=(string)$form.lang}
</div>


<script type="text/javascript">
                 
    $('#Pages').click(function(){ 
                var params={ filter: {  
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                                 
                                   token:'{mfForm::getToken('CmsPageI18nFormFilter')}'
                       } };               
                return $.ajax2({ data: params, 
                                 url:"{url_to('cms_pages_ajax',['action'=>'ListPartial'])}",
                                 target: "#actions"});             
    });  
</script> 