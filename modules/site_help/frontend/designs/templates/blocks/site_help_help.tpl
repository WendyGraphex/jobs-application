<i id="showDialogInformation-btn" class="fa fa-question-circle-o informationIcon" aria-hidden="true"></i>

{*=========================================MODAL========================================*}
<div class="modal fade" id="ModalInformations" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h3 style="text-align: center;">{$help_i18n->get('title')|escape}</h3>
                <div id="help-ctn" style="padding: 25px;line-height: 27px;">                   
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $('#showDialogInformation-btn').click(function () {       
        return $.ajax2({ 
                url:"{url_to("site_help_ajax_text",['name'=>$help_i18n->getHelp()->get('name')])}", 
                target: "#help-ctn",
                success : function(resp) {
                        $('#ModalInformations').modal('show');
                }
                }); 
    });
    
</script>


