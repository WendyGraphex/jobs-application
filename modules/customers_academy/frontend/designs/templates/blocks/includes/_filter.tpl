<div class="row filter">
                    <h2>{__('All courses')}</h2>
                    <div class=" btn-group dropdowns">
                        <div class="dropdown">
                            <button type="button" class="btn btn-outline-primary">{__('Lastest')}</button>
                            
                             <div class="global-class-drop dropdown lang-drop">
                                    <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Language')}
                                    <span class="caret"></span></button>
                                    <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="lang" data-selected="{$formFilter.in.lang->getValue()}">
                                        <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                                        <div>    
                                            {foreach $formFilter->in.lang->getChoices()->toArray() as $key=>$lang}                   
                                                <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.lang->getArray()->in($key)}active{/if} Filter In Options" name="lang" data-value="{$key}">{$lang}</a></li>                    
                                            {/foreach}  
                                        </div>
                                        <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
                                    </ul>
                            </div>
                            
                            <button type="button" class="btn btn-outline-primary dropdown-toggle"  data-toggle="dropdown">
                                Topic
                                <i class="fa fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">A</a>
                                <a class="dropdown-item" href="#">B</a>
                                <a class="dropdown-item" href="#">C</a>
                            </div>
                            <button type="button" class="btn btn-outline-primary dropdown-toggle"  data-toggle="dropdown">
                                Software
                                <i class="fa fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">A</a>
                                <a class="dropdown-item" href="#">B</a>
                                <a class="dropdown-item" href="#">C</a>
                            </div>
                            
                            
                             <div class="global-class-drop dropdown level-drop">
                                    <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Level')}
                                    <span class="caret"></span></button>
                                    <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="level" data-selected="{$formFilter.in.level->getValue()}">
                                        <input type="text" class="FilterSearch form-control" name="level" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                                        <div>    
                                            {foreach $formFilter->in.level->getChoices()->toArray() as $key=>$level}                   
                                                <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.level->getArray()->in($key)}active{/if} Filter In Options" name="level" data-value="{$key}">{$level}</a></li>                    
                                            {/foreach}  
                                        </div>
                                        <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
                                    </ul>
                            </div>
                        </div> 
                    </div>
                </div>     

