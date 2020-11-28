


<div class="row admin-header-container">
  <div class="col-sm">
       <h3 class="admin-header-big-text">{__('Sale')}</h3>
       <h3 class="admin-header-small-text">{__('Sale Taxes')}</h3>
    </div>
  
  <div class="col-sm" style="padding: 0;">
       <div style="float: right;">

              <a href="#" id="New" class="btn btn-success admin-header-button btn-color" title="{__('New tax')}" ><i class="fa fa-plus" style=""></i>{*<img  src="{url('/icons/new.gif','picture')}" alt="{__('new')}"/>*}{__('New tax')}</a>   
       </div>   
  </div>
</div>
               <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <a href="/admin">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Taxes')}
            </p>
          </div>
          <!-- End breadcrumb -->
 {*messages class="site-errors"*}
 
 {alerts}
 
 <div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">      
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
        </div>
        <div class="float-right w-50"> 
            <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
            <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>
    </div>
                  
            <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0">
                <thead class="bgSpec">
                <tr class="list-header">    
                <th>#</th>
                   <th>&nbsp;</th> 
                    <th>
                        <span class="mr-1">{__('id')}</span>             
                        <div style="float: right;">
                            <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up acs-desc"></i></a>
                            <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down"></i></a>         
                        </div>
                     </th>    
                    <th class="footable-first-column" data-toggle="true">
                        <span class="mr-1">{__('Rate')}</span> 
                        <div style="float: right;">                              
                            <a href="#" class="order{$formFilter.order.rate->getValueExist('asc','_active')}" id="asc" name="rate"><i class="fas fa-sort-up acs-desc"></i></a>
                            <a href="#" class="order{$formFilter.order.rate->getValueExist('desc','_active')}" id="desc" name="rate"><i class="fas fa-sort-down"></i></a>            
                        </div>
                    </th>
                     <th data-hide="phone" style="display: table-cell;">
                        <span>{__('Description')}</span>               
                    </th>        
                    <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
                </tr> 
            </thead>
            <tbody>
                {* search/equal/range *}
                 <tr class="input-list">
                    <td></td>
                    <td></td> 
                    <td></td> 
                    <td> 
                        <input  class="form-control form-control-sm ml-1 search" name="rate" value="{$formFilter.search.rate}" placeholder="{__('Rate')}"/>
                    </td>         
                    <td>{* rate *}</td> 
                    <td>{* actions *}</td>
                </tr>
                    {foreach $pager as $item}
                <tr class="SaleTax list" id="{$item->get('id')}"> 
                    <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                      
                        <td>                           
                            <input class="selection" type="checkbox" id="{$item->get('id')}" name="{$item->get('description')}"/>                      
                        </td>                      
                        <td><span>{$item->get('id')}</span></td> 
                      <td> 
                {$item->getRate()->getPourcentage()}
            </td>
            <td>                
                    {$item->get('description')}
            </td>            
                        <td>               
                            <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                                <i class="fa fa-pencil-alt icon-font"></i></a>                 
                            <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}"  name="{$item->getRate()->getPourcentage()}">
                               <i class="fa fa-trash-alt icon-font delete-color"></i>
                            </a>               
                        </td>
                </tr>    
                {/foreach}  

             {if !$pager->getNbItems()}
                  <tr role="row" >
                      <td  colspan="4"><span>{__('No tax')}</span></td>
                  </tr>       
            {else}
              {*  {if $pager->getNbItems()>5}
                    <input type="checkbox" id="all" /> 
                      <a style="opacity:0.5" class="actions_items" href="#" title="{__('delete')}" id="Delete">
                          <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
                      </a>         
                {/if} *}
            {/if}
            </tbody>
            </table>  
        
      {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
    
   </div>
</div> 
   
<script type="text/javascript">
    
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { 
                                         name : $("[name=name] option:selected").val()  
                                    },                                                                                                                                      
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
                            url:"{url_to('sales_ajax',['action'=>'ListPartialTax'])}" ,                          
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
                   
            
        
     
           $("#init").click(function() {                
               $.ajax2({ url:"{url_to('sales_ajax',['action'=>'ListPartialTax'])}",                                 
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
          
         
           $(".pager").click(function () {                    
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_ajax',['action'=>'ListPartialTax'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                           
                                 target: "#actions"
                });
        });
        
      
          $("#New").click( function () {            
            return $.ajax2({                    
                url: "{url_to('sales_ajax',['action'=>'NewTax'])}",               
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                    
                return $.ajax2({ data : { SaleTax : $(this).attr('id') },                             
                                url:"{url_to('sales_ajax',['action'=>'ViewTax'])}",                                
                                target: "#actions"});
         });
         
   
           $(".Delete").click( function () { 
                if (!confirm("{__("Tax [#0#] will be deleted. Confirm ?")}".format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SaleTax: $(this).attr('id') },
                                 url : "{url_to('sales_ajax',['action'=>'DeleteTax'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteTax') return ;                                       
                                        $(".list[id="+resp.id+"]").remove();  
                                        if ($('.list').length==0)
                                            return updateFilter();
                                        updatePager(1);                                     
                                 }
                     });                                        
            });  
              

 </script>    