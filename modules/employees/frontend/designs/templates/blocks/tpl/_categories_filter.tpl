 <div class="type-top-bar">       
        <div class="global-class-drop dropdown budget-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">{__('Budget')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
                
                <div id="slider-range"></div>   <br>                               
                <input type="number" value="{$formFilter.range.budget.min}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='0');" id="min_price" data-id="min" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;" />
                <input type="number" value="{$formFilter.range.budget.max}" min="{$formFilter->range['budget']->getOption('min')}" max="{$formFilter->range['budget']->getOption('max')}" oninput="validity.valid||(value='10000');" id="max_price" data-id="max" name="budget" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>                    
                <div style="text-align: right;">
                    <button class="btn btn-success ApplyBtn">{__('Apply')}</button> 
                </div>           
            </ul>
        </div>
        {*<div class="global-class-drop dropdown language-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Advert language')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter Equal ulFilter" name="lang" data-selected="{$formFilter.equal.lang->getValue()}">
                <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->equal.lang->getChoices()->toArray() as $key=>$language}
                          <li clas="item"><a href="#" class="dropdown-item {if $key==$formFilter.equal.lang->getValue()}active{/if} Filter Equal Options Language" Name="Language" data-value="{$key}">{$language}</a></li>
                    {/foreach} 
                </div>
            </ul>
        </div>*}
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
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Skills')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="skill_id" data-selected="{$formFilter.in.skill_id->getValue()}">
                <input type="text" class="FilterSearch form-control" name="skill_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.skill_id->getChoices() as $key=>$skill}
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.skill_id->getArray()->in($key)}active{/if} Filter In Options" name="skill_id" data-value="{$key}">{$skill}</a></li>
                    {/foreach}
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Experiences')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="experience_id" data-selected="{$formFilter.in.experience_id->getValue()}">
                <input type="text" class="FilterSearch form-control" name="experience_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.experience_id->getChoices()->toArray() as $key=>$experience}
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.experience_id->getArray()->in($key)}active{/if} Filter In Options" name="experience_id" data-value="{$key}">{$experience}</a></li>
                    {/foreach}  
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
        <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Study levels')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="level_id" data-selected="{$formFilter.in.level_id->getValue()}">
                <input type="text" class="FilterSearch form-control" name="level_id" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.level_id->getChoices()->toArray() as $key=>$level}                   
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.level_id->getArray()->in($key)}active{/if} Filter In Options" name="level_id" data-value="{$key}">{$level}</a></li>                    
                    {/foreach}   
                </div>
               <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
         <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Freelancer Languages')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="user_language" data-selected="{$formFilter.in.user_language->getValue()}">
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
                
        {if $mode=='mixed'}    
         <button class="btn btn-success">{__('Freelancers')}</button>
        <button id="Employer" class="btn myButtonDrop">{__('Employers')}</button>
        {/if}
        
            <div class="ResaultsNumber">
                <span class="">{format_number_choice('[0]No job|[1]One job available|(1,Inf]%s jobs available',$pager->getResults(),$pager->getResults())}</span>
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
       
