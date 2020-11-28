{messages class="site-smsbox-callback-errors"}
<h3>{__("SMS box")}</h3>
<div>    
    <a href="#" id="Settings" class="btn"><img  src="{url('/icons/settings16x16.png','picture')}" alt="{__('settings')}"/>{__('Settings')}</a>
</div>

{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="SmsBoxCallback"}
<button id="SmsBoxCallback-filter" class="btn-table">{__("Filter")}</button> 
<button id="SmsBoxCallback-init" class="btn-table">{__("Init")}</button>
<div class="containerDivResp">
<table cellpadding="0" cellspacing="0" class="tabl-list footable table">  
    <thead> 
    <tr  class="list-header">     
        <th data-hide="phone" style="display: table-cell;">#</th>      
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Server')}</span>               
        </th>     
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Reference')}</span>               
        </th>     
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Tel')}</span>               
        </th>     
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Numero message')}</span>               
        </th>     
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Error CallBack')}</span>               
        </th>     
        <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
    </tr>
    </thead>
    {* search/equal/range *}
    <tr class="input-list">
       <td>{* # *}</td>   
       <td>{* server *}</td>     
       <td>{* reference *}</td>     
       <td>{* num_tel *}</td>     
       <td>{* num_message *}</td>     
       <td>{* error_callback *}</td>     
       <td>{* actions *}</td>
    </tr>
    {foreach $pager as $item}
    <tr class="SmsBoxCallback list" id="SmsBoxCallback-{$item->get('id')}"> 
        <td class="SmsBoxCallback-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>          
        <td> 
            <span>{$item->get('server')}</span>
        </td>    
        <td>
            <span>{$item->get('reference')}</span>
        </td>
        <td>
            <span>{$item->get('num_tel')}</span>
        </td>
        <td>
            <span>{$item->get('num_message')}</span>
        </td>
        <td>
            <span>{$item->get('error_callback')}</span>
        </td>
        <td>               
            <a href="#" title="{__('Edit')}" class="SmsBoxCallback-View" id="{$item->get('id')}">
                <img  src="{url('/icons/edit.gif','picture')}" alt='{__("Edit")}'/></a>                                      
            <a href="#" title="{__('Delete')}" class="SmsBoxCallback-Delete" id="{$item->get('id')}"  name="{$item->get('reference')}">
                <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/></a>               
        </td>
    </tr>    
    {/foreach}  
</table> 
</div>
{if !$pager->getNbItems()}
    <span>{__('No smsbox callback')}</span>
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="SmsBoxCallback-all" /> 
        <a style="opacity:0.5" class="SmsBoxCallback-actions_items" href="#" title="{__('delete')}" id="SmsBoxCallback-Delete">
            <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
        </a>         
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="SmsBoxCallback"} 

<script type="text/javascript">
    
    function getSiteSmsBoxCallbackFilterParameters()
    {
        var params={ filter: {  order : { }, 
                                search : { },
                                equal: { },                                                                                                                                    
                            nbitemsbypage: $("[name=SmsBoxCallback-nbitemsbypage]").val(),
                            token:'{$formFilter->getCSRFToken()}'
                    } };
        if ($(".SmsBoxCallback-order_active").attr("name"))
            params.filter.order[$(".SmsBoxCallback-order_active").attr("name")] = $(".SmsBoxCallback-order_active").attr("id");   
        $(".SmsBoxCallback-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
        return params;                  
    }

    function updateSmsBoxCallbackFilter()
    {          
        return $.ajax2({ data: getSiteSmsBoxCallbackFilterParameters(), 
                        url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}" , 
                        errorTarget: ".site-smsbox-callback-errors",
                        loading: "#tab-site-dashboard-x-settings-loading",
                        target: "#actions"
                    });
    }

    function updatePager(n)
    {
        page_active=$(".SmsBoxCallback-pager .SmsBoxCallback-active").html()?parseInt($(".SmsBoxCallback-pager .SmsBoxCallback-active").html()):1;
        records_by_page=$("[name=SmsBoxCallback-nbitemsbypage]").val();
        start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
        $(".SmsBoxCallback-count").each(function(id) { $(this).html(start+id) }); // Update index column           
        nb_results=parseInt($("#SmsBoxCallback-nb_results").html())-n;
        $("#SmsBoxCallback-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
        $("#SmsBoxCallback-end_result").html($(".SmsBoxCallback-count:last").html());
    }


    {* =====================  P A G E R  A C T I O N S =============================== *}  

    $("#SmsBoxCallback-init").click(function() {               
        $.ajax2({ url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                  errorTarget: ".site-smsbox-callback-errors",
                  loading: "#tab-site-dashboard-x-settings-loading",                         
                  target: "#actions"}); 
    }); 

    $('.SmsBoxCallback-order').click(function() {
        $(".SmsBoxCallback-order_active").attr('class','SmsBoxCallback-order');
        $(this).attr('class','SmsBoxCallback-order_active');
        return updateSmsBoxCallbackFilter();
    });

    $(".SmsBoxCallback-search").keypress(function(event) {
        if (event.keyCode==13)
            return updateSmsBoxCallbackFilter();
    });

    $("#SmsBoxCallback-filter").click(function() { return updateSmsBoxCallbackFilter(); }); 

    $(".SmsBoxCallback-equal[name=is_active],[name=SmsBoxCallback-nbitemsbypage]").change(function() { return updateSmsBoxCallbackFilter(); }); 

    // $("[name=SmsBoxCallback-name]").change(function() { return updateSmsBoxCallbackFilter(); }); 

    $(".SmsBoxCallback-pager").click(function () {                      
        return $.ajax2({ data: getSiteSmsBoxCallbackFilterParameters(), 
                        url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                        errorTarget: ".site-smsbox-callback-errors",
                        loading: "#tab-site-dashboard-x-settings-loading",
                        target: "#actions"
        });
    });  

    {* =================== A C T I O N S ================================ *}
    
    $(".SmsBoxCallback-Delete").click( function () { 
        if (!confirm('{__("Format \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
        return $.ajax2({ data :{ CustomerMeetingFormat: $(this).attr('id') },
                        url :"{url_to('services_smsbox_callback_ajax',['action'=>'DeleteSmsBoxCallback'])}",
                        errorTarget: ".site-smsbox-callback-errors",     
                        loading: "#tab-site-dashboard-x-settings-loading",
                        success : function(resp) {
                            if (resp.action=='DeleteFormat')
                            {    
                                $("#SmsBoxCallback-"+resp.id).remove();  
                                if ($('.SmsBoxCallback.list').length==0)
                                    return $.ajax2({ url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                                                    errorTarget: ".site-smsbox-callback-errors",
                                                    target: "#actions"});
                                updateSitePager(1);
                            }       
                        }
        });                                        
    });

    $('#Settings').click(function(){                  
        return $.ajax2({ 
                        url: "{url_to('services_smsbox_callback_ajax',['action'=>'Settings'])}",
                        errorTarget: ".site-smsbox-callback-errors",
                        target: "#actions"}); 
    });
    
</script>
