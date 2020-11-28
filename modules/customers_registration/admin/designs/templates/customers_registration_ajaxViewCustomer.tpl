<fieldset>
    <div class="row" style="margin: 0;padding-bottom: 10px;">
        <div class="col-sm-6 site-applications-header" style="padding: 0;">
            <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("View Customer")}</h3>
        </div>

        <div class="col-sm" style="padding: 0;">
            <div style="float: right;">
                <a href="#" id="Save" class="btn btn-success admin-header-button" style="display: none;">
                    <i class="fa fa-save" style="margin-right:10px;"></i>
                    {__('save')}</a>
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
            <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Registration")}
        </p>
    </div>
    {alerts}
    {if $item->isLoaded()} 
        <div style="width: 100%; background-color: white; padding: 20px;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">   
            {*===================================================== Second Row =======================================================*}
            <div class="row"> 
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>{__("First name")}{if $form->getValidator('firstname')->getOption('required')}*{/if}</label>
                        <div {if $form.firstname->hasError()}class="ClassError"{/if}>{$form.firstname->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="firstname" value="{$item->get('firstname')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>{__("Last name")}{if $form->getValidator('lastname')->getOption('required')}*{/if}</label>
                        <div {if $form.lastname->hasError()}class="ClassError"{/if}>{$form.lastname->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="lastname" value="{$item->get('lastname')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>{__("Phone")}{if $form->getValidator('phone')->getOption('required')}*{/if}</label>
                        <div {if $form.phone->hasError()}class="ClassError"{/if}>{$form.phone->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="phone" value="{$item->get('phone')|escape}" size="30" />
                    </div>
                </div>
            </div>       
            {*===================================================== Third Row =======================================================*}     
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Email")}{if $form->getValidator('email')->getOption('required')}*{/if}</label>
                        <div {if $form.email->hasError()}class="ClassError"{/if}>{$form.email->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="email" value="{$item->get('email')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Race")}{if $form->getValidator('race')->getOption('required')}*{/if}</label>
                        <div {if $form.race->hasError()}class="ClassError"{/if}>{$form.race->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="state" value="{$item->get('race')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Attending")}{if $form->getValidator('attending')->getOption('required')}*{/if}</label>
                        <div {if $form.attending->hasError()}class="ClassError"{/if}>{$form.attending->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="state" value="{$item->get('attending')|escape}" size="30" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>{__("Level")}{if $form->getValidator('level')->getOption('required')}*{/if}</label>
                        <div {if $form.level->hasError()}class="ClassError"{/if}>{$form.level->getError()}</div> 
                        <input type="text" class="Customer Input input-text form-control" name="state" value="{$item->get('level')|escape}" size="30" />
                    </div>
                </div>
            </div>     
            {*===================================================== Fourth Row =======================================================*}                                   
        </div>
    {else}
        <span>{__("This employee is invalid.")}</span> 
    {/if}
</fieldset>
<script type="text/javascript">

    $('#Cancel').click(function(){ return $.ajax2({ 
        url: "{url_to('customers_registration_ajax',['action'=>'ListPartialRegistration'])}",                    
        target: "#actions" });
    });

    $(".Customer").click(function() { $("#Save").show(); });

    $('#Save').click(function(){                              
        var  params= {            
                    Customer: {   
                       id: "{$item->get('id')}",
                       token :'{$form->getCSRFToken()}'
                    } };        
        $(".Customer.Input").each(function() { params.Customer[this.name]=$(this).val(); });
        $("input.Customer[type=radio]:checked").each(function() { params.Customer[this.name]=$(this).val(); });
          return $.ajax2({ data : params, 
                          files :'.Files',
                          url: "{url_to('customers_registration_ajax',['action'=>'SaveCustomer'])}",
                          target: "#actions" }); 

       });
 
</script>


