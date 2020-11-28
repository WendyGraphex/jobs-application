<div class="row admin-header-container">
  <div class="col-sm">
     <h3 class="admin-header-big-text">{__('Events')}</h3>    
     <h3 class="admin-header-small-text">{__('Connections')}</h3>
   </div>
   <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                   
                 {* <a class="btn btn-danger admin-header-button btn-color"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Employer Connections')}</a>*}
                 {* <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>*}
                </div> 
            </div>
  </div> 
      <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Events')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Accounts')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Connections')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class="bg-white px-2 py-2">
         <div class="col-md-12 padd-col">
                
               <div class="float-left w-50">
                     {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
               </div>
               <div class="float-right w-50"> 
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
               </div>
         </div>

    <table class="table table-bordered table-hover table-striped">  
    <thead class="bgGlobal">
    <tr class="list-header">    
    <th>#</th>
    <th>{__('ID')}           
        <div style="float: right;">
            <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
            <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
        </div>
    </th>
        <th>
            <span>{__('User')}</span>  
                         
        </th>         
        <th>
            <span>{__('IP')}</span>  
            <div style="float: right;">
               <a href="#" class="position-absolute order{$formFilter.order.ip->getValueExist('asc','_active')}" id="asc" name="ip"><i class="fas fa-sort-up {if $formFilter.order.ip->getValue()=='asc'}text-dark{/if}"></i></a>
               <a href="#" class="position-absolute order{$formFilter.order.ip->getValueExist('desc','_active')}" id="desc" name="ip"><i class="fas fa-sort-down {if $formFilter.order.ip->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>  
        </th>
        <th style="width: 230px;">
            <span>{__('Start')}</span>  
            <div style="float: right;">
               <a href="#" class="position-absolute order{$formFilter.order.started_at->getValueExist('asc','_active')}" id="asc" name="started_at"><i class="fas fa-sort-up {if $formFilter.order.started_at->getValue()=='asc'}text-dark{/if}"></i></a>
               <a href="#" class="position-absolute order{$formFilter.order.started_at->getValueExist('desc','_active')}" id="desc" name="started_at"><i class="fas fa-sort-down {if $formFilter.order.started_at->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>   
        </th>
         <th style="width: 230px;">
             <span>{__('Stop')}</span>  
            <div style="float: right;">
               <a href="#" class="position-absolute order{$formFilter.order.ended_at->getValueExist('asc','_active')}" id="asc" name="ended_at"><i class="fas fa-sort-up {if $formFilter.order.ended_at->getValue()=='asc'}text-dark{/if}"></i></a>
               <a href="#" class="position-absolute order{$formFilter.order.ended_at->getValueExist('desc','_active')}" id="desc" name="ended_at"><i class="fas fa-sort-down {if $formFilter.order.ended_at->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>   
        </th>     
    </tr> 
</thead>
<tbody>
    {* search/equal/range *}
     <tr class="input-list">      
       <td></td> 
       <td></td>
       <td>   
             <input placeholder="{__('User')}" class="form-control form-control-sm ml-1 search" name="email" value="{$formFilter.search.email}">
       </td>    
        <td>
             <input placeholder="{__('Ip')}" class="form-control form-control-sm ml-1 search" name="ip" value="{$formFilter.search.ip}">
        </td> 
                    
          <td>
              <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date startedAtDate" id="started_at_from" date-id="from" placeholder="{__('From')}" name="started_at" value="{if $formFilter->hasErrors()}{$formFilter.range.started_at.from}{else}{format_date($formFilter.range.started_at.from,'a')}{/if}" >
             <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date startedAtDate" id="started_at_to" date-id="to" placeholder="{__('To')}" name="started_at" value="{if $formFilter->hasErrors()}{$formFilter.range.started_at.to}{else}{format_date($formFilter.range.started_at.to,'a')}{/if}" >
          
          </td>              
      <td>
         <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date endedAtDate" id="ended_at_from" date-id="from" placeholder="{__('From')}" name="ended_at" value="{if $formFilter->hasErrors()}{$formFilter.range.ended_at.from}{else}{format_date($formFilter.range.ended_at.from,'a')}{/if}" >
             <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date endedAtDate" id="ended_at_to" date-id="to" placeholder="{__('To')}" name="ended_at" value="{if $formFilter->hasErrors()}{$formFilter.range.ended_at.to}{else}{format_date($formFilter.range.ended_at.to,'a')}{/if}" >       
      </td>    
    </tr>   
    {foreach $pager as $item}
    <tr class="list" id="item-{$item->get('id')}"> 
            <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>   
            <td>{$item->get('id')}
            </td>               
            <td>
                {$item->getUser()->get('firstname')} {$item->getUser()->get('lastname')}               
            </td>  
            <td>{$item->get('ip')}
            </td>                
            <td>
                 {$item->getStartedAt()->getText()}
            </td>
            <td>
                {$item->getEndedAt()->getText()}
            </td>           
    </tr>    
    {/foreach}
    
    
      {if !$pager->getNbItems()}
        
         <tr role="row" >
          <td  colspan="5"><span>{__('No user')}</span></td>
         </tr>
        
      {else}
         {if $pager->getNbItems()>5}
           
          <tr role="row" >
            <td  colspan="5">
               <input type="checkbox" id="all" /> 
               <a style="opacity:0.5" class="actions-items" href="#" title="{__('delete')}" id="Delete">
                   <i class="fa fa-trash-alt icon-font" style="color: rgb(189, 33, 48);"></i>
               </a> 
            </td>
          </tr> 
         
         {/if}
     {/if}
</tbody>
</table>   


{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}

</div>

<script type="text/javascript">
    var started_at_dates = $( ".Range.startedAtDate#started_at_from, .Range.startedAtDate#started_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "started_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				started_at_dates.not( this ).datepicker( "option", option, date );
    } } );  
  var ended_at_dates = $( ".Range.endedAtDate#ended_at_from, .Range.endedAtDate#ended_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "ended_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				ended_at_dates.not( this ).datepicker( "option", option, date );
    } } );   
    
     function getFilterParameters()
        {
            var params={    
                            filter: {  order : { }, 
                                    search : { },
                                    equal: { },     
                                    range : { },
                                    nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                    token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".Range.Date").each(function () {             
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employers_ajax',['action'=>'ListPartialSession'])}" ,                                              
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
        
        
        
        $(".Delete").click( function () { 
                if (!confirm('{__("Session \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerSession: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteSession'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteSession') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                           updatePager(1);
                                 }
                     });                                        
            });             

    
        $(".View").click( function () {                    
                   return $.ajax2({ data : { EmployerSession : { gallery_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewSession'])}", 
                                  target: "#actions"});
          });                
    
      $("#New").click( function () {             
                return $.ajax2({      
                    data : { lang : { lang: $("#SelectListLanguages option:selected").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                    url: "{url_to('employers_ajax',['action'=>'NewSession'])}",               
                    target: "#actions"
              });
            });
                    
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                  
               $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialSession'])}",                                              
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
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialSession'])}?page="+$(this).attr('data-page'),   
                                 target: "#actions"
                });
        });

</script>