<div class="tab-pane fade active show" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
    <div class="row">
        <div class="col-md">
            <div class="form-group">
                <div class="form-field">
                    <div class="icon"><span class="icon-briefcase"></span></div>
                    <input type="text" class="form-control FindWorkEmployer FindWorkEmployerInput Input Fields" name="query" placeholder="{__('eg. Graphic. Web Developer')}">
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="form-group">
                <div class="form-field">
                    <div class="select-wrap">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="category" id="" class="form-control FindWorkEmployer Select Fields">
                            {foreach $form->category->getChoices() as $key=>$category_i18n}
                                <option value="{$key}">{$category_i18n}</option> 
                            {/foreach}                             
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="form-group" style="margin-bottom: 0rem;">
                <div class="form-field">
                    <div class="icon"><span class="icon-map-marker"></span></div>
                    <input type="text" id="FindWorkEmployerLocation" class="form-control FindWorkEmployer FindWorkEmployerInput Input Fields" name="location" placeholder="{__('Location')}">
                </div>
            </div>
            <ul id="location-ctn" class="location-ctn FindWorkEmployer Select Fields" name="location">

            </ul>
        </div>
        <div class="col-md">
            <div class="form-group">
                <div class="form-field">
                    <div class="icon"><span class="icon-map-marker"></span></div>
                    <input id="FindWorkEmployerSearch" type="submit" value="{__('Search')}" class="form-control btn btn-primary" style="background-color: #d8c209 !important;">  
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}
        

    {*if ($('#location-ctn li').length != 0){
        $('#location-ctn').css({ "background-color": "yellow" });
    }*}

{*$("body").click(function() {
    $("#services-container-id").hide();
});*}
        
        $("#FindWorkEmployerLocation").keyup(function () {            
            if ($(this).val().length < 3) return ;             
            return $.ajax2({  
                   data : { EmployerSearchLocation:  { search : $(this).val(), token : '{mfForm::getToken('EmployerSearchCityForm')}' } }, 
                   url :"{url_to('employers_ajax',['action'=>'SearchCity'])}",                                
                   success: function(resp) {                                            
                                if (resp.action !='SearchCity') return ;
                                $("#location-ctn").html("").attr({ "data-city": null, "data-country":null });
                                $.each(resp.items,function (idx,obj) { $("#location-ctn").append('<li class="FindWorkEmployer Options Fields" value="'+obj.text+'" data-country="'+obj.country+'" data-city="'+obj.city+'">'+obj.text+'</li>'); });
                                if ($('#location-ctn li').length != 0){
                                    $('#location-ctn').css({ "background-color": "#fff","border": "1px solid #ced4da","border-radius": "5px"  });
                                }
                          }
            });                   
        });  
        
          $("#FindWorkEmployerSearch").click(function () {
          var params = { Search:  {  city: $(".FindWorkEmployer.Input[name=location]").attr('data-city'),country: $(".FindWorkEmployer.Input[name=location]").attr('data-country'), token : '{mfForm::getToken('EmployerSearchQueryForm')}' } };
          $(".FindWorkEmployer.Input").each(function () { params.Search[$(this).attr('name')]=$(this).val(); });               
          $(".FindWorkEmployer.Select option:selected").each(function () { params.Search[$(this).parent().attr('name')]=$(this).val(); });               
            return $.ajax2({  
                   data : params, 
                   url :"{url_to('employers_ajax',['action'=>'SearchAdvert'])}",                                
                   success : function (resp)
                        {         
                            if (resp.errors && resp.action=='SearchAdvert')
                            {  
                                $(".FindWorkEmployerInput").addClass('intro');
                                return ;
                            } 
                            $("#actions-ctn").html(resp);
                        }
            });                 
        });  
        
        $('#location-ctn').on('click', 'li', function() {
                $("#location-ctn li").removeClass("selected"); //assuming that it has to be removed from other li's, else remove this line
                $( this ).addClass("selected");
            });
        
        $("#location-ctn").click(function () {         
            var option= $(this).find('li.selected');
            $(".FindWorkEmployer.Input[name=location]").val(option.text());
            if ($("#location-ctn-employee").find("li").length == 0) {               
                $("#location-ctn").css({ "border": "none" });
            }
            $('#location-ctn li.selected').remove();
            $(".FindWorkEmployer.Input[name=location]").attr('data-city',option.attr('data-city'));
            $(".FindWorkEmployer.Input[name=location]").attr('data-country',option.attr('data-country'));
        });
    {/JqueryScriptsReady}
</script>    