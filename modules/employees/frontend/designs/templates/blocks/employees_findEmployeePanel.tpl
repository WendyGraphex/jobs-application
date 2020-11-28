<div class="tab-pane fade show" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
    <div class="row">
        <div class="col-md">
                <div class="form-group">
                        <div class="form-field">
                                <div class="icon"><span class="icon-briefcase"></span></div>
                                <input type="text" class="form-control FindWorkEmployee FindWorkEmployeeInput Input Fields" name="query" placeholder="{__('eg. Graphic. Web Developer')}">
                              </div>
                      </div>
        </div>
         <div class="col-md">
                <div class="form-group">
                        <div class="form-field">
                                <div class="select-wrap">
                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                      <select name="category" id="" class="form-control FindWorkEmployee Select Fields">
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
                                <input type="text" id="FindWorkEmployeeLocation" class="form-control FindWorkEmployee FindWorkEmployeeInput Input Fields" name="location" placeholder="{__('Location')}">
                              </div>
                      </div>
                              <ul id="location-ctn-employee" class="location-ctn FindWorkEmployee Select Fields" name="location">
                                  
                              </ul>
        </div>
        <div class="col-md">
                <div class="form-group">
                        <div class="form-field">
                            <div class="icon"><span class="icon-map-marker"></span></div>
                               <input id="FindWorkEmployeeSearch" type="submit" value="{__('Search')}" class="form-control btn btn-primary" style="background-color: #d8c209 !important;">  
                                
                              </div>
                      </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}
        
        $("#FindWorkEmployeeLocation").keyup(function () {            
            if ($(this).val().length < 3) return ;             
            return $.ajax2({  
                   data : { EmployeeSearchLocation:  { search : $(this).val(), token : '{mfForm::getToken('EmployeeSearchCityForm')}' } }, 
                   url :"{url_to('employees_ajax',['action'=>'SearchCity'])}",                                
                   success: function(resp) {                                            
                                if (resp.action !='SearchCity') return ;
                                $("#location-ctn-employee").html("").attr({ "data-city": null, "data-country":null });
                                $.each(resp.items,function (idx,obj) { $("#location-ctn-employee").append('<li class="FindWorkEmployee Options Fields" value="'+obj.text+'" data-country="'+obj.country+'" data-city="'+obj.city+'">'+obj.text+'</li>'); });
                                if ($('#location-ctn-employee li').length != 0){
                                    $('#location-ctn-employee').css({ "background-color": "#fff","border": "1px solid #ced4da","border-radius": "5px"  });
                                }
                          }
            });                   
        });  
        
          $("#FindWorkEmployeeSearch").click(function () {      
          var params = { Search:  {  city: $(".FindWorkEmployee.Input[name=location]").attr('data-city'),country: $(".FindWorkEmployee.Input[name=location]").attr('data-country'),token : '{mfForm::getToken('EmployeeSearchQueryForm')}' } };
          $(".FindWorkEmployee.Input").each(function () { params.Search[$(this).attr('name')]=$(this).val(); });
          $(".FindWorkEmployee.Select option:selected").each(function () { params.Search[$(this).parent().attr('name')]=$(this).val(); });             
            return $.ajax2({  
                   data : params, 
                   url :"{url_to('employees_ajax',['action'=>'SearchAdvert'])}",                                
                   success : function (resp)
                        {                                              
                            if (resp.errors && resp.action=='SearchAdvert')
                            {                                                              
                                $(".FindWorkEmployeeInput").addClass('intro');
                                 return ;
                            }                        
                            $("#actions-ctn").html(resp);
                        }
            });                 
        });  

            
        $('#location-ctn-employee').on('click', 'li', function() {
            $("#location-ctn-employee li").removeClass("selected"); //assuming that it has to be removed from other li's, else remove this line
            $(this).addClass("selected");
        });
        
        $("#location-ctn-employee").click(function () { 
            var option= $(this).find('li.selected');
            $(".FindWorkEmployee.Input[name=location]").val(option.text()); 
            if ($("#location-ctn").find("li").length == 0) {               
                $("#location-ctn-employee").css({ "border": "none" });
            }
            $('#location-ctn-employee li.selected').remove();
            $(".FindWorkEmployee.Input[name=location]").attr('data-city',option.attr('data-city'));
            $(".FindWorkEmployee.Input[name=location]").attr('data-country',option.attr('data-country'));
        });
               
    {/JqueryScriptsReady}
</script>  