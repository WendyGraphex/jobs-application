
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Projects')}</h3>
              <h3 class="admin-header-small-text">{__('Project management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
                </div> 
            </div>
          </div>
          
          <div class="breadcrumb-title">
            <p>            
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <a href="#" id="Projects"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Projects')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payment requests for project [%s]',$project->get('name'))}                      
            </p>
          </div>         
{alerts}
{if $project->isLoaded()}
    <div class="table-responsive bg-white px-1 py-2">
        <div class="col-md-12">

           <div class="float-left w-50">
                 {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
           </div>
           <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
           <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>

        <table id="PaymentRequests" class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            <th>#</th>                           
                            <th>{__('Ref.')}           

                            </th>
                            <th>{__('Date')}</span>  

                            </th>          
                            <th>{__('Employer')}</span>  
                            </th>                            
                             <th>{__('Amount')}</th>                                   
                             <th>
                                {__('Status')}
                            </th>                                     
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                      <tr>
                        <td></td>                       
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      </tbody>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                  
                                <td>
                                    {$item->get('reference')}
                                </td> 
                                 <td>
                                   {$item->getFormatter()->getDate()->getText()}
                                </td> 
                                <td>
                                    {$item->getEmployerUser()} 
                                </td>                                     
                                  <td>
                                       {$item->getFormatter()->getTotalPriceWithTax()->getAmount()} 
                                   </td>               
                                   <td>
                                        {$item->getStatus()}
                                   </td>                                    
                                   <td> 

                                 </td>                                   
                            </tr>  

                         {/foreach}
                         {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="13">{__('No result')}</td>
                            </tr>
                         {/if}  
                        </tbody>         
                    </table>
    </div>
    <script type="text/javascript">
      var created_at_dates = $( ".Range.CreatedAtDate#created_at_from, .Range.CreatedAtDate#created_at_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "created_at_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    created_at_dates.not( this ).datepicker( "option", option, date );
        } } );
       
     function getFilterParameters()
        {
            var params={    Project : '{$project->get('id')}',
                            filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });
            $(".Range.Date").each(function () {
               // params.filter.range[$(this).attr('name')]= { }
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {                      
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('projects_ajax',['action'=>'ListPartialRequestForProject'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
            return $.ajax2({ data: getFilterParameters(), 
                             url:"{url_to('projects_ajax',['action'=>'ListPartialRequestForProject'])}?page="+$(this).attr('data-page'),                                
                             target: "#actions"
            });
        });
             
        $("#init").click(function() {                   
           return $.ajax2({ data : { Project : '{$project->get('id')}' },
                            url:"{url_to('projects_ajax',['action'=>'ListPartialRequestForProject'])}",                                    
                            target: "#actions"}); 
        }); 
    
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
        });                 
            
        $("#filter").click(function() { return updateFilter(); });                                        
     
        $('#Projects').click(function(){                                       
          return $.ajax2({   url: "{url_to('projects_ajax',['action'=>'ListPartialProject'])}",                           
                           target: "#actions"}); 
        }); 
        
        
</script>

{else}
    {__('Project is invalid.')}
{/if}    