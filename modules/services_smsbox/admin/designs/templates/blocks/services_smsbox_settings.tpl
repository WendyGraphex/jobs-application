<fieldset class="form-control col-12  h-auto" >
    <legend class="setting-legend"><h4>{__('SMS box')}</h4></legend>       
    <div class="form-group row">
        <label for="smsbox_login" class="col-sm-4 col-form-label">{__("Login")}{if $form->smsbox_login->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_login->getError()}</div>
            <input id="smsbox_login" type="text" class="Settings Input form-control" name="smsbox_login" value="{$settings->get('smsbox_login')|escape}" size="30"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="smsbox_pass" class="col-sm-4 col-form-label">{__("Pass")}{if $form->smsbox_pass->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_pass->getError()}</div>
            <input id="smsbox_pass" type="text" class="Settings Input form-control" name="smsbox_pass" value="{$settings->get('smsbox_pass')|escape}" size="30"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="smsbox_origine" class="col-sm-4 col-form-label">{__("Origine")}{if $form->smsbox_origine->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_origine->getError()}</div>
            <input id="smsbox_origine" type="text" class="Settings Input form-control" name="smsbox_origine" value="{$settings->get('smsbox_origine')|escape}" size="30"/>
        </div>
    </div>

    <div class="form-group row">
        <label for="smsbox_mode" class="col-sm-4 col-form-label">{__("Mode")}{if $form->smsbox_mode->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_mode->getError()}</div>
            {html_options options=$form->smsbox_mode->getChoices() id="smsbox_mode" class="Settings Select form-control" name="smsbox_mode" selected=$settings->get('smsbox_mode')}
        </div>
    </div>


    <div class="form-group row">
        <label for="smsbox_typ" class="col-sm-4 col-form-label">{__("Type")}{if $form->smsbox_type->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_type->getError()}</div>
            {html_options options=$form->smsbox_type->getChoices() id="smsbox_type" class="Settings Select form-control" name="smsbox_type" selected=$settings->get('smsbox_type')}
        </div>
    </div>

    <div class="form-group row">
        <label for="smsbox_strategy" class="col-sm-4 col-form-label">{__("Strategy")}{if $form->smsbox_strategy->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_strategy->getError()}</div>
            {html_options options=$form->smsbox_strategy->getChoices() id="smsbox_strategy" class="Settings Select form-control" name="smsbox_strategy" selected=$settings->get('smsbox_strategy')}
        </div>
    </div>

    <div class="form-group row">
        <label for="smsbox_debug" class="col-sm-4 col-form-label">{__("Debug")}{if $form->smsbox_debug->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_debug->getError()}</div>
            {html_options options=$form->smsbox_debug->getChoices() id="smsbox_debug" class="Settings Select form-control" name="smsbox_debug" selected=$settings->get('smsbox_debug')}
        </div>
    </div>
         <div class="form-group row">
        <label for="smsbox_version" class="col-sm-4 col-form-label">{__("Version")}{if $form->smsbox_version->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_version->getError()}</div>
            {html_options options=$form->smsbox_version->getChoices() id="smsbox_version" class="Settings Select form-control" name="smsbox_version" selected=$settings->get('smsbox_version')}
        </div>
    </div>
 <div class="form-group row">
        <label for="smsbox_callback" class="col-sm-4 col-form-label">{__("Callback")}{if $form->smsbox_callback->getOption('required')}*{/if}</label>
        <div class="col-8">
            <div class="error-form">{$form.smsbox_callback->getError()}</div>
            {html_options options=$form->smsbox_callback->getChoices() id="smsbox_callback" class="Settings Select form-control" name="smsbox_callback" selected=$settings->get('smsbox_callback')}
        </div>
    </div>

</fieldset>
