<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Payment methods')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>       
            <a id="PaymentEmployeeAdvises"><p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Payment methods')}</p></a>            
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-payment-method"}
    </div>
</div>
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div>     

<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">   
            <ul class="list-paiements PaymentUl">
                 {foreach $form->getMethods()->bySettings() as $method}
                       {component name=$method->getEngine()->getEmployeeSettings() method=$method}  
                 {/foreach}
            </ul>                                               
        </div>
    </div>
 </div>
            
 <script type="text/javascript">                  
             
$("#Save").click(function () { 
        var params = {  PaymentEmployeeSettings : { method: $(".Payment:checked").attr('data-name'), token : '{$form->getCSRFToken()}' } }; 
        
        $(".Payment").each(function () {             
            var item= { };
            $(".Settings.Input[data-method="+$(this).attr('data-method')+"]").each(function () { 
                item[$(this).attr('name')]=$(this).val();
            });
            $(".Settings.Select[data-method="+$(this).attr('data-method')+"] option:selected").each(function () { 
                item[$(this).parent().attr('name')]=$(this).val();
            });
            params.PaymentEmployeeSettings[$(this).attr('data-method')]=item;;
        });
        
       //  console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('payments_employee_ajax',['action'=>'Method'])}",           
            target: "#page-wrapper"
        });
    
      });            
      
      
</script>      