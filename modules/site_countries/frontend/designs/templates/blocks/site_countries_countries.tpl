	
        <div class="imgcountry">
            <label id="country">
                <a style="cursor:pointer; border-color: rgb(51, 51, 51);" id="ChangeCountry" data-country="{$country->get('code')}" title="{__('Change country')}">
                    <img src="{url("/pictures/flags/round/`$country->get('code')`.png","web","frontend")}" id="CountrySelectedPicture" class="img-country" style="width: 32px;height: 32px;">
                </a>
                <div class="btn-group" style="margin: 10px 0 0 5px; font-size: 13px;">
                    <a href="#" id="ChangeLang" class="dropdown-togglex" data-toggle="dropdownx" 
                       style="text-decoration: none; color: black;">{$language->get('code')|upper}</a>
                    <div id="Languages-ctn">
                        <ul class="Languages langForCountry" id="Languages" style="display:none;">
                            {if $country->getLanguages()->count() > 1}                               
                                {foreach $country->getLanguages() as $lang}
                                    <li>
                                        <a class="myCountry" href="/{$lang->get('code')}/" class="lang Language">{$lang->getFormatter()->getCode()->upper()}</a>
                                    </li>                             
                                {/foreach}
                            {/if}
                        </ul>
                    </div>
                </div>
            </label>
        </div>
        {if !$countries->isEmpty()}                             
        <div class="row text-center" style="position: absolute; z-index: 100;">
            <div id="Countries" class="{* col-lg-1 col-lg-2... jusqu'a col-lg-12 *} col-lg col-md col-sm col-xs panel panel-default shadow1" style="display:none; padding: 5px;">
                <div class="panel-heading text-left" style="padding:0px; height: 39px;">
                    <input id="inputSearch" class="searchlang form-control" type="text" placeholder="{__('Find')}" >
                </div>
                <div class="panel-body" style="padding-top: 10px;">
                    <ul class="row nav nav-tabs text-left" style="list-style: none; padding-right: -30px;"> 
                    {foreach $countries as $item}
                        <li class="Country col-md col-sm col-xs" id="{$item->get('id')}" {if $item->get('id')==$country->get('id')}style="display:none"{/if}>
                            <a style="margin-bottom: 12px;" class="Countries" data-country="{$item->get('code')}" data-json='{$item->getLanguages()->toJson()}' id="{$item->get('id')}" data-url="{url("/pictures/flags/round/`$item->get('code')`.png","web","frontend")}">
                                <img style="margin-right: 10px;" class="img-country-change" src="{url("/pictures/flags/round/`$item->get('code')`.png","web","frontend")}"/> 
                                <h3 style="margin-top: 8px;">{$item->getFormatter()->getFormatted()->ucfirst()}</h3>
                            </a>
                        </li>  
                    {/foreach}                               
                    </ul> 
                </div>
            </div>
        </div>
        {/if}
        
    <script type="text/javascript">
    {JqueryScriptsReady}
        
    {* $("#inputSearch").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#listCountries li").filter(function() {
                      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                    });
                  }); *}
                
                $("#ChangeCountry").click(function() {  
                    $("#Countries").toggle();
                  //$("#ChangeLang").popover("hide");
                  //$(".country").toggle("show");
                });
                                                  
                $("#ChangeLang").click(function() {
                    $(".Languages").toggle();
                });
                    
                $('body').on('click', function(e) {  
                    if (e.target.id != 'Languages' && e.target.id != 'ChangeLang')
                            $(".Languages").hide();
                    if (e.target.id != 'CountrySelectedPicture' && e.target.id != 'Countries' && $(e.target).closest('#Countries').length == 0)
                            $("#Countries").hide();
                });
                  
                $(".Countries").click(function () { 
                    $(".Country").show();
                    $(".Country[id="+$(this).attr('id')+"]").hide();
                    $("#CountrySelectedPicture").attr("src",$(this).attr('data-url')); 
                    $("#ChangeCountry").attr('data-country',$(this).attr('data-country'));
                    var data=$(this).data('json');
                    $("#ChangeLang").html(data[0].code.toUpperCase());                      
                    var html='<ul class="Languages">';
                    $.each($(this).data('json'),function (id,obj) {                           
                        html+='<li>\n\
                                    <a href="/'+obj.code+'/?country='+$("#ChangeCountry").attr('data-country')+'" class="lang Language">\n\
                                        '+obj.code+'\
                                    </a>\n\
                               </li>';                             
                    });
                    html+='</ul>';                          
                    $("#Languages-ctn").html(html);
                });
                    
   {/JqueryScriptsReady} 
    </script>      