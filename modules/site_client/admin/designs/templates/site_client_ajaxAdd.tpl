<div class="row" style="margin: 0;padding-bottom: 10px;">
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("View Clients")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button">
                <i class="fa fa-save" style=" margin-right:10px;"></i>
                {__('Save')}</a>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Clients")}
    </p>
</div>
{alerts}

<div style="width: 100%; background-color: white; padding: 20px;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">
    <div class="row form"> 
        {foreach $form->clients->getChoices() as $code=>$language}    
            <div class="clients col-lg-1 col-md-3 col-xs-3" >
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="Clients Checkbox custom-control-input" id="{$code}" name="clients" {if $form->getClients()->in($language->getCode())}checked=""{/if} />
                    <label class="custom-control-label" for="{$code}">{$language->getCode()->getFormatted()->ucfirst()}</label>
                </div>
                {*<span>               
                <input type="checkbox" class="Clients Checkbox" id="{$code}" name="clients" {if $form->getClients()->in($language->getCode())}checked=""{/if} style="margin-right: 4px;float:left;"/>
                <label for="{$code}">{$language->getCode()->getFormatted()->ucfirst()}</label>
                </span>*}
            </div>      
        {/foreach}    
    </div>
</div>

<script type="text/javascript">

    {* =================== A C T I O N S ================================ *}
    $('#Cancel').click(function () {
        return $.ajax2({
            url: "{url_to('site_client_ajax',['action'=>'ListPartial'])}",
            target: "#actions"});
    });

    $('#Save').click(function () {
        var params = {
            SiteClient: {
                clients: [],
                token: '{$form->getCSRFToken()}'
            }};
        $(".Clients.Checkbox:checked").each(function () {
            params.SiteClient[$(this).attr('name')].push($(this).attr('id'));
        });
        //   alert("Params="+params.toSource());   return ;        
        return $.ajax2({
            data: params,
            url: "{url_to('site_client_ajax',['action'=>'Add'])}",
            target: "#actions"});
    });

</script>

