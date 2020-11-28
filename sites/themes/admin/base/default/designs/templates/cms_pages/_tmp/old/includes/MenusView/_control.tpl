<table cellpadding="0" cellspacing="0">
    <tr>
        <td>{__('page_i18n id')}:</td>
        <td>{$pageI18n->get('id')}</td>
    </tr>
    <tr>
        <td>{__('name')}:</td>
        <td>
            <div>{$form.page.name->getError()}</div>
            <input class="page" type="text" id="{$page->get('id')}" name="name" size="10" value="{$page->get('name')|escape}"/>
            <span></span>
        </td>
    </tr>
    <tr>
        <td>{__('cache')}:</td>
        <td><input class="pageI18n" type="checkbox" name="is_cached"  id="{$pageI18n->get('id')}" value="{$pageI18n->get('is_cached')|escape}" {if $pageI18n->get('is_cached')=='YES'}checked='checked'{/if}/></td>
    </tr> 
    <tr>
        <td>{__('in menu')}:</td>
        <td><input class="pageI18n" type="checkbox" name="in_menu"  id="{$pageI18n->get('in_menu')}" value="{$pageI18n->get('in_menu')|escape}" {if $pageI18n->get('in_menu')=='YES'}checked='checked'{/if}/></td>
    </tr>
    <tr>
        <td>{__('start at')}:</td>
        <td>
            <div>{$form.pageI18n.start_at->getError()}</div>
            <input id="last_time_from" class="pageI18n" type="text" name="start_at" size="10" value="{if $form->hasErrors()}{else}{$pageI18n->get('start_at')}{format_date($pageI18n->get('start_at'),'a')}{/if}"/>
        </td>
    </tr>
    <tr>
        <td>{__('expired at')}:</td>
        <td>
            <div>{$form.pageI18n.expired_at->getError()}</div>
            <input class="pageI18n" id="last_time_to" type="text" name="expired_at" size="10" value="{format_date($pageI18n->get('expired_at'),'a')}"/>
        </td>
    </tr>
    <tr>
        <td>{__('created at')}:</td>
        <td>{$pageI18n->get('created_at')}</td>
    </tr>
    <tr>
        <td>{__('updated at')}:</td>
        <td><span id="updated_at">{$pageI18n->get('updated_at')}</span></td>
    </tr>
</table> 