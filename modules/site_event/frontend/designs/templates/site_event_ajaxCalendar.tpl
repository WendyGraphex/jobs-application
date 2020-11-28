{alerts}
{if $formFilter->isProcessed()}
<div style="margin: 25px;">
               <div class="global-class-drop dropdown budget-drop">
                            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Price')}
                                <span class="caret"></span></button>
                            <ul class="myDropDownDrop dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
                
                <div id="slider-range"></div>   <br>                               
                <input type="number" value="{$formFilter.range.price.min}" min="{$formFilter->range['price']->getOption('min')}" max="{$formFilter->range['price']->getOption('max')}" oninput="validity.valid||(value='0');" id="min_price" data-id="min" name="price" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;" />
                <input type="number" value="{$formFilter.range.price.max}" min="{$formFilter->range['price']->getOption('min')}" max="{$formFilter->range['price']->getOption('max')}" oninput="validity.valid||(value='10000');" id="max_price" data-id="max" name="price" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>                    
                <div style="text-align: right;">
                    <button class="btn btn-success ApplyBtn">{__('Apply')}</button> 
                </div>           
            </ul>
                        </div>
                          <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Language')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="lang" data-selected="{$formFilter.in.lang->getValue()}">
                <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>    
                    {foreach $formFilter->in.lang->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.lang->getArray()->in($key)}active{/if} Filter In Options" name="lang" data-value="{$key}">{$language}</a></li>                    
                    {/foreach}  
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
            
                       <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Country')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="country" data-selected="{$formFilter.in.country->getValue()}">
                <input type="text" class="FilterSearch form-control" name="country" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.country->getChoices()->toArray() as $key=>$country}
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.country->getArray()->in($key)}active{/if} Filter In Options Country" name="Country" data-value="{$key}">{$country}</a></li>
                    {/foreach}
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
            </div>
                    
                    
<div class="calendar-container">
    <div class="fc fc-unthemed fc-ltr">
        <div class="fc-toolbar fc-header-toolbar">
            <div class="fc-left"></div>
            <div class="fc-right">
                <div class="fc-button-group">
                    {foreach $formFilter->mode->getChoices() as $mode=>$value}
                         <button type="button" data-value="{$mode}" class="Filter Mode mr-5 fc-month-button fc-button fc-state-default {if $formFilter.mode->getValue()==$mode}fc-state-active{/if}">
                          {$value}
                        </button>
                    {/foreach}                       
                </div>
            </div>
            <div class="fc-center">
                <div>
                    <button type="button" id="Prev" class="fc-prev-button fc-button fc-state-default" aria-label="prev">
                        <span class="fc-icon fc-icon-left-single-arrow"></span>
                    </button>
                    {if $formFilter.mode->getValue()=='MONTH'}
                    <h2>{$formFilter->getDate()->getMonthNameI18n()->ucfirst()} {$formFilter->getDate()->getYear()}</h2>
                    {elseif $formFilter.mode->getValue()=='WEEK'}
                    <h2>{$formFilter->getDate()->getText('p')}</h2>
                    {elseif $formFilter.mode->getValue()=='DAY'}
                    <h2>{$formFilter->getDate()->getText('p')}</h2>
                    {/if}       
                    <button type="button" id="Next" class="fc-next-button fc-button fc-state-default" aria-label="next">
                        <span class="fc-icon fc-icon-right-single-arrow"></span>
                    </button>
                </div>
            </div>
            <div class="fc-clear"></div>                
        </div>
                
        {if $formFilter.mode->getValue()=='MONTH'}
             {include file="./includes/_month.tpl"}   
         {elseif $formFilter.mode->getValue()=='WEEK'}
             {include file="./includes/_week.tpl"}  
         {elseif $formFilter.mode->getValue()=='DAY'}
             {include file="./includes/_day.tpl"}  
         {/if}       
    </div>  
    
    
    <div class="modal fade" id="Event-Modal" aria-hidden="true" aria-labelledby="editNewEvent" role="dialog" tabindex="-1" data-show="false">
            <div class="modal-dialog modal-simple">
              <div id="event-modal-ctn" class="modal-content form-horizontal">                                   
              </div>
              </div>
    </div>
    
    <script type="text/javascript">
           
    {JqueryScriptsReady}                            
           
        function getFilterParameters()
        {
            var params={    {*if $node_i18n}EmployeeCategoryI18n : '{$node_i18n->getUrlString()}', {/if*}
                            filter: {   equal: {  }, in : { }, range : { },                               
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                sortby : $(".Filter.SortBy.Options.active").attr('data-value'),
                                token:'{$formFilter->getCSRFToken()}'
                         } };  
            $(".Filter.Equal.Options.active").each(function () { params.filter.equal[$(this).attr('name')]=$(this).attr('data-value'); }); 
                        
            $(".Filter.In.Options.active").each(function () {                
                var name=$(this).parent().parent().parent().attr('name');
                if (!params.filter.in[name]) params.filter.in[name]= [];
                if (!$(this).attr('data-value')) return ;
                params.filter.in[name].push($(this).attr('data-value')); 
            });
            $(".Filter.Range").each(function () {  
                if (!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('data-id')]=$(this).val();
            });
            return params;                  
        }
        
        
        function updateFilter()
        {        
            $("#ftco-loader").addClass('show');
            return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('site_event_ajax',['action'=>'Calendar'])}",                        
                            target: "#page-wrapper",
                            success : function (resp)
                            {
                                $("#ftco-loader").removeClass('show');
                            }
            });
        }
        
        $(".Filter.Equal.Options").click(function () {          
             $(".Filter.Equal.Options."+$(this).attr('data-name')).removeClass('active');             
             $(this).addClass('active'); //.parent().parent().attr('data-selected',$(this).attr('data-value'));
              return updateFilter();
        });
        
        
        $(".Filter.In.Options").click(function (e) {
            $(this).toggleClass('active');  
            e.stopPropagation();
        });
        
        $(".ApplyBtn").click(function () {          
               return updateFilter();
        });
        
        $(".Filter.SortBy.Options").click(function () {          
            $(".Filter.SortBy.Options").removeClass('active');             
            $(this).addClass('active');           
            return updateFilter();
        });
        
        $(".FilterSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
            $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
           
            {*$(".Filter.Mode").click(function () { 
                    var params = {  filter : {  
                          date_in : '{$formFilter->getDate()}',
                          mode : $(this).data('value'),                         
                          token:'{$formFilter->getCSRFToken()}' }
                    };
                    return $.ajax2({  data : params,                               
                                    url:"{url_to('site_event_ajax',['action'=>'Calendar'])}",                                    
                                    target : "#actions"

                  });    
           });*}
           
           
            $("#Prev").click(function() { 
                var params = {   filter : {                                   
                                date_in: "{$formFilter->getDate()}",
                                action : "PREV",
                                mode : "{$formFilter.mode}",                              
                                token:'{$formFilter->getCSRFToken()}'
                            }
                };         
                return $.ajax2({  data : params,                               
                                    url:"{url_to('site_event_ajax',['action'=>'Calendar'])}",                                    
                                    target : "#actions"
            }); 
            });
        
        
         $("#Next").click(function() { 
                var params = {   filter : {                                   
                                date_in: "{$formFilter->getDate()}",
                                action : "NEXT",
                                mode : "{$formFilter.mode}",                              
                                token:'{$formFilter->getCSRFToken()}'
                            }
                };         
                return $.ajax2({  data : params,                               
                                    url:"{url_to('site_event_ajax',['action'=>'Calendar'])}",                                    
                                    target : "#actions"
            }); 
        });
        
        
         $("#min_price,#max_price").off("paste keyup change");
          
	$("#min_price,#max_price").on("paste keyup change", function () {    
          if (parseInt($("#min_price").val()) > parseInt($("#max_price").val())) {
		$('#max_price').val(parseInt($("#min_price").val())); $('#min_price').val(parseInt($("#max_price").val()));
	  }
	  $("#slider-range").slider({ values: [ parseInt($("#min_price").val()), parseInt($("#max_price").val()) ]  });
	}); 
        
        $("#slider-range").slider({
		range: true,
		orientation: "horizontal",
		min: {$formFilter->range['price']->getOption('min')},
		max: {$formFilter->range['price']->getOption('max')},
		values: {$formFilter->getPrice()->toJson()},
		step: 100,
		slide: function (event, ui) {
		  if (ui.values[0] == ui.values[1]) 
			  return false;		  
		  $("#min_price").val(ui.values[0]);
		  $("#max_price").val(ui.values[1]);
		}
         });
      {/JqueryScriptsReady}
        </script>
</div>
{/if}    

