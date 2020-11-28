{messages class="errors-ChangePage"}
<h3>{__("change page")|capitalize}</h3>
<div>
    <a href="#" id="PageI18nChange-Save" style="display:none"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>
    <a href="#" id="PageI18nChange-Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')}</a>      
</div> 
{component name="/CMS_pages/selectListFilterPageI18n" language=$pageI18n->get('lang') selected=$pageI18n->get('id')}
<script type="text/javascript">
    
     $("#SelectListFilterPageI18n").bind('select',function(){  $("#PageI18nChange-Save").show(); });
     
     $("#PageI18nChange-Cancel").click(function() {     
        $("#node_content").html("");
     });
     
     $("#PageI18nChange-Save").click(function() {                         
         var params={ 
                 MenuChangePage : {  
                        id : "{$menu->get('id')}",    
                        lang: "{$pageI18n->get('lang')}",
                        page_id : $("#SelectListFilterPageI18n").data('object').page_id,
                        token : "{mfForm::getToken('cmsMenuChangePageForm')}"
             }
         };
        // alert("Params="+params.toSource());
        return $.ajax2({ 
                      data : params,                   
                      url : "{url_to('cms_menus_pages_ajax',['action'=>'SaveChangePage'])}",
                      errorTarget: ".errors-ChangePage",
                      success : function(response)
                                {                                                                                          
                                      $(".tree_page.selected").children("span#title").html(response.meta_title);
                                      $(".tree_page.selected").attr('name',response.id); // Update id
                                      $(".tree_page.selected").children("img#status").attr('src','{url("/icons/pages/pages","picture")}'+response.status+'.gif');                                   
                                } 
                       });
     });
     
</script>