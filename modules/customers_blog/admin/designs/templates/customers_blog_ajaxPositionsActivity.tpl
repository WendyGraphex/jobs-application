{alerts}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('PartnerWorks')}</h3> 
        <h3 class="admin-header-small-text">{__("Categoriy management")}</h3> 
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
              {* <a href="#" id="Save" class="btn btn-success admin-header-button"><i style="margin-right: 5px;" class="fa fa-save"></i>{__('Save')}</a> *}
              <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i style="margin-right: 5px;" class="fa fa-times"></i>{__('Cancel')}</a>
        </div>
   </div>
</div>
            
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>        
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Activities')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Positions')}
    </p>
</div>
{if $item_i18n->getActivity()->isLoaded()}    

<div class="row">

    <div class="col-12">
        <div class="card">
            <div class="card-content collapse show">
                <div class="card-body">
                  
                        <table id="Activities" cellpadding="0" cellspacing="0" class="table  table-striped">
                            <thead>
                                <tr>
                                    <th width="10px"></th> 
                                    <th>{__('Position')}</th>
                                    <th>{__('Title')}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach $item_i18n->getActivity()->getChildren() as $activity}
                                <tr id="{$activity->get('id')}" class="ui-state-default Activities">
                                    <td><i class="fa fa-arrows-alt"></i></td>                                    
                                    <td>{$activity@iteration}</td> 
                                    <td>
                                        <div class="pull-left">
                                            {* [{$activity->get('id')}]*}
                                            {$activity->getI18n()} {* [{$activity->get('lb')}] - [{$activity->get('rb')}] *}
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
     $("#Activities tbody").sortable({
        cursor: 'move',
        start: function (event, ui) {
            $(ui.item).addClass('selected');
        },
        stop: function (event, ui) {
            $(".position").each(function (id) {  $(this).html(id + 1); });     
            var params = {
                        CustomerBlogActivityPositions: {
                            node : ui.item.attr('id'),
                            sibling_id : ui.item.next().attr('id'),
                            token: '{mfForm::getToken('MoveActivityForm')}'
                        }
               };
            $.ajax2({
            data: params,
            url: "{url_to('customers_blog_ajax',['action'=>'MoveActivity'])}"         
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
            data : { CustomerBlogActivityNode : { node: '{$item_i18n->get('activity_id')}', lang: '{$item_i18n->get('lang')}', token : '{mfForm::getToken('CustomerBlogActivityNodeForm')}'  } },                                
            url: "{url_to('customers_blog_ajax',['action'=>'ListPartialActivity'])}",
            target: "#actions"
        });
    });

 
</script> 



{else}
    {__('Activity is invalid.')}
{/if}    