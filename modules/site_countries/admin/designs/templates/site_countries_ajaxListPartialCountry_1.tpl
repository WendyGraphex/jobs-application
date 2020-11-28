{messages}
<h3>{__('Countries')}</h3>
<div>
  {if $user->hasCredential([['superadmin','admin']])}  
  <a href="#" class="btn btn-primary" id="Add" title="{__('Add country')}" >
      <i class="fa fa-plus" style="margin-right:10px;"></i>
      {__('Add country')}</a>   
  {/if}
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
 <div style="float:left">
<button id="filter" class="btn-table btn">{__("Filter")}</button>   
<button id="init" class="btn-table btn">{__("Init")}</button>
   
 </div>
  <div style="float:right">
     
  </div>
 <div style="clear:both"></div>
<table class="tabl-list footable table" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="list-header">
        <th>#</th>       
         <th>{__('Country')}
            
        </th>                   
         <th>{__('State')}
             <div>
             <a href="#" class="order{$formFilter.order.is_active->getValueExist('asc','_active')}" id="asc" name="is_active"><img  src='{url("/icons/sort_asc`$formFilter.order.is_active->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.is_active->getValueExist('desc','_active')}" id="desc" name="is_active"><img  src='{url("/icons/sort_desc`$formFilter.order.is_active->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
        </th>
        <th>{__('Created at')}
            <div>
                <a href="#" class="order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div>
        </th>
        <th>{__('Actions')}</th>
    </tr>
    </thead>
    <tr class="input-list">
        <td></td>                         
           <td></td>
          <td></td>   
        <td>
              {html_options class="equal Select" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=$formFilter.equal.is_active}
        </td>   
        <td></td>   
        <td></td>       
    </tr>
    {foreach $pager as $item}
        <tr class="countries list" id="countrie-{$item->get('id')}">
            <td class="countries-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>            
              <td>
                 <img  src="{url("/flags/`$item->get('code')`.png","picture")}"/>{$item}   
            </td>             
            <td>
                <a href="#" class="ChangeIsActive" id="{$item->get('id')}" name="{$item->get('is_active')}"><img  src="{url('/icons/','picture')}{$item->get('is_active')}.gif"/></a>  
            </td>   
            <td>
                {format_date($item->get('created_at'),['d','q'])}
            </td>
            <td> 
                {if $user->hasCredential([['superadmin','admin']])}
                    <a href="#" title="{__('Languages')}" class="Languages" id="{$item->get('id')}">
                     <i class="fa fa-globe"></i></a>
                {/if}                
            </td>
        </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}
    {__("No countriy")}
{/if}

{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}  
<script type="text/javascript">

        function changeIsActiveState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeIsActive[id="+this+"]";
                if (resp.state=='YES'||resp.state=='NO') 
                {    
                    $(sel+" img").attr({
                        src :"{url('/icons/','picture')}"+resp.state+".gif"                    
                    });
                    $(sel).attr("name",resp.state);
                }
            });  
        }

    function getFilterParameters()
    {
        var params={ filter: {  order : { },
                    search : {  },
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
            url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}" ,          
            target: "#actions"
        });
    }

    function updateSitePager(n)
    {
        page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
        records_by_page=$("[name=nbitemsbypage]").val();
        start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
        $(".count").each(function(id) { $(this).html(start+id) }); // Update index column
        nb_results=parseInt($("#nb_results").html())-n;
        $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
        $("#end_result").html($(".count:last").html());
    }


    {* =====================  P A G E R  A C T I O N S =============================== *}

    $("#init").click(function() {
        $.ajax2({ url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}",            
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

    $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); });


    $(".pager").click(function () {
        return $.ajax2({ data: getFilterParameters(),
            url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),        
            target: "#actions"
        });
    });
    {* =====================  A C T I O N S =============================== *}

    $(".View").click( function () {
        return $.ajax2({ data : { SiteCountry : $(this).attr('id') },           
            url:"{url_to('site_countries_ajax',['action'=>'ViewCountry'])}",         
            target: "#actions"});
    });                  
     
    $(".Delete").click( function () {
        if (!confirm('{__("Country \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;
        return $.ajax2({ data :{ SiteCountry: $(this).attr('id') },
            url :"{url_to('site_countries_ajax',['action'=>'DeleteCountry'])}",           
            success : function(resp) {
                if (resp.action=='DeleteCountry')
                {
                    $("tr#countrie-"+resp.id).remove();
                    if ($('.countries').length==0)
                        return $.ajax2({ url:"{url_to('site_countries_ajax',['action'=>'ListPartialCountry'])}",                           
                            target: "#actions"});
                    updateSitePager(1);
                }
            }
        });
    });


    $(".selection").click(function (){
        $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
    });

    $("#all").click(function () {
        $(".selection").prop("checked",$(this).prop("checked"));
        $(".actions_items").css('opacity',($(this).prop("checked")?'1':'0.5'));
    });
    // {* PAGER - end *}
  

       $("#Add").click( function () {             
            return $.ajax2({                    
                url: "{url_to('site_countries_ajax',['action'=>'AddCountry'])}",               
                target: "#actions"
           });
         });
         
        
           $(".ChangeIsActive").click(function() { 
                        return $.ajax2({ 
                            data : { 
                                        SiteCountry : { 
                                                id: $(this).attr('id') , 
                                                value:$(this).attr('name'), 
                                                token: '{mfForm::getToken('ChangeForm')}' } },                            
                            url: "{url_to('site_countries_ajax',['action'=>'ChangeIsActiveCountry'])}",                          
                            success: function(resp) { 
                                        if (resp.action=='ChangeIsActiveCountry')
                                            changeIsActiveState(resp);
                                     }
                    });
         });
       

  
         $(".Languages").click(function() { 
                        return $.ajax2({ 
                            data : {   SiteCountry :   $(this).attr('id') },
                            url: "{url_to('site_countries_ajax',['action'=>'AddLanguageForCountry'])}",                          
                            target: "#actions"
                    });
         });
            
</script>
