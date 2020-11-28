{messages}
<div class="content-header row">
    <div class="content-header-left col-md-6 col-12 mb-2">
        <h3 class="content-header-title mb-0">{__('Sms Box')}</h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
        <div class="media width-250 float-right">
            <div class="media-left media-middle">
                <div id="sp-bar-total-sales"></div>
            </div>
            <div class="media-body media-right text-right">
                {**}
                {*<a href="#" class="btn btn-primary float-right" id="New" title="{__('Nouveau')}" >*}
                {*<i class="fa fa-plus"></i>*}
                {*{__('Nouveau')}</a>   *}
                {**}
                {*</div>*}
            </div>
        </div>
    </div>
</div>
{* {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}*}
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                <div class="content-header-right pull-right col-md-12" style="margin-top: -60px">
                    <div class="col-2 pull-right">

                    </div>


                </div>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">

                        {*<li><a><i class="fa fa-search" id="filter"></i></a></li>*}
                        {*<li><a><i class="fa fa-sync" id="init"></i></a></li>*}
                    </ul>
                </div>
            </div>
            <div class="card-content collapse show">
                <div class="card-body">
                    <div class="table-responsive">
                        <input type="text" width="100px " class="Fields form-control Input Sms" value="+212" class="form-control float-right" name="mobile" placeholder="Mobile..." >
                       <hr>
                        <textarea type="text"  id="messageArea" width="100px" style="height: 100px" class="Fields form-control Input Sms" value="" class="form-control float-right" name="message"  placeholder="Message..." ></textarea>
                        <p id="info"></p>
                        <a href="#" class="btn btn-primary pull-left" id="send" title="{__('Envoyer')}">
                            <i class="fa fa-plus"></i>
                            {__('Envoyer')}</a>
                        <div style="font-weight: bold; margin-top: 19px;font-size: 15px;margin-left: 127px;">
                            <span class="text-success" id="nb-caratere" data-count=0 data-msg=1 data-nb=155></span>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    $('#messageArea').keyup(function () {
        var text = $('#messageArea').val().length;
        var nb = text % parseInt($('#nb-caratere').attr('data-nb'));
        var msg =parseInt(text/$('#nb-caratere').attr('data-nb')) + 1;
        $('#nb-caratere').attr('data-msg',msg);
        $('#nb-caratere').attr('data-count',nb);
        $('#nb-caratere').text($('#nb-caratere').attr('data-count')+" / "+$('#nb-caratere').attr('data-msg'));
        if(msg==1) $('#nb-caratere').addClass('text-success').removeClass('text-danger');
        else  $('#nb-caratere').addClass('text-danger').removeClass('text-success');
    });

     $('#nb-caratere').text($('#nb-caratere').attr('data-count')+" / "+$('#nb-caratere').attr('data-msg'));


    $('#send').click(function () {
        //   if (!confirm("{__("Un SMS va etre envoyer . Confirmez vous ?")}".format($(this).data('name')))) return false;
        if( $('#send').hasClass('Wait')) return;
        $('#send').addClass('Wait');
        var  params= { SmsTest: {  token :'{mfForm::getToken('SendSmsForm')}' } };
        $(".Fields.Input.Sms").each(function() { params.SmsTest[this.name]=$(this).val(); });
        return $.ajax2({
            data : params,
            url :"{url_to('services_smsbox_ajax',['action'=>'SendSms'])}",
            success : function(resp) {
                $('#send').removeClass('Wait');
            }
        });


    });
</script>

