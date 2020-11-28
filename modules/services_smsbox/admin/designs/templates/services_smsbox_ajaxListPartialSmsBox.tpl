<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Communication')}</h3>
        <h3 class="admin-header-small-text">{__('SMS')}</h3>
    </div>
</div>       
<!-- End page heading -->
          
<!-- Begin breadcrumb -->
<div class="breadcrumb-title">
    <p>              
        <i class="fa fa-home" style="color: #37bc9b;"></i>               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Communication')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('SMS')}
    </p>
</div>
<!-- End breadcrumb -->

<!-- Begin Add User -->
{messages}

<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="Email"}
        </div>
        <button id="Email-filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
        <button id="Email-init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
    </div>
              <table  class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0">
                <thead>
                     <tr class="bgSpec">
                        <th>#
                           {* <a href="javascript:void(0);" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('Asc')}"/></a>
                            <a href="javascript:void(0);" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('Desc')}"/></a>*}
                        </th>
                         <th>{__('Ref')}

                         </th>
                         <th>{__('Date')}
                             <a href="javascript:void(0);" class="order{$formFilter.order.sent_at->getValueExist('asc','_active')}" id="asc" name="sent_at"><img  src='{url("/icons/sort_asc`$formFilter.order.sent_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('Asc')}"/></a>
                             <a href="javascript:void(0);" class="order{$formFilter.order.sent_at->getValueExist('desc','_active')}" id="desc" name="sent_at"><img  src='{url("/icons/sort_desc`$formFilter.order.sent_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('Desc')}"/></a>
                         </th>
                         <th>{__('Mobile')}

                         </th>
                         <th>{__('Message')}

                         </th>
                          <th>{__('Erreur')}

                         </th>
                         <th>{__('Erreur retour')}

                         </th>
                          {*<th>{__('Actions')}</th>*}
                     </tr>
                </thead>
                <tr>
                    <td>

                    </td>

                    <td>
                        <input type="text" autocomplete="off" class="search Input form-control InputStyle3" name="reference" style="width : 200px;height : 35px" value="{$formFilter.search.reference}"/>

                    </td>
                    <td>
                        <div  style="margin-left: 10px;display: flex;">
                            <input type="text" name="from"  autocomplete="off" placeholder="From" class="form-control Input search  from InputStyle3 Date"  value="{$formFilter->getSearchDate('from')}" size="8" style="width: 50%;margin-right: 10px;"/>
                            <input type="text" name="to"  autocomplete="off" placeholder="To" class="form-control Input search to InputStyle3 Date" value="{$formFilter->getSearchDate('to')}" size="8" style="width: 50%;"/>
                        </div>
                    </td>
                    <td>
                        <input type="text" autocomplete="off" class="search Input form-control InputStyle3" name="mobile" style="width : 200px;height : 35px" value="{$formFilter.search.mobile}"/>

                    </td>
                    <td>
                        <input type="text" autocomplete="off" class="search Input form-control InputStyle3" name="message" style="width : 200px;height : 35px" value="{$formFilter.search.message}"/>

                    </td>
                    <td>
                        <input type="text" autocomplete="off" class="search Input form-control InputStyle3" name="error_api" style="width : 200px;height : 35px" value="{$formFilter.search.error_api}"/>

                   </td>
                     <td>   
                         {html_options class="equal form-control Select" name="error_callback" options=$formFilter->equal.error_callback->getChoices()->toArray() selected=$formFilter.equal.error_callback}
               
                    </td>
                </tr>
                  {foreach $pager as $item}
                  <tr class="Employer list" id="Employer-{$item->get('id')}">
                       <td class="Employer-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                      <td>
                          {$item->get('reference')}
                      </td>
                      <td>
                          {$item->getSentAt()->getText()}
                      </td>
                      <td>
                          {$item->get('mobile')}
                      </td>
                      <td>
                          {$item->get('message')}
                      </td>
                        <td>
                          {$item->get('error_api')}
                      </td>
                      <td>
                          {$item->getCallbackError()}
                      </td>
                  </tr>
                  {/foreach}
            </table>
          </div>
            {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>
{if !$pager->hasItems()}
     {__("Aucun résultat")}
{/if}
 <script type="text/javascript">
     $(".Date").datepicker();
     $('.Date').datepicker('option', 'maxDate',0);

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
            $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            return params;
        }

        function updateFilter()
        {
           return $.ajax2({ data: getFilterParameters(),
                            url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialSmsBox'])}" ,
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
               $.ajax2({ url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialSmsBox'])}",
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

          $("[name=nbitemsbypage],[name=error_callback]").change(function() { return updateFilter(); });


          $(".pager").click(function () {
                return $.ajax2({ data: getFilterParameters(),
                                 url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialSmsBox'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 target: "#actions"
                });
          });
          
          
     $('#send').click(function () {
         //   if (!confirm("{__("Un SMS va etre envoyer . Confirmez vous ?")}".format($(this).data('name')))) return false;
         var  params= { SmsTest: {  token :'{mfForm::getToken('SendSmsForm')}' } };
         $(".Fields.Input.Sms").each(function() { params.SmsTest[this.name]=$(this).val(); });
         return $.ajax2({
             data : params,
             url :"{url_to('services_smsbox_ajax',['action'=>'SendSms'])}",
             success : function(resp) {
                 if (resp.action!='SendSms') return ;
                   // $('#info').val(resp);

             }
         });


     });
     
     
 </script>

