{messages}
<h3>{__("View group")}</h3>
<div>
    <a href="#" id="Save" class="btn btn-primary" style="display:none">
        <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
        {__('Save')}</a>
    <a href="#" id="Cancel" class="btn btn-primary">
        <i class="fa fa-times" style="margin-right:10px;"></i>
        {__('Cancel')}</a>
</div>
{if $item_i18n->getGroup()->isLoaded()}
    <table class="tab-form" cellpadding="0" cellspacing="0">
        <tr class="full-with">
            <td></td>
            <td>
                <img id="{$item_i18n->get('lang')}" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}"
                     title="{format_country($item_i18n->get('lang'))}"/>
            </td>
        </tr>
        <tr class="full-with">
            <td class="label"><span>{__("Title")}</span></td>
            <td>
                <div id="error_pages" class="error-form">{$form.group_i18n.title->getError()}</div>
                <input status="text" size="40" class="GroupI18n Fields" name="title"
                       value="{$item_i18n->get('title')}"/>
                {if $form->group_i18n.title->getOption('required')}*{/if}
            </td>
        </tr>
        <tr class="full-with">
            <td class="label"><span>{__("Name")}</span></td>
            <td>
                <div id="error_pages" class="error-form">{$form.group.name->getError()}</div>
                <input status="text" size="40" class="Group Fields" name="name"
                       value="{$item_i18n->getGroup()->get('name')}"/>
                {if $form->group.name->getOption('required')}*{/if}
            </td>
        </tr>
    </table>
{else}
    {__('Group is invalid.')}
{/if}

<script type="text/javascript">

    {* =================== F I E L D S ================================ *}
    $(".Fields").click(function () {
        $('#Save').show();
    });

    $(".Fields").change(function () {
        $('#Save').show();
    });

    {* =================== L A N G U A G E ================================ *}
    $("#PartnerVehicle-ChangeLang").click(function () {
        $("#Save").show();
        $("#dialogListLanguages").dialog("open");
    });

    $("#dialogListLanguages").bind('select', function (event) {
        $(".ParcelStatusI18n[name=lang]").attr({
            id: event.selected.id,
            src: '{url("/flags/","picture")}' + event.selected.id + '.png',
            title: event.selected.lang
        });
    });


    {* =================== A C T I O N S ================================ *}
    $('#Cancel').click(function () {
        $(".dialogs").dialog("destroy").remove();
        return $.ajax2({
            data: {filter: {lang: '{$item_i18n->get('lang')}', token: "{mfForm::getToken('GroupsFormFilter')}"}},
            url: "{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}",
            target: "#actions"
        });
    });

    $('#Save').click(function () {
        var params = {
            GroupI18n: {
                group_i18n: {
                    lang: "{$item_i18n->get('lang')}",
                    group_id: "{$item_i18n->get('group_id')}"
                },
                group: { },
                token: '{$form->getCSRFToken()}'
            }
        };
        $("input.GroupI18n").each(function () {
            params.GroupI18n.group_i18n[this.name] = $(this).val();
        });
        $("input.Group").each(function () {
            params.GroupI18n.group[this.name] = $(this).val();
        });  // Get foreign key
        //      alert("Params="+params.toSource());   return ;
        $(".dialogs").dialog("destroy").remove();
        return $.ajax2({
            data: params,
            url: "{url_to('users_guard_ajax',['action'=>'SaveGroupI18n'])}",
            target: "#actions"
        });
    });

</script>
