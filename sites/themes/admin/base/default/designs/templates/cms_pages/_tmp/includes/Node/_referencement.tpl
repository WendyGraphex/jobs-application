 <table cellpadding="0" cellspacing="0">
     <tr style="height: 60px">
         <td style="width:150px;">{__('Url')}:</td>
                <td>
                    <div>{$form.page_i18n.url->getError()}</div>
                    <input class="PageI18n Input form-control" type="text" name="url" value="{$node_i18n->getPageI18n()->getURL()}"/>
                    <span></span>
                </td>
            </tr>
            <tr style="height: 60px">
                <td style="width:150px;">{__('Title')}:</td>
                <td>
                    <div>{$form.page_i18n.meta_title->getError()}</div>
                    <input class="PageI18n Input form-control" type="text" name="meta_title" value="{$node_i18n->getPageI18n()->get('meta_title')}"/>
                </td>
            </tr>
            <tr style="height: 60px">
                <td style="width:150px;">{__('Description')}:</td>
                <td><textarea class="PageI18n Input form-control" name="meta_description" rows="5" cols="40">{$node_i18n->getPageI18n()->get('meta_description')}</textarea></td>
            </tr>
            <tr style="height: 60px">
                <td style="width:150px;">{__('Keywords')}:</td>
                <td><textarea class="PageI18n Input form-control" name="meta_keywords" rows="5" cols="40">{$node_i18n->getPageI18n()->get('meta_keywords')}</textarea></td>
            </tr> 
</table>