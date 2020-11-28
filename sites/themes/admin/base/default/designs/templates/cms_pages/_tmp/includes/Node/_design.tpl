<table cellpadding="0" cellspacing="0">
    <tr style="height: 60px;">
        <td style="width: 150px;">{__('layout')}:</td>
                <td>
                     <div></div>
                     <input class="PageI18n Input form-control" type="text" name="layout" size="10" value="{$node_i18n->getPageI18n()->get('layout')|escape}"/>
                     <span></span>
                </td>
            </tr>
            <tr style="height: 60px;">
                <td style="width: 150px;">{__('template')}:</td>
                <td>
                    <div></div>
                    <input class="PageI18n Input form-control" type="text" name="template" size="10" value="{$node_i18n->getPageI18n()->get('template')|escape}"/>
                    <span></span>
                </td>
            </tr>
        </table>