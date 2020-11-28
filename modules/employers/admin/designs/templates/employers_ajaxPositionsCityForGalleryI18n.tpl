<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Employer City Galleries")}</h3>
        <h3 class="admin-header-small-text">{__("Employer City galleries Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">                               
              <a href="#" id="Save" class="btn btn-success admin-header-button"><i style="margin-right: 5px;" class="fa fa-save"></i>{__('Save')}</a>
              <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i style="margin-right: 5px;" class="fa fa-times"></i>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employer City Galleries')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Gallery %s',(string)$item_i18n)}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Cities')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Positions')}        
    </p>
</div>
{alerts}
{if $item_i18n->getGallery()->isLoaded()}
<div class="row">

    <div class="col-12">
        <div class="card">
            <div class="card-content collapse show">
                <div class="card-body">
                  
                        <table id="EmployerCityGalleryCity" cellpadding="0" cellspacing="0" class="table  table-striped">
                            <thead>
                                <tr>
                                    <th width="10px"></th>
                                    <th>{__('Position')}</th>                                   
                                    <th>{__('Title')}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach $item_i18n->getGalleryCities() as $item}
                                <tr id="{$item->get('id')}" class="ui-state-default Cities">
                                    <td><i class="fa fa-arrows-alt"></i></td>
                                    <td class="position">{$item->get('position')}</td>                                   
                                    <td>
                                        <div class="pull-left">{$item->getCity()->getI18n()}</div>
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

    $("#EmployerCityGalleryCity tbody").sortable({
        cursor: 'move',
        start: function (event, ui) {  $(ui.item).addClass('selected');  },
        stop: function (event, ui) {
            $(".position").each(function (id) {  $(this).html(id + 1); });              
        }
    });

    $('#Save').click(function () {
        var params = {
            EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
            EmployerCityGalleryCityPositions: {
                positions: [],
                token: '{$form->getCSRFToken()}'
            }
        };
        $(".Cities").each(function () { params.EmployerCityGalleryCityPositions.positions.push($(this).attr('id')); });
        // alert("Params="+params.toSource());   return ;
        return $.ajax2({
            data: params,
            url: "{url_to('employers_ajax',['action'=>'PositionsCityForGalleryI18n'])}",
            target: "#actions"
        });
    });

    {* =====================  A C T I O N S ===============================  *}

    $("#Cancel").click(function () {
        return $.ajax2({
            data : { EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' } },
            url: "{url_to('employers_ajax',['action'=>'ListPartialCityForGalleryI18n'])}",
            target: "#actions"
        });
    });

</script> 
{else}
    {__('Gallery is invalid.')}
{/if}  




