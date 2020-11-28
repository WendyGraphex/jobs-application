<table cellpadding="0" cellspacing="0">
    <tr style="height: 60px;">
        <td style="width: 150px;">{__('Name')}:</td>
        <td><input class="Menu Input form-control" name="name"  type="text" value="{$node_i18n->getCmsMenu()->get('name')}"/></td>
    </tr>
    <tr style="height: 60px;">
        <td>{__('Target')}:</td>
        <td>
           <div></div>  
           {html_options class="MenuI18n Select" name="target" options=$form->menu_i18n.target->getOption('choices') selected=$node_i18n->get('target')}    
        </td>
    </tr>   
    <tr style="height: 60px;">
        <td>{__('Is link')}:</td>
        <td>
           <div></div>  
           <input class="MenuI18n Checkbox form-control" type="checkbox" name="is_link"  id="{$node_i18n->get('is_link')}" value="{$node_i18n->get('is_link')}" {if $node_i18n->get('is_link')=='YES'}checked='checked'{/if}/>
        </td>
    </tr>   
 {*   <tr>
            <td>{__('picture')}:</td>
            <td>
                <span id="pictureFilename">{if $menuI18n->get("picture")}[{$menuI18n->get('picture')}]{/if}</span>
                <img height="128" width="128" id="pictureImg" {if $menuI18n->get("picture")}src='{$menuI18n->getPicture()->getUrl()}?{time()}' alt="{__('my picture')}"{else}style="display:none"{/if}/>                 
                <a id="pictureDelete" href="#" {if !$menuI18n->get("picture")}style="display:none"{/if}><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/></a>
                <div>
                     <a id="pictureChange" href="#" {if !$menuI18n->get("picture")}style="display:none"{/if}><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change picture')|capitalize}</a>
                     <a id="pictureAdd" href="#" {if $menuI18n->get("picture")}style="display:none"{/if}><img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>{__('add picture')|capitalize}</a> 
                </div>
                <div id="error_picture">{$form.menuI18n.picture->getError()}</div>
                <div id="pictureForm" style="display:none">                     
                  {if $menuI18n->isLoaded()} 
                      <input id="pictureFile" type="file" name="menuI18n[picture]"/> 
                      <a href="#" id="pictureUpload"><img src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                      <img id="pictureLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                  {else}
                      <input class="files" id="pictureFile" type="file" name="MenuPage[menuI18n][picture]"/>  
                  {/if}    
                </div>    
            </td>
        </tr>
         <tr>
            <td>{__('icon')}:</td>
            <td>
                <span id="iconFilename">{if $menuI18n->get("icon")}[{$menuI18n->get('icon')}]{/if}</span>
                <img id="iconImg" {if $menuI18n->get("icon")}src='{$menuI18n->getIcon()->getUrl()}' alt="{__('my picture')}"{else}style="display:none"{/if}/> 
                <a id="iconDelete" href="#" {if !$menuI18n->get("icon")}style="display:none"{/if}><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/></a>
                <div>
                     <a id="iconChange" href="#" {if !$menuI18n->get("icon")}style="display:none"{/if}><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change icon')|capitalize}</a>
                     <a id="iconAdd" href="#" {if $menuI18n->get("icon")}style="display:none"{/if}><img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>{__('add icon')|capitalize}</a> 
                </div>
                <div id="error_icon">{$form.menuI18n.icon->getError()}</div>
                 <div id="iconForm" style="display:none">                     
                      {if $menuI18n->isLoaded()} 
                        <input id="iconFile" type="file" name="menuI18n[icon]"/> 
                        <a href="#" id="iconUpload"><img src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                        <img id="iconLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                      {else}
                           <input class="files" id="iconFile" type="file" name="MenuPage[menuI18n][icon]"/>  
                      {/if}  
                </div>   
            </td>
        </tr>*}
</table>