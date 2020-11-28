
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Payments')}</h3>
              <h3 class="admin-header-small-text">{__('Payment management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <a href="#">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payments')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancers')}
                <a href="#" id="List"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Paypal')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Details')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
<div class="row">
    <div class="col-md-2">
          <div class="form-group">
              <label>{__('Freelancer')}</label>                                             
              <div class="form-control">{$settings->getEmployeeUser()->getFormatter()->getName()}</div>
          </div>
      </div>       
</div>
          {foreach $settings->getOptions() as $name=>$option}
<div class="row">
    <div class="col-md-2">
          <div class="form-group">
              <label>{__($name)}</label>                                             
              <div class="form-control">{$option}</div>
          </div>
      </div>       
</div>
{/foreach}




<script type="text/javascript">
     
           $("#List").click(function() {                   
              return $.ajax2({ url:"{url_to('payments_paypal_ajax',['action'=>'ListPartialCredit'])}",                                    
                         target: "#actions"}); 
           }); 
    
      
           
         
</script>

