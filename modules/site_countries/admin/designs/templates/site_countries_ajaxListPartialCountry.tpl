{messages}
    <!-- Begin page heading -->
<div class="row admin-header-container">
  <div class="col-sm">
      <h3 class="admin-header-big-text">{__('Countries')} </h3>
      <h3 class="admin-header-small-text">{__('Countries management')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;">
          <a class="btn  btn-success admin-header-button" href="#" id="Add">
              <i class="fa fa-plus"></i>
              {__('Add country')}
          </a>
      </div>
  </div>  
</div>          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Countries')}
    </p>
</div>
          <!-- End breadcrumb -->

          
          <div class="table-responsive bg-white px-1 py-2">
              <div class="col-md-12" style="float: left; margin-top: 8px;">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                 </div>              
             </div>
                 {*<div class="row float-left mt-2" style="margin: 0 0;">
                <div class="col-sm-12">*}
                     <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
                        <thead  class="bgSpec">
                          <tr role="row">
                             <th style="width: 100px;">{__('ID')}           
                                <div style="float: right;">
                                       <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                                       <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                                   </div>
                           </th>                            
                               <th class="sorting" style="width: 1082px;">{__('Name')}</th>     
                              <th class="sorting" style="width: 100px;">{__('Actions')}</th></tr>
                        </thead>
                        <tbody> 
                        {foreach $pager as $item}
                            <tr id="{$item->get('id')}" role="row">
                                <td>{$item->get('id')}</td>                               
                                <td>
                                     <img src="{url("/flags/`$item->getCode()->getCode()->lower()`.png","picture")}"/> {$item}
                                </td>     
                                <td>                                   
                                  <a href="#" id="{$item->get('id')}" class="View list-action text-info" data-toggle="tooltip" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
                                  <a href="#" id="{$item->get('id')}" class="Languages list-action text-info" data-toggle="tooltip" title="{__('Language')}"><i class="fa fa-globe"></i></a>
                                  <a href="#" id="{$item->get('id')}" name="{$item}" class="Delete list-action text-danger" data-confirm="{__('Are you sure ?')}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        {/foreach}    
                        </tbody>
                    </table>
                </div>
            </div>                                                        
          </div>
          {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
                        
                        
<script type="text/javascript">

        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },                                                                                                                                   
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}" ,                          
                            target: "#page-wrapper"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });
    
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}?page="+$(this).attr('data-page'),                                
                                 target: "#page-wrapper"
                });
        });
          
          
    $(".View").click( function () {                    
                return $.ajax2({ data : { SiteCountry : $(this).attr('id') },                               
                                url:"{url_to('site_countries_ajax',['action'=>'ViewCountry'])}",                             
                                target: "#page-wrapper"});
         });
   
   $("#Add").click( function () {             
            return $.ajax2({                    
                url: "{url_to('site_countries_ajax',['action'=>'AddCountry'])}",               
                target: "#page-wrapper"
           });
         });
         

 $(".Delete").click( function () { 
                if (!confirm('{__("Country \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteCountry: $(this).attr('id') },
                                 url :"{url_to('site_countries_ajax',['action'=>'DeleteCountry'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCountry') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            }); 
            
            
             $(".Languages").click(function() { 
                        return $.ajax2({ 
                            data : {   SiteCountry :   $(this).attr('id') },
                            url: "{url_to('site_countries_ajax',['action'=>'AddLanguageForCountry'])}",                          
                              target: "#page-wrapper"
                    });
         });
</script>
