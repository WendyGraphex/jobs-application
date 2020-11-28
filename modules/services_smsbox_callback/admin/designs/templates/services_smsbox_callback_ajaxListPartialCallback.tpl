{messages}
<div class="content-header row">
  <div class="content-header-left col-md-6 col-12 mb-2">
      <h3 class="content-header-title mb-0">{__('Retours Sms Box')}</h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
      <div class="media width-250 float-right">
        <div class="media-left media-middle">
          <div id="sp-bar-total-sales"></div>
        </div>
        <div class="media-body media-right text-right">
       
        {*  <a href="#" class="btn btn-primary float-right" id="Import" title="{__('Import retour')}" >
              <i class="fa fa-upload"></i>
              {__('Import retours')}</a>            *}
        </div>
      </div>
    </div>
</div>
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
          <div class="content-header-right pull-right col-md-12" style="margin-top: -60px">

          </div>
        <div class="heading-elements">
            <ul class="list-inline mb-0">

                <li><a><i class="fa fa-search" id="filter"></i></a></li>
                <li><a><i class="fa fa-sync" id="init"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="card-content collapse show">
        <div class="card-body">
          <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped">
                <thead>
                     <tr class="list-header">
                        <th style="width:50px">#
                            <a href="javascript:void(0);" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('Asc')}"/></a>
                            <a href="javascript:void(0);" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('Desc')}"/></a>
                        </th>
                         <th>{__('Ref')}

                         </th>
                        
                         <th>{__('Mobile')}

                         </th>
                         <th>{__('Accusé')}

                         </th>                       
                         <th>{__('Date')}
                            
                         </th>
                     </tr>
                </thead>
                <tr>
                    <td>
                        {include file="./_pagers/default/_default_pager_top_Purchase.tpl" pager=$pager formfilter=$formFilter}
                    </td>

                    <td>
                        
                    </td>
                    <td>
                      

                    </td>
                    <td>
                       
                    </td>
                    <td>
                        
                    </td>                  
                </tr>
                  {foreach $pager as $item}
                  <tr class="Employer list" id="Employer-{$item->get('id')}">
                       <td class="Employer-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                      <td>
                          {$item->get('reference')}
                      </td>
                      <td>
                          {$item->get('mobile')} 
                      </td>                     
                      <td>
                          {$item->getAccuse()}
                      </td>
                       <td>
                          {$item->getTs()->getText()}
                      </td>
                  </tr>
                  {/foreach}
            </table>
          </div>
            {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}

        </div>
      </div>
    </div>
  </div>
</div>
{if !$pager->hasItems()}
     {__("Aucun résultat")}
{/if}
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
                            url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}" ,
                            target: "#actions"
                             });
        }

        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('Résultats')}":"{__('Un résultat')}"));
           $("#end_result").html($(".count:last").html());
        }


          {* =====================  P A G E R  A C T I O N S =============================== *}

          $("#init").click(function() {
               $.ajax2({ url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                         target: "#actions"});
          });

          $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
          });

          $(".search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateFilter();
          });

          $("#filter").click(function() { return updateFilter(); });

          $("[name=nbitemsbypage],[name=is_active]").change(function() { return updateFilter(); });


          $(".pager").click(function () {
                return $.ajax2({ data: getFilterParameters(),
                                 url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 target: "#actions"
                });
          });
      


       $("#Import").click(function () { 
            return $.ajax2({   url :"{url_to('services_smsbox_callback_ajax',['action'=>'ImportCallback'])}",                               
                               target: "#actions"    
                     }); 
        });
        
 </script>


