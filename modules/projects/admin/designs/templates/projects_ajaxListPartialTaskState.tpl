<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Project Manager')}</h3>
        <h3 class="admin-header-small-text">{__('Task states')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            {*<a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Employee')}</a>*}
            <a href="#" class="btn btn-success admin-header-button" id="New"><i class="fa fa-plus"></i> {__('New state')}</a> 
            <a href="#" class="btn btn-danger admin-header-button" id="Cancel"><i class="fa fa-times"></i> {__('Cancel')}</a>   
        </div> 
    </div>
</div>
<div class="breadcrumb-title">
    <p>              
        <i class="fa fa-home" style="color: #37bc9b;"></i>               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Project Manager')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Task states')}
    </p>
</div>
{alerts}


<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
        </div>
        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
        <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
    </div>
    <table id="tableEmployee" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
            <tr class="list-header">  
                <th>#</th>
                    {*  {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if} *}
                    {*   <th data-hide="phone" style="display: table-cell;">
                    <span>{__('id')}</span>
                    <div>
                    <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                    <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                    </div> 
                    </th>  *}     
                <th class="footable-first-column" data-toggle="true">
                    <span>{__('Name')}</span>    
                    <div style="float: right;">
                        <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                        <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                    </div> 
                </th>
                <th data-hide="phone" style="display: table-cell;">
                    <span>{__('Color')}</span>               
                </th>
                <th data-hide="phone" style="display: table-cell;">
                    <span>{__('icon')}</span>  
                </th>
                <th data-hide="phone" style="display: table-cell;">
                    <span>{__('Value')}</span>      
                    <div style="float: right;">
                        <a href="#" class="order{$formFilter.order.value->getValueExist('asc','_active')}" id="asc" name="value"><img  src='{url("/icons/sort_asc`$formFilter.order.value->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                        <a href="#" class="order{$formFilter.order.value->getValueExist('desc','_active')}" id="desc" name="value"><img  src='{url("/icons/sort_desc`$formFilter.order.value->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                    </div>
                </th>         
                <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
            </tr>
        </thead> 
        {* search/equal/range *}
        <tr class="input-list">
            <td>{* # *}</td>
            {*  {if $pager->getNbItems()>5}<td></td>{/if} *}
            {*  <td>{* id *} {* </td> *}
            <td>{* name *}</td>
            <td>{* color *}</td>
            <td>{* icon *}</td>
            <td>{* value *}</td>      
            <td>{* actions *}</td>
        </tr>   
        {foreach $pager as $item}
            <tr class="State list" {if $item->hasI18n()}id="{$item->getI18n()->get('id')}"{/if}> 
                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                {*  {if $pager->getNbItems()>5}
                <td>        
                {if $item->hasStateI18n()}
                <input class="selection" type="checkbox" id="{$item->getStateI18n()->get('id')}" name="{$item->getStateI18n()->get('name')}"/>   
                {/if}
                </td>
                {/if} 
                <td><span>{$item->getState()->get('id')|escape|truncate}</span></td>*}
                <td>                
                    {$item->get('name')}
                </td>
                <td> 
                    {if $item->get('color')}
                        <div style="background:{$item->get('color')}; display:block; height:15px; width: 15px;">&nbsp;</div>
                    {/if}
                </td>
                <td>{* icon *}
                    {if $item->get('icon')} 
                        <img src="{$item->getIcon()->getURL()}" height="32" width="32" alt="{__('icon')}"/>
                    {/if}    
                </td>
                <td>
                    {if $item->hasI18n()}
                        {$item->getI18n()->get('value')}
                    {else}
                        {__('----')}
                    {/if}    
                </td>            
                <td>               
                    <a href="#" title="{__('edit')}" class="View" id="{$item->get('id')}">
                        <i class="fa fa-edit"></i></a> 
                    {if $item->hasI18n()}<a href="#" title="{__('delete')}" class="Delete" id="{$item->getI18n()->get('id')}"  name="{$item->getI18n()->get('value')}">
                            <i class="fa fa-remove"></i>
                        </a>
                    {/if}
                </td>
            </tr>    
        {/foreach}    
    </table> 
    {if !$pager->getNbItems()}
        <span>{__('No state')}</span>
    {else}
        {*  {if $pager->getNbItems()>5}
        <input type="checkbox" id="all" /> 
        <a style="opacity:0.5" class="actions_items" href="#" title="{__('delete')}" id="Delete">
        <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
        </a>         
        {/if} *}
    {/if}    
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>

<script type="text/javascript">
 
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { 
                                         name : $("[name=name] option:selected").val()  
                                    },
                                lang: $("img.State").attr('id'),                                                                                                               
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
                            url:"{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}" ,                                                      
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
        
           {* ===================== L A N G U A G E =============================== *}
         
            $("#ChangeLang").click(function() {      
                   $("#dialogListLanguages").dialog("open");
            });
            
            $("#dialogListLanguages").bind('select',function(event){                
                $(".State[name=lang]").attr({                           
                                      id: event.selected.id,
                                      src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                      title: event.selected.lang
                                      });
               $("#StateChangeLang").show();
               updateFilter();
            });   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ url:"{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}",                                    
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
          
          $("[name=nbitemsbypage]").change(function() { return updateFilter(); }); 
          
         // $("[name=name]").change(function() { return updateFilter(); }); 
           
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
       $("#Cancel").click( function () {             
            return $.ajax2({             
                url: "{url_to('projects_ajax',['action'=>'PartialSettings'])}",              
                target: "#actions"
           });
         });
         
          $("#New").click( function () {             
            return $.ajax2({
                data : { lang : { lang: $("img.State[name=lang]").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                url: "{url_to('projects_ajax',['action'=>'NewTaskStateI18n'])}",              
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                
                return $.ajax2({ data : { ProjectTaskStateI18n : { 
                                                state_id: $(this).attr('id'),
                                                lang: $("img.State[name=lang]").attr('id')                                              
                                    } },                                
                                url:"{url_to('projects_ajax',['action'=>'ViewTaskStateI18n'])}",                              
                                target: "#actions"});
         });
                    
         
          $(".Delete").click( function () { 
                if (!confirm('{__("State \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ ProjectTaskStateI18n: $(this).attr('id') },
                                 url :"{url_to('projects_ajax',['action'=>'DeleteTaskStateI18n'])}",                                
                                 success : function(resp) {
                                       if (resp.action=='DeleteTaskStateI18n')
                                       {    
                                          $("tr#"+resp.id).remove();  
                                          if ($('.State').length==0)
                                              return $.ajax2({ url:"{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}",                                                             
                                                               target: "#actions"});
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
            });
            

         
	
</script>    