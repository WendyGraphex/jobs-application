
            <fieldset>
            <div class="row" style="margin: 0;padding-bottom: 10px;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("View Freelancer")}</h3>
                </div>

                <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button">
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
                    {alerts}
{if $item->isLoaded()} 
  <div style="width: 100%; background-color: white; padding: 20px;pointer-events: none;opacity: 0.5;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">
                <div class="row">
                    
                    <div class="col-md-2">         
                        <div>
                            <div class="form-group">
                                <label>{__('Avatar')}</label>                  
                                    <div id="pictureForm">                            
                                        <div class="custom-FileInput" id="DivLogo">
                                            {if $item->hasAvatar()}
                                                <img id="blah" alt="" src="{$item->getAvatar()->getURL('superadmin')}"{*/if*} /><br/>
                                                {else}
                                                    <img id="blah" alt="" style="display: none;" /><br/>
                                            {/if}
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-7">
                                                <a id="pictureAdd" href="#" class="btn btn-default" style="color: #6c757d;opacity: 1;cursor: default;"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                                <input type='file' id="imgInp" hidden="" class="Employee Files" name="Employee[avatar]"/>
                                            </div>
                                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                                <div class="thumbnail media-lib-item parent">
                                                    <a href="#" class="list-action Mode" name="NORMAL" id="BtnInverse"><i class="ModeIcon Normal far fa-square"></i></a>
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
                                    <label>{__("Gender")}</label>
                                    {foreach $form->getValidator('gender')->getOption('choices') as $name=>$gender}                                     
                                       <input type="radio"  class="Employee Input" name="gender" value="{$name}" checked="checked"> {$gender}
                                   {/foreach}
                                </div>
                            </div>
                                
                            <div class="col-sm-5">
                                <div class="form-group">
                                   <label>{__("First name")}{if $form->getValidator('firstname')->getOption('required')}*{/if}</label>
                                   <input type="text" class="Employee Input input-text form-control" name="firstname" readonly value="{$item->get('firstname')|escape}" size="30"/>           
                                </div>
                            </div>
                            
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label>{__("Last name")}{if $form->getValidator('lastname')->getOption('required')}*{/if}</label>
                                    <input type="text" class="Employee Input input-text form-control" name="lastname" readonly value="{$item->get('lastname')|escape}" size="30"/>
                                </div>
                            </div>
                        </div>
                                
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>{__("E-mail")}{if $form->getValidator('email')->getOption('required')}*{/if}</label>
                                    <input type="text" class="Employee Input input-text form-control" name="email" readonly value="{$item->get('email')|escape}" size="30" /> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                 <div class="form-group">
                                        <label>{__("Birthday")}{if $form->birthday->getOption('required')}*{/if}</label>
                                        <input type="text" class="Employee Input input-text form-control" name="birthday" readonly value="{$item->get('birthday')|escape}" size="30" /> 
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
                        <input type="text" class="Employee Input input-text form-control" name="address1" readonly value="{$item->get('address1')|escape}" size="30" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group">
                        <label>{__("Addresse 2")}{if $form->getValidator('address2')->getOption('required')}*{/if}</label>
                        <input type="text" class="Employee Input input-text form-control" name="address2" readonly value="{$item->get('address2')|escape}" size="30" />
                    </div>
                </div>
            </div>       
{*===================================================== Third Row =======================================================*}     
            <div class="row">
                <div class="col-sm-3">
                     <div class="form-group">
                        <label>{__("Post code")}{if $form->getValidator('postcode')->getOption('required')}*{/if}</label>
                        <input type="text" class="Employee Input input-text form-control" name="postcode" readonly value="{$item->get('postcode')|escape}" size="30" />
                     </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("City")}{if $form->getValidator('city')->getOption('required')}*{/if}</label>
                       <input type="text" class="Employee Input input-text form-control" name="city" readonly value="{$item->get('city')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("State")}{if $form->getValidator('state')->getOption('required')}*{/if}</label>
                       <input type="text" class="Employee Input input-text form-control" name="state" readonly value="{$item->get('state')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                       <label>{__("Country")}{if $form->getValidator('country')->getOption('required')}*{/if}</label>
                       {*select_country name="country" class="Employee form-control Fields Select" options=$form->country->getOption('choices') selected=$item->get('country')*} 
                       <input type="text" class="Employee input-text form-control" name="country" readonly value="{$item->getFormatter()->getCountry()->getFormatted()->ucfirst()}" size="30"/>
                    </div>
               </div>
            </div>     
{*===================================================== Fourth Row =======================================================*}                     
            <div class="row">
                
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Phone")}{if $form->getValidator('phone')->getOption('required')}*{/if}</label>
                        <div {if $form.phone->hasError()}class="ClassError"{/if}>{$form.phone->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="phone" readonly value="{$item->get('phone')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                   <div class="form-group">
                       <label>{__("Mobile")}{if $form->getValidator('mobile')->getOption('required')}*{/if}</label>
                       <div {if $form.mobile->hasError()}class="ClassError"{/if}>{$form.mobile->getError()}</div> 
                       <input type="text" class="Employee Input input-text form-control" name="mobile" readonly value="{$item->get('mobile')|escape}" size="30" />
                   </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Fax")}{if $form->getValidator('fax')->getOption('required')}*{/if}</label>
                        <div {if $form.fax->hasError()}class="ClassError"{/if}>{$form.fax->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="fax" readonly value="{$item->get('fax')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Web")}{if $form->getValidator('web')->getOption('required')}*{/if}</label>
                        <div {if $form.web->hasError()}class="ClassError"{/if}>{$form.web->getError()}</div> 
                        <input type="text" class="Employee Input input-text form-control" name="web" readonly value="{$item->get('web')|escape}" size="30" />
                    </div>
                </div>
                
            </div>                
 
     </div>
{else}
    <span>{__("This employee is invalid.")}</span> 

{/if}
    </fieldset>
<script type="text/javascript">
    
    
     {*$('#pictureAdd').click(function() {
        $('#imgInp').click();
     });
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });*}
    
    
    
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
    

         $('#Cancel').click(function(){ return $.ajax2({ 
                    url: "{url_to('employees_ajax',['action'=>'ListPartialEmployee'])}",                    
                    target: "#actions" });
         });
         
         $(".Employee").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){                              
          var  params= {            
                                Employee: {   
                                   id: "{$item->get('id')}",
                                   token :'{$form->getCSRFToken()}'
                                } };        
          $(".Employee.Input").each(function() { params.Employee[this.name]=$(this).val(); });
          $("input.Employee[type=radio]:checked").each(function() { params.Employee[this.name]=$(this).val(); });
            return $.ajax2({ data : params, 
                            files :'.Files',
                            url: "{url_to('employees_ajax',['action'=>'SaveEmployee'])}",
                            target: "#actions" }); 
                          
         });
             
          
          
</script>


