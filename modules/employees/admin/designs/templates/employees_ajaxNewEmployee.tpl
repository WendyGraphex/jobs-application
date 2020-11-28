  {messages}
            <fieldset>
            <div class="row" style="margin: 0;padding-bottom: 10px;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("New Freelancer")}</h3>
                </div>

                <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="New" class="btn btn-success admin-header-button">
                <i class="fa fa-save" style=" margin-right:10px;"></i>
            {__('Create')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                <i style="margin-right: 5px;" class="fa fa-times" style="margin-right:10px;"></i>
            {__('Cancel')}</a>
        </div>
        </div>
   
            </div>
  
            <div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
                width: 100%; text-align: left; margin-bottom: 15px;">
                <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Freelancer")}
                </p>
            </div>
            <div style="width: 100%; background-color: white; padding: 20px;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">
                <div class="row">
                    
                    <div class="col-md-2">         
                        <div>
                            <div class="form-group">
                                <label>{__('Avatar')}</label>                  
                                    <div id="pictureForm">                            
                                        <div class="custom-FileInput" id="DivLogo">
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-7">
                                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                                <input type='file' id="imgInp" hidden="" class="Employee Files" name="Employee[avatar]"/>
                                            </div>
                                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                                <div class="thumbnail media-lib-item parent">
                                                    <a href="#" class="list-action Mode" name="NORMAL" id="BtnInverse" style="display: none;"><i class="ModeIcon Normal far fa-square"></i></a>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                            </div>
                        </div>         
                    </div>
                    
                                                
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>{__("Gender")}{if $form->getValidator('gender')->getOption('required')}*{/if}</label>
                                    <div {if $form.gender->hasError()}class="ClassError"{/if}>{$form.gender->getError()}</div> 
                                    {foreach $form->getValidator('gender')->getOption('choices') as $name=>$gender}                                     
                                       <input type="radio"  class="Employee Input" name="gender" value="{$name}" checked="checked"> {$gender}
                                   {/foreach}
                                </div>
                            </div>
                                
                            <div class="col-sm-5">
                                <div class="form-group">
                                   <label>{__("First name")}{if $form->getValidator('firstname')->getOption('required')}*{/if}</label>
                                   <div {if $form.firstname->hasError()}class="ClassError"{/if}>{$form.firstname->getError()}</div> 
                                   <input type="text" class="Employee Input input-text form-control" name="firstname" value="{$item->get('firstname')|escape}" size="30"/>           
                                </div>
                            </div>
                            
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label>{__("Last name")}{if $form->getValidator('lastname')->getOption('required')}*{/if}</label>
                                    <div {if $form.lastname->hasError()}class="ClassError"{/if}>{$form.lastname->getError()}</div> 
                                    <input type="text" class="Employee Input input-text form-control" name="lastname" value="{$item->get('lastname')|escape}" size="30"/>
                                </div>
                            </div>
                        </div>
                                
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>{__("E-mail")}{if $form->getValidator('email')->getOption('required')}*{/if}</label>
                                    <div {if $form.email->hasError()}class="ClassError"{/if}>{$form.email->getError()}</div> 
                                    <input type="text" class="Employee Input input-text form-control" name="email" value="{$item->get('email')|escape}" size="30" /> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <div class="form-group">
                                        <label>{__("Birthday")}{if $form->birthday->getOption('required')}*{/if}</label>
                                        <div {if $form.birthday->hasError()}class="ClassError"{/if}>{$form.birthday->getError()}</div> 
                                        <input type="text" class="Employee Input input-text form-control" name="birthday" value="{$item->get('birthday')|escape}" size="30" /> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
                    
                                
                                
                                
                                
                                
                {*===================================================== Second Row =======================================================*}
            <div class="row"> 
                
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>{__("Addresse 1")}{if $form->getValidator('address1')->getOption('required')}*{/if}</label>
                        <div {if $form.address1->hasError()}class="ClassError"{/if}>{$form.address1->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="address1" value="{$item->get('address1')|escape}" size="30" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label>{__("Addresse 2")}{if $form->getValidator('address2')->getOption('required')}*{/if}</label>
                        <div {if $form.address2->hasError()}class="ClassError"{/if}>{$form.address2->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="address2" value="{$item->get('address2')|escape}" size="30" />
                    </div>
                </div>
            </div>       
{*===================================================== Third Row =======================================================*}     
            <div class="row">
                <div class="col-sm-3">
                     <div class="form-group">
                        <label>{__("Post code")}{if $form->getValidator('postcode')->getOption('required')}*{/if}</label>
                        <div {if $form.postcode->hasError()}class="ClassError"{/if}>{$form.postcode->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="postcode" value="{$item->get('postcode')|escape}" size="30" />
                     </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("City")}{if $form->getValidator('city')->getOption('required')}*{/if}</label>
                       <div {if $form.city->hasError()}class="ClassError"{/if}>{$form.city->getError()}</div> 
                       <input type="text" class="Employee Input input-text form-control" name="city" value="{$item->get('city')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("State")}{if $form->getValidator('state')->getOption('required')}*{/if}</label>
                       <div {if $form.state->hasError()}class="ClassError"{/if}>{$form.state->getError()}</div> 
                       <input type="text" class="Employee Input input-text form-control" name="state" value="{$item->get('state')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("Country")}{if $form->getValidator('country')->getOption('required')}*{/if}</label>
                       <div {if $form.country->hasError()}class="ClassError"{/if}>{$form.country->getError()}</div>
                       {select_country name="country" class="Employee form-control Fields Select" options=$form->country->getOption('choices') selected=$item->get('country')} 
                       {*<input type="text" class="Employee input-text form-control" name="country" value="{$item->get('country')|escape}" size="30"/>*}
                    </div>
               </div>
            </div>     
{*===================================================== Fourth Row =======================================================*}                     
            <div class="row">
                
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Phone")}{if $form->getValidator('phone')->getOption('required')}*{/if}</label>
                        <div {if $form.phone->hasError()}class="ClassError"{/if}>{$form.phone->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="phone" value="{$item->get('phone')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                   <div class="form-group">
                       <label>{__("Mobile")}{if $form->getValidator('mobile')->getOption('required')}*{/if}</label>
                       <div {if $form.mobile->hasError()}class="ClassError"{/if}>{$form.mobile->getError()}</div> 
                       <input type="text" class="Employee Input input-text form-control" name="mobile" value="{$item->get('mobile')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Fax")}{if $form->getValidator('fax')->getOption('required')}*{/if}</label>
                        <div {if $form.fax->hasError()}class="ClassError"{/if}>{$form.fax->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="fax" value="{$item->get('fax')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Web")}{if $form->getValidator('web')->getOption('required')}*{/if}</label>
                        <div {if $form.web->hasError()}class="ClassError"{/if}>{$form.web->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="web" value="{$item->get('web')|escape}" size="30" />
                    </div>
                </div>
                
            </div>                
 
     </div>
    
</fieldset>
 
<script type="text/javascript">
         
    $('#pictureAdd').click(function() {
        $('#imgInp').click();
     });
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result);
              $("#BtnInverse").show();
          };
          reader.readAsDataURL(this.files[0]);
        }        
    }); 
    
    
    $(".Mode").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $("#DivLogo").css('background-color','#37BC9B');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $("#DivLogo").css('background-color','');
            }
   });
         
         
    $("#New").click( function () {   

         var params= { Employee: {                                        
                        token :'{$form->getCSRFToken()}' 
                    } };
                    $(".Employee.Input").each(function() { params.Employee[this.name]=$(this).val(); });  
                    $(".Employee.Select").each(function() { params.Employee[this.name]=$(this).val(); });
                    $("input.Employee[type=radio]:checked").each(function() { params.Employee[this.name]=$(this).val(); });
                  
                  //if ($("[name=is_active]").length)
                       // params.Employee.is_active= $("[name=is_active]").is(":checked")?"YES":"NO";  
                //     alert("params="+params.toSource()); return ;    

            return $.ajax2({    
                data:params   , 
                files : ".Files",
                url: "{url_to('employees_ajax',['action'=>'NewEmployee'])}",               
                target: "#actions"
           });
         });
        
       $('#Cancel').click(function(){ return $.ajax2({ 
                        url:"{url_to('employees_ajax',['action'=>'ListPartialEmployee'])}" , 
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#actions"}); 
        });
          $("[name=birthday]").datepicker();
         
</script>