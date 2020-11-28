{alerts}
    <!-- Begin page heading -->
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Settings')}</h3>
              <h3 class="admin-header-small-text">{__('Settings management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                   
                    <a href="#" id="Save" class="btn btn-success admin-header-button">
                        <i style="margin-right: 5px;" class="fa fa-save"></i>
                        {__('Save')}
                    </a>
                </div>
            </div>  
          </div>          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
            <div class="breadcrumb-title">
                <p>
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Settings')}
                </p>
            </div>        
<div class="breadcrumb-title px-2 py-2">
    <div class="AllContainer">
{*    <div class="row" style="margin-right: 0px;margin-left: 0px;">*}
        {foreach $form->getComponents()->ksort() as $component}
      {component name=$component form=$form}
  {/foreach}
{*    </div>*}
</div>
</div>

                        
                        
<script type="text/javascript">
    
      $('#Save').click(function(){
            var  params= {
                                Settings: {
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Settings.Input").each(function() { params.Settings[$(this).attr('name')]=$(this).val(); });
          $(".Settings.Select option:selected").each(function() { params.Settings[$(this).parent().attr('name')]=$(this).val(); });                
       //      alert("Params="+params.toSource());   return ;
          return $.ajax2({ data : params,
                           url: "{url_to('site_ajax',['action'=>'PartialSettings'])}",
                           target: "#actions"});
        });
</script>


