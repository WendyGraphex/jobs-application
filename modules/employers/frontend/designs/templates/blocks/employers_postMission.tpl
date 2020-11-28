<style>
    div.dz-default.dz-message{
        {*position: absolute;
        top: 71px;
        right: 52px;*}
        margin-top: -50px;
        margin-bottom: 5px;
    }
    {*textarea { 
   resize:vertical; 
}*}
</style>     

<section class="SectionWantJob ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
            <div class="col-md-12 text-center" style="padding-top: 62px;">
                <h1 class="StyleH1">{__('Post a Mission')}</h1>
            </div>
            
            <div id="WantJob-ctn" class="ftco-search" style="padding-top: 100px;">
                <div class="row">
                    <div class="col-md-12 nav-link-wrap">
                    <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a style="width: 376px;" class="NewClass nav-link mr-md-1 active" id="v-pills-coordinates-tab" data-toggle="pill" href="#v-pills-coordinates" role="tab" aria-controls="v-pills-coordinates" aria-selected="true"><label class="">1</label> {__('Coordinates')}</a>
                       <a style="width: 376px;" class="NewClass nav-link mr-md-1 " id="v-pills-adverts-tab" data-toggle="pill" href="#v-pills-adverts" role="tab" aria-controls="v-pills-adverts" aria-selected="false"><label class="">2</label> {__('Annonces')}</a>
                       <a style="width: 376px;" class="NewClass nav-link mr-md-1 " id="v-pills-documents-tab" data-toggle="pill" href="#v-pills-documents" role="tab" aria-controls="v-pills-documents" aria-selected="false"><label class="">3</label> {__('Documents')}</a>
                    </div>
                  </div>
                  <div class="col-md-12 tab-wrap">			            
                    <div class="tab-content p-4" id="v-pills-tabContent">			                                     
                        <div style="margin-right: 15px;" class="tab-pane fade show active" id="v-pills-coordinates" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <div class="errors" name="gender"></div> 
                                         <select name="gender" class="form-control EmployerCoordinatesWantJob Fields Select error">
                                            <option value="">{__('Gender')}</option> 
                                        {foreach $form->coordinates.gender->getChoices() as $key=>$value}                                            
                                             <option value="{$key}" {if $key==$employer->get('gender')}selected=""{/if}>{format_gender($value)}</option>                                                                                         
                                        {/foreach}    
                                         </select>                                        
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <div class="errors" name="lastname"></div> 
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="firstname" placeholder="{__('Last name')} {if $form->coordinates.lastname->getOption('required')}*{/if}" value="{$employer->get('firstname')|escape}">
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <div class="errors" name="firstname"></div> 
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="lastname" placeholder="{__('First name')} {if $form->coordinates.firstname->getOption('required')}*{/if}" value="{$employer->get('lastname')|escape}">
                                    </div>
                                </div>
                            </div>
                {*========================Second Row=============================*}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="errors" name="email"></div> 
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="email" placeholder="{__('Email')} {if $form->coordinates.email->getOption('required')}*{/if}" value="{$employer->get('email')|escape}"/>
                                        <span id="validateEmailValid" class="validateEmail" style="color:#09ad7e;display:none;position: absolute;right:-6px;top: 6px;font-size: 22px;"><i class="mdi mdi-checkbox-marked-circle"></i></span>
                                        <span id="validateEmailNotValid" class="validateEmail" style="color:#ff0000;display:none;position: absolute;right:-6px;top: 6px;font-size: 22px;"><i class="mdi mdi-close-circle"></i></span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="errors" name="phone"></div> 
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input" name="phone" placeholder="{__('Phone')} {if $form->coordinates.phone->getOption('required')}*{/if}" value="{$employer->get('phone')|escape}">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="errors" name="mobile"></div>
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="mobile" placeholder="{__('Mobile')} {if $form->coordinates.mobile->getOption('required')}*{/if}" value="{$employer->get('mobile')|escape}">
                                    </div>
                                </div>
                            </div>
                {*========================Third Row=============================*}
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="errors" name="address1"></div>
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="address1" placeholder="{__('Your Address')} {if $form->coordinates.address1->getOption('required')}*{/if}" value="{$employer->get('address1')|escape}">
                                    </div>
                                </div>
                            </div>
                {*========================Fourth Row=============================*}
                            <div class="row">
                                <div class="col-md-12" id="Address2" style="display: none;">
                                    <div class="form-group">
                                        <div class="errors" name="address2"></div>
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input" name="address2" placeholder="{__("Address cont'd")} {if $form->coordinates.address2->getOption('required')}*{/if}" value="{$employer->get('address2')|escape}">
                                    </div>
                                </div>
                            </div>
                            <span id="ShowAddress" class="mdi mdi-plus-circle"></span>
                            
                {*========================Fifth Row=============================*}
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="errors" name="postcode"></div>
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="postcode" placeholder="{__('Postcode')} {if $form->coordinates.postcode->getOption('required')}*{/if}" value="{$employer->get('postcode')|escape}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="errors" name="address2"></div>
                                        <input type="text" class="form-control EmployerCoordinatesWantJob Fields Input error" name="city" placeholder="{__('City')} {if $form->coordinates.city->getOption('required')}*{/if}" value="{$employer->get('city')|escape}">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="errors" name="country"></div>
                                       {select_country preferred=$settings->get('default_countries') selected=$user->getCountry() name="country" class="EmployerCoordinatesWantJob form-control Fields Select"} 
                                    </div>
                                </div>
                            </div> 
                                                            
                    {*========================Seveth Row=============================*}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="errors" name="password"></div>
                                        <input type="password" class="form-control EmployerCoordinatesWantJob Fields Input user_password error" name="password" placeholder="{__('Password')} {if $form->coordinates.password->getOption('required')}*{/if}">
                                        {*<a href="javascript:void();" id="" class="SeePassword see-pw" style=""><i id="eye" class="fa fa-eye-slash"></i></a>*}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="errors" name="password"></div>
                                        <input type="password" class="form-control EmployerCoordinatesWantJob Fields Input user_password error" name="repassword" placeholder="{__('Re-password')} {if $form->coordinates.password->getOption('required')}*{/if}">
                                        <a href="javascript:void();" id="" class="SeePassword see-pw"><i id="eye" class="mdi mdi-eye-off"></i></a>
                                        <a href="javascript:void();" id="" class="SeePassword see-pw" style="display: none;"><i id="eye" class="mdi mdi-eye-off"></i></a>
                                    </div>
                                </div>
                            </div>
                    {*========================Last Row=============================*}
                            <div class="row">
                                <div class="col-md-2" style="margin: 0 auto;">
                                    <div class="form-field text-right">
                                        <button id="SaveCoordinates" class="form-control btn btn-primary">{__('Next')}</button>
                                    </div>
                                </div>
                            </div>                
                        </div>                                                                                                                                                  
      
{*===================================================================Annonces====================================================================*}
                         <div class="tab-pane fade show" id="v-pills-adverts" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                               <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">                                        
                                       {html_options class="form-control" id="AdvertsLanguage" name="lang" options=$form->getLanguages()->forSelect()->toArray() selected=$user->getLanguage()}
                                    </div>
                                </div> 
                                <div class="col-md-9" style="text-align: -moz-right;padding-right: 0px;">
                                    <div class="col-md-4 form-group" style="padding-left: 0px;">
                                        <select class="form-control">
                                            <option>City</option>
                                            <option>Marrakech</option>
                                            <option>Laayoune</option>
                                            <option>Casablanca</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                </div>
                            </div>                                                                         
                     <div id="Categories-ctn">
                            <div class="row">
                                <div class="col-md-3" style="padding-right:0px !important;">
                                    <div class="form-group">
                                        <button id="categories-btn" type="button" class="btn btn-info TextButton" {* data-toggle="modal" data-target="#Category" *}>
                                            {__('Your categories')}<span class="mdi mdi-plus"></span>
                                        </button>
                                        <div class="modal fade" id="categories-modal" role="dialog">
                                            <div class="modal-dialog">
                                                <div  class="modal-content">
                                                    <div class="modal-header" style="">
                                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div id="categories-ctn" class="modal-body">                                                       
                                                                                                                          
                                                    </div>
                                                </div>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9 AllGategories">
                                    <div class="" style="{*background-color: red;width: 200px;height: 300px;*}">
                                        <ul class="ListeLI" id="AllGategories">
                                            <li clas="classLI" id="">Categort1<span class="closeLi" data-dismiss="modal">×</span></li>
                                            <li clas="classLI" id="">Categort1<span class="closeLi" data-dismiss="modal">×</span></li>
                                            <li clas="classLI" id="">Categort1<span class="closeLi" data-dismiss="modal">×</span></li>
                                            <li clas="classLI" id="">Categort1<span class="closeLi" data-dismiss="modal">×</span></li>
                                            <li clas="classLI" id="">Categort1<span class="closeLi" data-dismiss="modal">×</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>   
                     </div>  
                                    
                        <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                         {html_options class="form-control" id="AdvertExperience" name="experience_id" options=$form->advert.experience_id->getChoices()->toArray()}
                                    </div>
                                </div>
                                 <div class="col-md-3">
                                    <div class="form-group">
                                         {html_options class="form-control" id="AdvertStudyLevel" name="level_id" options=$form->advert.level_id->getChoices()->toArray()}
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                         {html_options class="form-control" id="AdvertContractType" name="type_id" options=$form->advert.type_id->getChoices()->toArray()}
                                    </div>
                                </div>                               
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="errors" name="salary"></div>
                                        <input type="text" class="form-control EmployerWantJob Fields Input error" name="postcode" placeholder="{__('Salary')} {*if $form->coordinates.postcode->getOption('required')}*{/if}" value="{$employer->get('postcode')|escape*}">
                                    </div>
                                </div>
                            </div> 
                    {foreach $form->getLanguages() as $language}                        
                {*========================Second Row=============================*}
                    <div class="Advert18n-ctn" id="{$language->get('code')}" {if !$language@first}style="display:none"{/if}>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="title" placeholder="{__('Title')} ({$language->getFormatter()->getFormatted()->ucfirst()})">
                                    </div>
                                </div>                               
                            </div>
                                      
                {*========================Row span==============================*}     
                    <div class="row">
                        <div class="col-md-3 ml-auto mr-3" style="text-align: right;padding-right: 0px !important;">
                            <span>Number of characters: <span id="spnCharLeft">1000</span></span>
                        </div>
                    </div>
                {*========================Third Row=============================*}
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea id="textareaDescriptionId" class="textareaDescription" placeholder="{__('Description')} ({$language->getFormatter()->getFormatted()->ucfirst()})"></textarea>
                                        {*<span id="spnCharLeft" style="position: absolute;top: 6px;float: unset;right: 28px;"></span>*}
                                    </div>
                                </div>
                            </div>
                    </div>                
                   {/foreach}                 
                {*========================Last Row=============================*}
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row RowCheck">
                                        <div class="col-md-3" style="padding: 6px;">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="defaultChecked1" checked>
                                                <label class="custom-control-label" for="defaultChecked1">{__('Visible mobile')}</label>
                                            </div>
                                        </div>

                                        <div class="col-md-3" style="padding: 6px;">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="defaultChecked2">
                                                <label class="custom-control-label" for="defaultChecked2">{__('Visible email')}</label>
                                            </div>
                                        </div>

                                        <div class="col-md-3" style="padding: 6px;">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="defaultChecked3" checked>
                                                <label class="custom-control-label" for="defaultChecked3">{__('Visible name')}</label>
                                            </div>
                                        </div>

                                        <div class="col-md-3" style="padding: 6px;">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="defaultChecked4">
                                                <label class="custom-control-label" for="defaultChecked4">{__('Mobility')}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                       <div class="col-md-2">
                                            <div class="form-field">
                                                <button class="form-control btn btn-primary">{__('Previous')}</button>
                                            </div>
                                        </div>
                                        <div class="col-md-2 NextClass" style="position: absolute;right: 0px;">
                                            <div class="form-field">
                                                <button id="SaveAdverts" class="form-control btn btn-primary">{__('Next')}</button>
                                            </div>
                                        </div> 
                                    </div>
                                    
                                </div>
                            </div>                
                        </div>
{*===================================================================DOCUMENTS====================================================================*}
                        <div class="tab-pane fade show {*if $step=='documents'}active{/if*}" id="v-pills-documents" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">                                                          
                {foreach $form->getLanguages() as $language}                        
                {*========================Second Row=============================*}
                    <div class="Documents-ctn" id="{$language->get('code')}">
                            <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group"> 
                                        {__('Documents for %s',$language->getFormatter()->getFormatted()->ucfirst())}
                                    </div>
                                  </div>                                    
                            </div>         
                                    
                                     <div class="row portfolio-grid">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
                     <figure class="effect-text-in ModeDisplay">
                        <div id="{$language->get('code')}" class="DropZoneDocuments dropzone dp-addFile pt-0"> 
                            <i class="mdi mdi-plus plus-icon plus-icon1"></i> 
                            {*<div class="div-img h-100">                              
                           </div> *}
                        </div>
                       <figcaption>                             
                       </figcaption>                          
                     </figure>                       
                </div> 
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">  
                    {*<a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>*}
                    <figure class="effect-text-in ModeDisplay">
                        <div class="div-img">
                            <img class="img-dpzone img-document" src="/admin/web/pictures/2016-10-Daiichi-Banner-Lixiana-DEF2.png" alt="image">
                        </div>
                    </figure>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">  
                    {*<a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>*}
                    <figure class="effect-text-in ModeDisplay">
                        <div class="div-img">
                            <img class="img-dpzone img-document" src="/admin/web/pictures/2016-10-Daiichi-Banner-Lixiana-DEF2.png" alt="image">
                        </div>
                    </figure>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">  
                    {*<a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>*}
                    <figure class="effect-text-in ModeDisplay">
                        <div class="div-img">
                            <img class="img-dpzone img-document" src="/admin/web/pictures/2016-10-Daiichi-Banner-Lixiana-DEF2.png" alt="image">
                        </div>
                    </figure>
                </div> 
                    </div> 
                    </div>
                   {/foreach}      
                                
                                 <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                       <div class="col-md-2">
                                            <div class="form-field">
                                                <button class="form-control btn btn-primary">{__('Previous')}</button>
                                            </div>
                                        </div>
                                        <div class="col-md-2 NextClass" style="position: absolute;right: 0px;">
                                            <div class="form-field">
                                                <button id="Publish" class="form-control btn btn-primary">{__('Publish')}</button>
                                            </div>
                                        </div> 
                                    </div>
                                    
                                </div>
                            </div>        
                        {*</div>  *}                                  
                    </div>                                                  
                    </div>
                  </div>                        	 
        </div>
      </div>
     </section>    

 <script type="text/javascript">     
     

    {*if($('.NewClass').hasClass('active')){
        //alert("zrdrdrdrdrdrdrdrd");
        //$('.LabelItem').css({ "background-color":"#fff","color":"#157efb" });
    };*}
        
        {*$.each($(".NewClass"), function() {
            if ($(this).hasClass("active","show")) {
                $(this).removeClass('ClassLabelNormal');
            $(this).find('label').css({ "background-color":"#fff","color":"#157efb" });
            }
        });*}
        
        {*$('.NewClass').click(function(){
        $.each($('.NewClass'), function() {
            if ($(this).hasClass('active')) {
                $('label').removeClass('ClassLabelActive');
            $(this).find('label').css({ "background-color":"#fff","color":"#157efb","width":"30px", "border-radius": "52px" });
           // $('label').toggleClass('ClassLabelNormal');
        }
        else{
            $('label').removeClass('ClassLabelNormal');
            $(this).find('label').css({ "background-color":"#157efb","color":"#fff","width":"30px", "border-radius": "52px" });
        }
            });
        });*}
        
        //$(".NewClass.active").find('label').addClass('ClassLabelActive');
    
     {JqueryScriptsReady}
      
    $('.textareaDescription').keyup(function () { $('#spnCharLeft').text(1000 - $(this).val().length);  });        
    
    $(".SeePassword").click(function () {
                $(".user_password").attr('type',($(".user_password").attr('type')=='text'?'password':'text')); 
                $("#eye").toggleClass("mdi-eye-off").toggleClass("mdi-eye");
                if($(".user_password").attr('type')=='text')
                {
                    setTimeout(function() { 
                    $(".user_password").attr('type',($(".user_password").attr('type')=='text'?'password':'text'));
                    $("#eye").toggleClass("mdi-eye-off").toggleClass("mdi-eye");
                    }, 10000); 
                }                      
            });
    
     {* $(".Fields.Input[name=email]").keyup(function () { 
                      $(".validateEmail").hide();                    
                      var r = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{ldelim}2,{rdelim}))$/;
                      if (!r.test($(this).val()))
                         return ;
                      return  $.ajax2({ data : { EmailChecker: { email: $(this).val(), token : '{mfForm::getToken('EmployerCheckEmailForm')}' } },                              
                                url:"{url_to('employers_ajax',['action'=>'CheckEmail'])}",  
                                success : function (resp)
                                    {                                             
                                        if (resp.action!='CheckEmail') return ;
                                        if (resp.status!='OK'){ 
                                           $("#validateEmailNotValid").show();
                                        } else {
                                           $("#validateEmailNotValid").hide();
                                           $("#validateEmailValid").show(); 
                                             
                                        }
                                    }
                        });
                });     *}
        
     $("#AdvertsLanguage").click(function(){
         $(".Advert18n-ctn").hide();  $(".Advert18n-ctn[id="+$(this).val()+"]").show(); 
         $(".Documents-ctn").hide();  $(".Documents-ctn[id="+$(this).val()+"]").show();
     }); 
      
     $("#ShowAddress").click(function(){ $("#Address2").show(); });
        
     $("#SaveCoordinates").click(function () {         
             var params = { EmployerCoordinates: {  token : '{$form->getCSRFToken()}' } };
             $(".EmployerCoordinatesWantJob.Input").each(function () { params.EmployerCoordinates[$(this).attr('name')]=$(this).val(); });
             $(".EmployerCoordinatesWantJob.Select option:selected").each(function () { params.EmployerCoordinates[$(this).parent().attr('name')]=$(this).val(); });
             return $.ajax2({ data: params, 
                              url:"{url_to('employers_ajax',['action'=>'SaveCoordinates'])}",   
                              success : function (resp)
                                        {
                                            if (resp.errors) 
                                            {
                                                alert("aaaaaaaaaaaaa");
                                                $.each(resp.errors,function (name,error) {
                                                    $(".error[name="+name+"]").addClass('intro');
                                                });
                                               //return ;  
                                            }                                               
                                            //if (resp.next)
                                            else
                                            {
                                                alert("bbbbbbbbbbbbbbb");
                                                $(".nav-link,.tab-pane").removeClass('active');                                                
                                                $(".tab-pane[id=v-pills-adverts]").addClass('active');
                                                $(".nav-link[id=v-pills-adverts-tab]").addClass('active show').removeClass('disabled');
                                            }   
                                        }
                }); 
     });
     
     $("#SaveAdverts").click(function () {         
             var params = { EmployerAdvert: {  coordinates: { }, adverts : { }, token : '{$form->getCSRFToken()}' } };
          //   $(".EmployerCoordinatesWantJob.Input").each(function () { params.EmployerCoordinates[$(this).attr('name')]=$(this).val(); });
          //   $(".EmployerCoordinatesWantJob.Select option:selected").each(function () { params.EmployerCoordinates[$(this).parent().attr('name')]=$(this).val(); });
             return $.ajax2({ data: params, 
                              url:"{url_to('employers_ajax',['action'=>'SaveAdverts'])}",   
                              success : function (resp)
                                        {
                                            if (resp.errors) 
                                            {
                                                $.each(resp.errors,function (name,error) {
                                                    $(".error[name="+name+"]").addClass('intro');
                                                });
                                               //return ;  
                                            }                                               
                                             if (resp.next)
                                            {
                                                $(".nav-link,.tab-pane").removeClass('active');                                                
                                                $(".tab-pane[id=v-pills-documents]").addClass('active');
                                                $(".nav-link[id=v-pills-documents-tab]").addClass('active show').removeClass('disabled');
                                            }  
                                        }
                }); 
     }); 
     
        $("#Publish").click(function () {         
             var params = { EmployerAdvert: {  coordinates: { }, adverts : { }, token : '{$form->getCSRFToken()}' } };
          //   $(".EmployerCoordinatesWantJob.Input").each(function () { params.EmployerCoordinates[$(this).attr('name')]=$(this).val(); });
          //   $(".EmployerCoordinatesWantJob.Select option:selected").each(function () { params.EmployerCoordinates[$(this).parent().attr('name')]=$(this).val(); });
             return $.ajax2({ data: params, 
                              url:"{url_to('employers_ajax',['action'=>'PublishAdverts'])}",   
                              success : function (resp)
                                        {
                                            if (resp.errors) 
                                            {
                                               return ;  
                                            }                                                                                          
                                        }
                }); 
     }); 
    

     $(".EmployerCoordinatesWantJob.Input[name=email]").keyup(function () { 
                      $(".validateEmail").hide();                    
                      var r = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{ldelim}2,{rdelim}))$/;
                      if (!r.test($(this).val()))
                         return ;
                      return  $.ajax2({ data : { EmailChecker: { email: $(this).val(), token : '{mfForm::getToken('EmployerCheckEmailForm')}' } },                              
                                url:"{url_to('employers_ajax',['action'=>'CheckEmail'])}",  
                                success : function (resp)
                                    {                                             
                                        if (resp.action!='CheckEmail') return ;
                                        if (resp.status!='OK'){ 
                                           $("#validateEmailNotValid").show();
                                        } else {
                                           $("#validateEmailNotValid").hide();
                                           $("#validateEmailValid").show();                                              
                                        }
                                    }
                        });
                });
      

       if ($(".DropZoneDocuments").find('.dz-default').length)
             $(".DropZoneDocuments")[0].dropzone.off().destroy();

        $(".DropZoneDocuments").dropzone({
            url: "{url_to("employers_ajax",['action'=>'UploadDocumentForAdvert'])}",
            clickable: false,
            params: { },   
            paramName: "UploadDocumentAdvert[file]",
            parallelUploads : 20,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {                               
                formData.append('UploadDocumentAdvert[lang]',this.element.id);                
            },                    
            success : function (file,response)
            {              
                 // console.log("Status="+response.status);
                 if (response.errors || response.status)                 
                     return ;                                               
                 $(".DropZoneDocuments").find('.dz-preview').remove();
                 $(".DropZoneDocuments").find('.dz-default').show();
                // $(".Pictures:last").after(response); 
            }                  
    }); 
    
    
    $("#cities-btn").click(function () { 
            return  $.ajax2({   url:"{url_to('employers_ajax',['action'=>'AddCitiesForAdvert'])}",  
                            success : function () { $("#cities-modal").modal('show'); },
                            target : "#cities-ctn"
                        });
    });
    
    $("#categories-btn").click(function () { 
            return  $.ajax2({   url:"{url_to('employers_ajax',['action'=>'AddCategoriesForAdvert'])}",  
                                success : function () { $("#categories-modal").modal('show'); },
                            target : "#categories-ctn" 
                        });
    });
    
    $(".close").click(function () {    $(".modal").modal('hide');  });
    
     {/JqueryScriptsReady}
 
</script>   
