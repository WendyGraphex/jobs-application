 <table cellpadding="0" cellspacing="0">
            <tr>
                <td>{__('url')}:</td>
                <td>
                    <div>{$form.pageI18n.url->getError()}</div>
                    <input class="pageI18n" type="text" name="url" value="{$pageI18n->getURL()}"/>
                    <span></span>
                </td>
            </tr>
            <tr>
                <td>{__('title')}:</td>
                <td>
                    <div>{$form.pageI18n.meta_title->getError()}</div>
                    <input class="pageI18n" type="text" name="meta_title" value="{$pageI18n->get('meta_title')}"/>
                </td>
            </tr>
            <tr>
                <td>{__('description')}:</td>
                <td><textarea class="pageI18n" name="meta_description" rows="5" cols="40">{$pageI18n->get('meta_description')}</textarea></td>
            </tr>
            <tr>
                <td>{__('keywords')}:</td>
                <td><textarea class="pageI18n" name="meta_keywords" rows="5" cols="40">{$pageI18n->get('meta_keywords')}</textarea></td>
            </tr> 
</table>