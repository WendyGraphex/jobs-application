{alerts}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Site')}</h3> 
        <h3 class="admin-header-small-text">{__("Menu management")}</h3> 
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">               
              <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i style="margin-right: 5px;" class="fa fa-times"></i>{__('Cancel')}</a>
        </div>
   </div>
</div>
            
<div class="breadcrumb-title">
    <p>
         <i class="fa fa-home" style="color: #37bc9b;"></i>         
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CMS pages')}          
        <a href="#" id="Pages"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Pages')}</a>
        <a href="#" id="Menus"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Menus')}</a>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Positions')}
    </p>
</div>
{if $item_i18n->getMenu()->isLoaded()}    

<div class="row">

    <div class="col-12">
        <div class="card">
            <div class="card-content collapse show">
                <div class="card-body">
                  
                        <table id="Menus" cellpadding="0" cellspacing="0" class="table  table-striped">
                            <thead>
                                <tr>
                                    <th width="10px"></th> 
                                    <th>{__('Position')}</th>
                                    <th>{__('Name/Title')}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach $item_i18n->getMenu()->getChildren() as $menu}
                                <tr id="{$menu->get('id')}" class="ui-state-default Menus">
                                    <td><i class="fa fa-arrows-alt"></i></td>                                    
                                    <td class="position">{$menu@iteration}</td> 
                                    <td>
                                        <div class="pull-left">
                                            [{$menu->get('name')}]
                                           {if $menu->hasI18n()} 
                                              {$menu->getI18n()}                                             
                                           {/if}    
                                       </div> 
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>

                 
                </div>
            </div>
        </div>
    </div>
     
</div>

<script type="text/javascript">
     $("#Menus tbody").sortable({
        cursor: 'move',
        start: function (event, ui) {
            $(ui.item).addClass('selected');
        },
        stop: function (event, ui) {
            $(".position").each(function (id) {  $(this).html(id + 1); });     
            var params = {
                        CmsMenuPositions: {
                            node : ui.item.attr('id'),
                            sibling_id : ui.item.next().attr('id'),
                            token: '{mfForm::getToken('CmsMenuMoveForm')}'
                        }
               };
            $.ajax2({
            data: params,
            url: "{url_to('cms_pages_ajax',['action'=>'MoveMenu'])}"         
        });
        },
        helper: function(e, tr)
        {
            var $originals = tr.children();
            var $helper = tr.clone();
            $helper.children().each(function(index)
            {
              $(this).width($originals.eq(index).width());
            });
            return $helper;
        },
    });
     
   

    $("#Cancel").click(function () {
        return $.ajax2({
            data : { CmsMenuNode : { node: '{$item_i18n->getMenu()->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CmsMenuNodeForm')}' } },                                
            url: "{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
            target: "#actions"
        });
    });

  
     $("#Pages").click(function () {                     
                return $.ajax2({  url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}",
                                 target: "#actions"
                });
        });
        
     $("#Menus").click(function () {                     
                return $.ajax2({  url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
                                 target: "#actions"
                });
        });
</script> 



{else}
    {__('Menu is invalid.')}
{/if}    
