     <div class="advertHead">
    {if $formFilter->getSearches()}  
          {if !$formFilter->getSearches()->getSearches()->isEmpty()}
        <span class="search-result">{__('Results for %s',(string)$formFilter->getSearches())}</span>        
        {/if}
    {/if}
    </div>
    <div class="type-top-bar">
        <div class="global-class-drop dropdown budget-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">Budget
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu ulFilter" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
                <div id="slider-range"></div>   <br>                               
                <input type="number" value="{$formFilter.range.budget.min}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='0');" id="min_price" data-id="min" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;" />
                <input type="number" value="{$formFilter.range.budget.max}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='10000');" id="max_price" data-id="max" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>                    
                <div style="text-align: right;">
                    <button class="btn btn-success ApplyBtn">{__('Apply')}</button> 
                </div>             
            </ul>
        </div>
        
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Languages')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="lang">
                <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.lang->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.lang->getArray()->in($key)}active{/if} Filter In Options" name="lang" data-value="{$key}">{$language}</a></li>                    
                    {/foreach}
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Experiences')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="experience_id">
                <input type="text" class="FilterSearch form-control" name="experience_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.experience_id->getChoices()->toArray() as $key=>$experience}
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.experience_id->getArray()->in($key)}active{/if} Filter In Options" name="experience_id" data-value="{$key}">{$experience}</a></li>
                    {/foreach}   
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Study levels')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="level_id">
                <input type="text" class="FilterSearch form-control" name="level_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.level_id->getChoices()->toArray() as $key=>$level}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.level_id->getArray()->in($key)}active{/if} Filter In Options" name="level_id" data-value="{$key}">{$level}</a></li>                    
                    {/foreach}  
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Skills')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="skill_id">
                <input type="text" class="FilterSearch form-control" name="skill_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.skill_id->getChoices() as $key=>$skill}
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.skill_id->getArray()->in($key)}active{/if} Filter In Options" name="skill_id" data-value="{$key}">{$skill}</a></li>
                    {/foreach}  
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>       
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('User languages')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="user_language">
                <input type="text" class="FilterSearch form-control" name="user_language" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.user_language->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.user_language->getArray()->in($key)}active{/if} Filter In Options" name="user_language" data-value="{$key}">{$language}</a></li>                    
                    {/foreach} 
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Countries')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="country">
                <input type="text" class="FilterSearch form-control" name="country" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.country->getChoices()->toArray() as $key=>$country}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.country->getArray()->in($key)}active{/if} Filter In Options" data-value="{$key}">{$country}</a></li>                    
                    {/foreach}  
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Online')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter Equal ulFilter" name="is_online">
                <div>
                    {foreach $formFilter->equal.is_online->getChoices() as $key=>$value}                   
                        <li clas="item"><a href="#" class="dropdown-item Filter Equal Options {if $formFilter.equal.is_online->getValue()==$key}active{/if} IsOnline" data-name="IsOnline" name="is_online" data-value="{$key}">{$value}</a></li>                    
                    {/foreach}  
                </div>
              {* <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div> *}
            </ul>
        </div>
        {*html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_online" options=$formFilter->equal.is_online->getOption('choices') selected=(string)$formFilter.equal.is_online*}
   
            
            
        <div class="ResaultsNumber">
                <span class="">{format_number_choice('[0]No advert|[1]One advert available|(1,Inf]%s adverts available',$pager->getResults(),$pager->getResults())}</span>
            </div>
       
        <div class="SortAdverts">
            <div class="global-class-drop dropdown country-drop">
                <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Sort by')}
                <span class="caret"></span></button>
                <ul class="myDropDownDrop dropdown-menu Filter" name="sortby" data-selected="{$formFilter.sortby->getValue()}">
                    {foreach $formFilter->sortby->getChoices()->toArray() as $key=>$value}
                      <li clas="item"><a href="#" class="dropdown-item {if $key==$formFilter.sortby->getValue()}active{/if} Filter Options SortBy" name="SortBy" data-value="{$key}">{$value}</a></li>
                {/foreach}                    
                </ul>
            </div>
        </div>
     </div>
         
          
        <div class="row d-flex">
         {foreach $pager as $item_i18n}
             {component name="/employees/advertDisplay" advert=$item_i18n}                 
         {/foreach}        
         
         
         {*<div id="myModalMO" class="modal fade" role="dialog">
                             <div class="modal-dialog">
                               <div class="modal-content">
                                 <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                 </div>
                                   <div class="modal-body" style="text-align:center;color: #109310;">
                                       <i class="mdi mdi-check-circle" style="font-size: 45px;"></i><p style="font-size: 19px;">{__('Your request has been sent to')} <span style="font-weight: 700;color: #187d28;">{$item_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getUsername()->ucfirst()}</span></p>
                                 </div>
                               </div>
                             </div>
                         </div>*}
         
         
        </div>
          
        <div class="row mt-5">
            {include file="./_pagers/default/_default_pager_adverts.tpl" pager=$pager} 
        </div>
       
        {component name="/employees_messager/dialog"}
        {component name="/sales_quotation/getquote"}
        {component name="/employees/abuse"}
        
        
        <script type="text/javascript">
      
    {JqueryScriptsReady}  
        $('.owl-carousel').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:1,
           // autoplay:true,
            autoplayTimeout:10000,
            autoplayHoverPause:true,
            nav : true,
            dots: true, //Make this true
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
            {*navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],*}
        });
   
   
        function getFilterParameters()
        {
            var params={ filter: {  order : { },  search : { }, equal: {  },  range : { },   in: { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } }; 
            $(".Filter.Equal.Options.active").each(function () { params.filter.equal[$(this).attr('name')]=$(this).attr('data-value'); });             
            $(".Filter.Range").each(function () {  
                if (!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('data-id')]=$(this).val();
            });
             $(".Filter.In.Options.active").each(function () {                
                var name=$(this).parent().parent().parent().attr('name');
                if (!params.filter.in[name]) params.filter.in[name]= [];
                if (!$(this).attr('data-value')) return ;
                params.filter.in[name].push($(this).attr('data-value')); 
            });        
            return params;                      
        }
                
        function updateFilter()
        {    
            $("#ftco-loader").addClass('show');
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employees_ajax',['action'=>'ListPartialAdverts'])}" ,                          
                            target: "#page-wrapper",
                            success : function (resp)
                                {                                    
                                    $("#ftco-loader").removeClass('show');
                                }
                             });
        }
        
        $(".Filter.In.Options").click(function (e) {          
             $(this).toggleClass('active');  
             e.stopPropagation();
        });
        
         $(".Filter.Equal.Options").click(function () {          
             $(".Filter.Equal.Options."+$(this).attr('data-name')).removeClass('active');             
             $(this).addClass('active'); //.parent().parent().attr('data-selected',$(this).attr('data-value'));
              return updateFilter();
        });
        
        $(".ApplyBtn").click(function () {          
               return updateFilter();
        });
        
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_ajax',['action'=>'ListPartialAdverts'])}?page="+$(this).attr('data-page'),                                
                                 target: "#page-wrapper",
                                 success : function (resp)
                                {
                                    $("#ftco-loader").removeClass('show');
                                }
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
		min: {$formFilter->range['budget']->getOption('min')},
		max: {$formFilter->range['budget']->getOption('max')},
		values: {$formFilter->getBudget()->toJson()},
		step: 100,
		slide: function (event, ui) {
		  if (ui.values[0] == ui.values[1]) 
			  return false;		  
		  $("#min_price").val(ui.values[0]);
		  $("#max_price").val(ui.values[1]);
		}
         });
                

      $(".FilterSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
            $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
       
    {/JqueryScriptsReady}  
    </script>          