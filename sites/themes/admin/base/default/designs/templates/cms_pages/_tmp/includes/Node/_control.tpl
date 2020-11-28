<table cellpadding="0" cellspacing="0">  
    <tr style="height: 60px;">
        <td style="width:150px;">{__('Name')}:</td>
        <td>
            <div>{$form.page.name->getError()}</div>
            <input class="Page Input form-control" type="text" id="{$node_i18n->getCmsMenu()->getCmsPage()->get('id')}" name="name" size="10" value="{$node_i18n->getCmsMenu()->getCmsPage()->get('name')}"/>
            <span></span>
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="width:150px;">{__('Cache')}:</td>
        <td><input class="PageI18n Checkbox form-control" type="checkbox" name="is_cached"  id="{$node_i18n->getPageI18n()->get('id')}" value="{$node_i18n->getPageI18n()->get('is_cached')|escape}" {if $node_i18n->getPageI18n()->get('is_cached')=='YES'}checked='checked'{/if}/></td>
    </tr> 
    <tr style="height: 60px;">
        <td style="width:150px;">{__('In menu')}:</td>
        <td><input class="PageI18n Checkbox form-control" type="checkbox" name="in_menu"  id="{$node_i18n->getPageI18n()->get('in_menu')}" value="{$node_i18n->getPageI18n()->get('in_menu')|escape}" {if $node_i18n->getPageI18n()->get('in_menu')=='YES'}checked='checked'{/if}/></td>
    </tr>
    <tr style="height: 60px;">
        <td style="width:150px;">{__('Start at')}:</td>
        <td>
            <div>{$form.page_i18n.start_at->getError()}</div>
            <input id="last_time_from" class="PageI18n Input form-control" type="text" name="start_at" size="10" value="{if $form->hasErrors()}{$node_i18n->getPageI18n()->get('start_at')}{else}{format_date($node_i18n->getPageI18n()->get('start_at'),'a')}{/if}"/>
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="width:150px;">{__('expired at')}:</td>
        <td>
            <div>{$form.page_i18n.expired_at->getError()}</div>
            <input class="PageI18n Input form-control" id="last_time_to" type="text" name="expired_at" size="10" value="{if $form->hasErrors()}{$node_i18n->getPageI18n()->get('expired_at')}{else}{format_date($node_i18n->getPageI18n()->get('expired_at'),'a')}{/if}"/>
        </td>
    </tr>   
</table> 