{messages class="site-errors"}
<div class="row admin-header-container">
    <div class="col-sm">
      <h3 class="admin-header-big-text">{__('Site')}</h3>
      <h3 class="admin-header-small-text">{__('Google Map requests')}</h3>
    </div>
    {*<div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times mr-2"></i>{__('Cancel')}</a> 
        </div> 
    </div>*}
</div>
<div class="breadcrumb-title">
    <p>              
        <i class="fa fa-home" style="color: #37bc9b;"></i>               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Google Map requests')}
    </p>
</div>
        {*alerts*}
        
{*<div>    
      <a href="#" id="Cancel" class="btn">
          <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>{__('Cancel')}</a>  
</div>  *}

{*{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="GoogleMapAddress"}
<button id="GoogleMapAddress-filter" style="width:120px" class="btn-table">{__("Filter")}</button> 
<button id="GoogleMapAddress-init" class="btn-table">{__("Init")}</button>*}


<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="GoogleMapAddress"}
        </div>
        <button id="GoogleMapAddress-filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
        <button id="GoogleMapAddress-init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
    </div>


 <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0">  
     <thead class="bgSpec"> 
    <tr  class="list-header">     
    <th data-hide="phone" style="display: table-cell;" >#</th>  
        <th>{__('ID')}           
            <div style="float: right;">
                <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>
        </th>  
        <th>
            <span>{__('Signature')}</span>               
        </th> 
         <th>
            <span>{__('Address')}</span>               
        </th>  
         <th>
            <span>{__('Coordinates')}</span>               
        </th>  
         <th>
             <span>{__('Error')}</span>     
        </th>
        <th>
             <span>{__('Requested at')}</span>     
        </th>        
    </tr>
</thead>
    {* search/equal/range *}
     <tr class="input-list">
       <td>{* # *}</td>   
           <td>{* # *}</td>   
           <td>
               <input class="form-control GoogleMapAddress-search" name="signature" placeholder="{__('Signature')}" value="{(string)$formFilter.search.signature}"/>
           </td>     
           <td>
               <input class="form-control GoogleMapAddress-search" name="address" placeholder="{__('Address')}" value="{(string)$formFilter.search.address}"/>
           </td>          
           <td>
              <input class="form-control GoogleMapAddress-search RowBlock" placeholder="{__('Lat')}" name="lat" value="{(string)$formFilter.search.lat}"/>
              <input class="form-control GoogleMapAddress-search RowBlock" placeholder="{__('Lng')}" name="lng" value="{(string)$formFilter.search.lng}"/>
           </td>     
           <td>
                <input class="form-control GoogleMapAddress-search" placeholder="{__('Error')}" name="error" value="{(string)$formFilter.search.error}"/>
           </td>  
           <td>
                <input class="form-control GoogleMapAddress-range RowBlock" id="from" name="created_at" placeholder="{__('From')}" value="{if $formFilter.range.created_at->getValue()}{format_date($formFilter.range.created_at.from,'a')}{/if}"/>
                <input class="form-control GoogleMapAddress-range RowBlock" id="to" name="created_at"placeholder="{__('To')}" value="{if $formFilter.range.created_at->getValue()}{format_date($formFilter.range.created_at.to,'a')}{/if}"/>
           </td>  
      
    </tr>
        {foreach $pager as $item}
    <tr class="GoogleMapAddress list" id="GoogleMapAddress-{$item->get('id')}"> 
        <td class="GoogleMapAddress-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        <td> 
                {$item->get('id')}
            </td> 
             <td> 
                {$item->get('signature')}
            </td>
            <td> 
                {$item->get('address')}
            </td>          
            <td>
                {if $item->hasError()}
                    {__('---')}
                {else}    
                {$item->getCoordinates()}
                {/if}
            </td>
            <td>
               {if $item->hasError()}
                    {$item->get('error')}
                {else}    
                    
                {/if} 
            </td>
            <td>
               {$item->getCreatedAt()->getFormatted(['d','q'])} 
            </td>
           
    </tr>    
    {/foreach}  
</table>    
 {if !$pager->getNbItems()}
     <span>{__('No address')}</span>
{else}
   
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="GoogleMapAddress"} 
 



<script type="text/javascript">        
            
       
        function getSiteGoogleMapAddressFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    range: { created_at : { from : $(".GoogleMapAddress-range[id=from]").val(), to : $(".GoogleMapAddress-range[id=to]").val() }  }, 
                                    equal: { },                                                                                                                                 
                                nbitemsbypage: $("[name=GoogleMapAddress-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".GoogleMapAddress-order_active").attr("name"))
                 params.filter.order[$(".GoogleMapAddress-order_active").attr("name")] =$(".GoogleMapAddress-order_active").attr("id");   
            $(".GoogleMapAddress-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateSiteGoogleMapAddressFilter()
        {          
           return $.ajax2({ data: getSiteGoogleMapAddressFilterParameters(), 
                           url:"{url_to('google_maps_ajax',['action'=>'ListPartialRequest'])}",
                         errorTarget: ".site-errors",
                         loading: "#tab-site-dashboard-x-settings-loading",                         
                          target: "#google-map-actions"
                             });
        }
    
        function updateSitePager(n)
        {
           page_active=$(".GoogleMapAddress-pager .GoogleMapAddress-active").html()?parseInt($(".GoogleMapAddress-pager .GoogleMapAddress-active").html()):1;
           records_by_page=$("[name=GoogleMapAddress-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".GoogleMapAddress-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#GoogleMapAddress-nb_results").html())-n;
           $("#GoogleMapAddress-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#GoogleMapAddress-end_result").html($(".GoogleMapAddress-count:last").html());
        }
                   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#GoogleMapAddress-init").click(function() {               
              return  $.ajax2({ url:"{url_to('google_maps_ajax',['action'=>'ListPartialRequest'])}",
                         errorTarget: ".site-errors",
                         loading: "#tab-site-dashboard-x-settings-loading",                         
                          target: "#google-map-actions"  }); 
           }); 
    
          $('.GoogleMapAddress-order').click(function() {
                $(".GoogleMapAddress-order_active").attr('class','GoogleMapAddress-order');
                $(this).attr('class','GoogleMapAddress-order_active');
                return updateSiteGoogleMapAddressFilter();
           });
           
            $(".GoogleMapAddress-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateSiteGoogleMapAddressFilter();
            });
            
          $("#GoogleMapAddress-filter").click(function() { return updateSiteGoogleMapAddressFilter(); }); 
          
          $(".GoogleMapAddress-equal[name=is_active],[name=GoogleMapAddress-nbitemsbypage]").change(function() { return updateSiteGoogleMapAddressFilter(); }); 
                 
           $(".GoogleMapAddress-pager").click(function () {                      
                return $.ajax2({ data: getSiteGoogleMapAddressFilterParameters(), 
                                 url:"{url_to('google_maps_ajax',['action'=>'ListPartialRequest'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 errorTarget: ".site-errors",
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 target: "#google-map-actions" 
                });
        });          
       
      
        
      $('#Cancel').click(function(){ return $.ajax2({ url:"{url_to('google_maps_ajax',['action'=>'Settings'])}",
                                                        target: "#tab-dashboard-x-settings" 
                                                     }); 
        });
       
    
    var dates = $( ".GoogleMapAddress-range[id=from], .GoogleMapAddress-range[id=to]" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
</script>