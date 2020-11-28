  <div class="advertHead">
    {if $formFilter->getSearches()}    
        {if !$formFilter->getSearches()->getSearches()->isEmpty()}
        <span class="search-result">{__('Results for %s',(string)$formFilter->getSearches())}</span>        
        {/if}
    {/if}
    </div>

<div class="type-top-bar">       
        <div class="global-class-drop dropdown budget-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">Budget
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu">
                {*<label for="customRange3">Example range</label>
                <input type="range" class="custom-range" min="0" max="5" step="0.5" id="customRange3">*}
                <div id="slider-range"></div><br>                               
                <input type="number" value="{$formFilter.range.budget.min}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='0');" id="min_price" data-id="min" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;" />
                <input type="number" value="{$formFilter.range.budget.max}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='10000');" id="max_price" data-id="max" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>                    
                <div style="text-align: right;">
                    <button class="btn btn-success ApplyBtn">{__('Apply')}</button> 
                </div>
            </ul>
        </div>
         <div class="global-class-drop dropdown language-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Language')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="lang">
                <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.lang->getChoices()->toArray() as $key=>$language}
                        <li clas="item"><a href="#" class="dropdown-item {if  $formFilter.in.lang->getArray()->in($key)}active{/if} Filter In Options Language" Name="Language" data-value="{$key}">{$language}</a></li>
                    {/foreach}   
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>       
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Country')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="country">
                <input type="text" class="FilterSearch form-control" name="country" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.country->getChoices()->toArray() as $key=>$country}
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.country->getArray()->in($key)}active{/if} Filter In Options Country" name="Country" data-value="{$key}">{$country}</a></li>
                    {/foreach}
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('User Languages')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="user_language">
                <input type="text" class="FilterSearch form-control" name="user_language" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.user_language->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.user_language->getArray()->in($key)}active{/if} Filter In Options" name="user_language" data-value="{$key}">{$language}</a></li>                    
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
            </ul>
        </div>
            
        <div class="mixedModeClass">            
            {if $mode=='mixed'}
                <button id="Employee" class="btn myButtonDrop global-class-drop">{__('Freelancers')}</button>
                <button class="btn btn-success global-class-drop">{__('Employers')}</button>
            {/if}
            <div class="ResaultsNumber">
                <span class="">{format_number_choice('[0]No job|[1]One job available|(1,Inf]%s jobs available',$pager->getResults(),$pager->getResults())}</span>
            </div>
        </div>
        <div class="SortAdverts">
            <div class="global-class-drop dropdown country-drop">
                <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Sort by')}
                <span class="caret"></span></button>
                <ul class="myDropDownDrop dropdown-menu Filter" name="sortby" data-selected="{$formFilter.sortby->getValue()}">
                    {foreach $formFilter->sortby->getChoices()->toArray() as $key=>$value}
                      <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $key==$formFilter.sortby->getValue()}active{/if} Filter Options SortBy" name="SortBy" data-value="{$key}">{$value}</a></li>
                {/foreach}                    
                </ul>
            </div>
        </div>
      
</div>
<script type="text/javascript">
    
    {*$(".FilterSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });*}
  

{*$( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "₹" + ui.values[ 0 ] + " - ₹" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "₹" + $( "#slider-range" ).slider( "values", 0 ) +
      " - ₹" + $( "#slider-range" ).slider( "values", 1 ) );
  } );*}

</script>
