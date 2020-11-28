    <div class="advertHead">
    {if $formFilter->getSearches()}    
        {if !$formFilter->getSearches()->getSearches()->isEmpty()}
        <span class="search-result">{__('Results for %s',(string)$formFilter->getSearches())}</span>        
        {/if}
    {/if}
    </div>
    <div class="type-top-bar">
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Languages')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="user_language">
                <input type="text" class="FilterSearch form-control" name="user_language" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.user_language->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.user_language->getArray()->in($key)}active{/if} Filter In Options" data-value="{$key}">{$language}</a></li>                    
                    {/foreach}  
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Countries')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In" name="country">
                 <input type="text" class="FilterSearch form-control" name="country" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.country->getChoices()->toArray() as $key=>$country}                   
                        <li clas="item"><a href="#" class="dropdown-item {if $formFilter.in.country->getArray()->in($key)}active{/if} Filter In Options" data-value="{$key}">{$country}</a></li>                    
                    {/foreach} 
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>    
        <div class="ResaultsNumber">
                <span class="">{format_number_choice('[0]No company|[1]One company available|(1,Inf]%s companies available',$pager->getResults(),$pager->getResults())}</span>
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
                {component name="/employers/companyContentDisplay" content_i18n=$item_i18n}
            {/foreach}                          
        </div>
          
        <div class="row mt-5">
            {include file="./_pagers/default/_default_pager_adverts.tpl" pager=$pager} 
        </div>
       

        
        <script type="text/javascript">
      
    {JqueryScriptsReady}  
        
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, search : { },equal: { }, in:{ },range : { },                                
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } }; 
            $(".Filter.Range").each(function () {  
                if (!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('data-id')]=$(this).val();
            });
             $(".Filter.In.Options.active").each(function () {                
                var name=$(this).parent().parent().attr('name');
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialCompanies'])}" ,                          
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

        
        $(".ApplyBtn").click(function () {          
               return updateFilter();
        });
        
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCompanies'])}?page="+$(this).attr('data-page'),                                
                                 target: "#page-wrapper"
                });
        });
        
         $(".FilterSearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
        
    {/JqueryScriptsReady}  
    </script>          
