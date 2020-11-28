{messages}
{*  data for language   *}
<div>
    <span>{__('country selected')}:</span>
    <img class="cms_pages" id="{$form.lang}" name="lang" src="{url("/flags/`$form.lang`.png","picture")}" title="{format_country($form.lang)}" />
    <span>{format_country($form.lang)}</span> 
    <a id="ChangeLanguage" href="#"><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change')|capitalize}</a>
</div> 
<style> .ui-dialog { font-size: 62.5%; } </style>
{component name="/languages/dialogListLanguagesFrontend" selected=(string)$form.lang}
{component name="/CMS_pages/menuTree"}

<script type="text/javascript">
    
            // {* Events inter component *}
            $("#dialogListLanguages").bind('select',function(event){             
                return $.ajax2({
                    data: { language : { 
                                    lang: event.selected.id,
                                    token: "{mfForm::getToken('MenuLanguageForm')}"
                                  }  
                           },
                    url : "{url_to('cms_menus_pages_ajax',['action'=>'RefreshTree'])}",
                    target: "#actions"
                });
            });
            
            $("#ChangeLanguage").click(function() { 
                $("#dialogListLanguages" ).dialog( "open" );    
            });
                       
</script>            