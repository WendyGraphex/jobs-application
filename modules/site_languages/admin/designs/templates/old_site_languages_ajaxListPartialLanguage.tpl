{messages}
<h3>{__('Languages')}</h3>
<div>
  {if $user->hasCredential([['superadmin','admin']])}  
  <a href="#" class="btn btn-primary" id="Add" title="{__('Add language')}" >
      <i class="fa fa-plus" style="margin-right:10px;"></i>
      {__('Add language')}</a>   
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
         <th>{__('Language')}
            
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
        <td>
              {html_options class="equal Select" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=$formFilter.equal.is_active}
        </td>   
        <td></td>   
        <td></td>       
    </tr>
    {foreach $pager as $item}
        <tr class="language list" id="{$item->get('id')}">
            <td class="language-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
           
              <td>
                  <img  src="{url("/flags/`$item->get('code')`.png","picture")}"/>{$item->getCode()->getFormatted()->ucfirst()}   
            </td>             
            <td>
                <a href="#" class="ChangeIsActive" id="{$item->get('id')}" name="{$item->get('is_active')}"><img  src="{url('/icons/','picture')}{$item->get('is_active')}.gif"/></a>  
            </td>   
            <td>
                {format_date($item->get('created_at'),['d','q'])}
            </td>
            <td> {if $user->hasCredential([['superadmin','admin']])}
                    <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                     <i class="fa fa-edit"></i></a>
                {/if}                              
                {if $user->hasCredential([['superadmin','admin']])}
                    <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}" name="{format_language($item->get('code'))}">
                     <i class="fa fa-remove"></i></a>
                {/if}
            </td>
        </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}
    {__("No language")}
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
            url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}" ,          
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
        $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
        $("#end_result").html($(".count:last").html());
    }


    {* =====================  P A G E R  A C T I O N S =============================== *}

    $("#init").click(function() {
        $.ajax2({ url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}",            
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
            url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),        
            target: "#actions"
        });
    });
    {* =====================  A C T I O N S =============================== *}

    $(".View").click( function () {
        return $.ajax2({ data : { Language : $(this).attr('id') },           
            url:"{url_to('languages_ajax',['action'=>'ViewLanguage'])}",         
            target: "#actions"});
    });                  
     
    $(".Delete").click( function () {
        if (!confirm('{__("Languages \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;
        return $.ajax2({ data :{ SiteLanguage: $(this).attr('id') },
            url :"{url_to('languages_ajax',['action'=>'DeleteLanguage'])}",           
            success : function(resp) {
                if (resp.action=='DeleteLanguage')
                {
                    $(".list[id="+resp.id+"]").remove();
                    if ($('.list').length==0) return updateFilter();
                    updatePager(1);
                }
            }
        });
    });


       $("#Add").click( function () {             
            return $.ajax2({                    
                url: "{url_to('languages_ajax',['action'=>'AddLanguage'])}",               
                target: "#actions"
           });
         });
         
        
           $(".ChangeIsActive").click(function() { 
                        return $.ajax2({ 
                            data : { 
                                        SiteLanguage : { 
                                                id: $(this).attr('id') , 
                                                value:$(this).attr('name'), 
                                                token: '{mfForm::getToken('ChangeForm')}' } },                            
                            url: "{url_to('languages_ajax',['action'=>'ChangeIsActiveLanguage'])}",                          
                            success: function(resp) { 
                                        if (resp.action!='ChangeIsActiveLanguage') return ;
                                        changeIsActiveState(resp);
                                     }
                    });
         });
            
</script>
