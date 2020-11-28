{alerts}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Types')}</h3> 
        <h3 class="admin-header-small-text">{__("Type management: Positions")}</h3> 
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Types')}
    </p>
</div>
    

<div class="row">

    <div class="col-12">
        <div class="card">
            <div class="card-content collapse show">
                <div class="card-body">
                  
                        <table id="Types" cellpadding="0" cellspacing="0" class="table  table-striped">
                            <thead>
                                <tr>
                                    <th width="10px"></th>
                                    <th>{__('Position')}</th>
                                    <th>{__('Title')}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach $form->getOrdered() as $type}
                                <tr id="{$type->get('id')}" class="ui-type-default Types">
                                    <td><i class="fa fa-arrows-alt"></i></td>
                                    <td class="position">{$type->get('position')}</td>
                                    <td>
                                        <div class="pull-left">{$type->getI18n()}</div>
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

    $("#Types tbody").sortable({
        cursor: 'move',
        start: function (event, ui) {
            $(ui.item).addClass('selected');
        },
        stop: function (event, ui) {
            $(".position").each(function (id) {
                $(this).html(id + 1);
            });  // renumbering
            $("#Save").show();
        }
    });

    $('#Save').click(function () {
        var params = {
            CustomerClaimTypePositions: {
                positions: [],
                token: '{$form->getCSRFToken()}'
            }
        };
        $(".Types").each(function () {
            params.CustomerClaimTypePositions.positions.push($(this).attr('id'));
        });
        // alert("Params="+params.toSource());   return ;
        return $.ajax2({
            data: params,
            url: "{url_to('customers_ajax',['action'=>'PositionsType'])}",
            target: "#actions"
        });
    });

    {*    {* =====================  A C T I O N S ===============================  *}

    $("#Cancel").click(function () {
        return $.ajax2({
            url: "{url_to('customers_ajax',['action'=>'ListPartialType'])}",
            target: "#actions"
        });
    });

</script> 



