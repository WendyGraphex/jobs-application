<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Employer City Galleries")}</h3>
        <h3 class="admin-header-small-text">{__("Employer City galleries Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">                               
                 <a class="btn btn-danger admin-header-button btn-color"  href="#" id="New"><i class="fa fa-plus"></i> 
                      {if $item_i18n->getGallery()->hasCities()}{__('Add/Remove Employers')}{else}{__('Add Cities')}{/if}
                     </a>
                {if $item_i18n->getGallery()->getNumberOfCities()->getValue() > 1}
                <a href="#" class="btn btn-info admin-header-button btn-color" id="Positions" title="{__('Positions')}">
                <i class="fa fa-bars" style="margin-right: 5px;"></i>
                {__('Positions')}               
                </a>
                {/if}
                    <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employer City Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Gallery %s',(string)$item_i18n)}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Cities')}     
    </p>
</div>
{alerts}  
{if $item_i18n->getGallery()->isLoaded()}
<div class="table-responsive bg-white px-2 py-2">
    <div>                    
       {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
    </div>
    <div class="col-md-12 padd-col">
         <div class="float-left w-50">
              {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
         </div> 
         <div class="float-right w-50">                   
               <button  id="filter" class="btn btn-primary btn-color btn-f" >{__("Filter")}</button>   
               <button  id="init" class="btn btn-primary btn-color btn-init btn-f">{__("Init")}</button>
        </div>
    </div>     
                 
    <div class="table-responsive"> 
     <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col">
      <table id="DialogEmployerList" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="bg-info thead-color">
        <tr role="row">
            <th>#</th>            
           <th><span>{__('ID')}</span>
                        <div class="d-inline-block">
                             <a href="#" class="dialog-order{*$formFilter.order.id->getValueExist('asc','_active')*}" id="asc" name="id"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="dialog-order{*$formFilter.order.id->getValueExist('desc','_active')*}" id="desc" name="id"><i class="fas fa-sort-down"></i></a>            
                        </div>
              </th>
              <th></th>
               <th><span>{__('Position')}</span>                 
              </th>             
            <th><span>{__('Title')}</span>
                         <div class="d-inline-block">
                             <a  href="#" class="dialog-order{*$formFilter.order.title->getValueExist('asc','_active')*}" id="asc" name="title"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a  href="#" class="dialog-order{*$formFilter.order.title->getValueExist('desc','_active')*}" id="desc" name="title"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>   
          
        </tr>
      </thead>
      <tbody class="tablebody">
          <tr role="row">
              <td></td>                 
              <td><input class="form-control form-control-sm ml-1 dialog-search" name="id" value="{*$formFilter.search.id*}"/></td>      
              <td></td>
              <td></td>      
              <td><input class="form-control form-control-sm ml-1 dialog-search" name="title" value="{*$formFilter.search.title*}"/></td>                                                        
          </tr>
      
       {foreach $pager as $item} 
      <tr class="DialogCityList list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>          
          <td>{$item->get('id')}</td>    
          <td>
            {if $item->getCity()->hasPicture()}<img src="{$item->getCity()->getPicture()->getMedium()->getURL()}" height="128px" width="128px" alt="{__('Picture')}"/>  {/if}                    
          </td>
          <td>{$item->get('position')}</td>               
          <td>{if $item->getCity()->hasI18n()}{$item->getCity()->getI18n()->get('title')}{else}{__('---')}{/if}
          </td>                                                
             </tr>
        {/foreach}
         {if !$pager->hasItems()}
             <tr role="row" >
                 <td  colspan="3">{__('No city')}</td>
             </tr>
        {/if}  
        </tbody>         
    </table>
      </div>
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
  </div>
</div>
  

<div id="Modal-Cities" class="modal" role="dialog">
       <div class="modal-dialog modal-lg model-cat-employer">    
     <div class="modal-content">
        <div class="px-2"><span class="close" id="Modal-Cities-Close">&times;</span></div>  
         <div id="Modal-Cities-ctn">            
         </div>
         <div class="col-md-12" style="padding: 0;">
               <div class="Addbtn px-2"> 
                  <a href="#" id="AddCities" class="btn btn-success admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add cities')}</a>                
               </div>
          </div>
     </div>
       </div>
 </div>
      
<script type="text/javascript">              
    function getFilterParameters()
        {
            var params={  EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
                          filter: {  order : { }, 
                                    search : { },
                                    equal: { },     
                                    range : { },
                                lang: $("#SelectListLanguages option:selected").attr('id'),  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                              
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");                   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')]) params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function () { 
                return $.ajax2({ 
                         data : { EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' } },
                         url:"{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}",                                
                         target: "#actions"
                });
        });
        
        $("#SelectListLanguages").change(function() {  updateFilter();   });
              
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}",                                
                                 target: "#actions"
                });
        });
         
     {* =================== A C T I O N S ================================ *}
 
     $("#Modal-Cities-Close").click(function () {  $("#Modal-Cities").hide(); });
     
     $('#Cancel').click(function(){                
             return $.ajax2({ url : "{url_to('employers_ajax',['action'=>'ListPartialCity'])}",                                                 
                              target: "#actions"}); 
      });
      
       $('#New').click(function(){                      
             return $.ajax2({ data : { EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' } },
                              url : "{url_to('employers_ajax',['action'=>'ListPartialDialogCityForGalleryI18n'])}",                                                 
                              success : function () { $("#Modal-Cities").show(); },
                              target: "#Modal-Cities-ctn"
                              }); 
      }); 
      
       $("#AddCities").click(function () {                            
          var params = { 
              EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
              AddCities : {  selection: $("#DialogCityList").data('selection'),token : '{mfForm::getToken('AddCitiesForGalleryI18nForm')}' }
                       };          
          return $.ajax2({  
                         data : params,
                         url:"{url_to('employers_ajax',['action'=>'AddCitiesForGalleryI18n'])}",                            
                         success : function (resp) { 
                             if (resp.errors)
                             {
                                 return ;
                             }    
                             $("#Modal-Cities").hide(); 
                             $("#actions").html(resp);
                         }
                         
                       }); 
     });  
   
    $("#Positions").click( function () {                
                return $.ajax2({ 
                                data : {  EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' }  },
                                url:"{url_to('employers_ajax',['action'=>'PositionsCityForGalleryI18n'])}",
                                target: "#actions"});
         }); 
</script>
{else}
    {__('Gallery is invalid.')}
{/if}          