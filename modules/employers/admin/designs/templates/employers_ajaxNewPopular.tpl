  {messages}
            <fieldset>
            <div class="row" style="margin: 0;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 style="line-height: 60px; font-size: 25px; font-family: Lato; display: table-cell; vertical-align: middle; color: rgb(101, 109, 120);">{__("New Employer")}</h3>
                </div>

                <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="New" class="btn btn-success admin-header-button">
                <i class="fa fa-save" style=" margin-right:10px;"></i>
            {__('Create')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                <i style="margin-right: 5px;" class="fa fa-times" style="margin-right:10px;"></i>
            {__('Cancel')}</a>
        </div>
        </div>
   
            </div>
  
            <div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
                width: 100%; text-align: left; margin-bottom: 15px;">
                <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Employer")}
                </p>
            </div>
            <div style="width: 100%; background-color: white; padding: 20px;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">
                
     </div>
    
</fieldset>
 
<script type="text/javascript">
    
    
    
    $('#pictureAdd').click(function() {
        $('#imgInp').click();
     });
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result);
              $("#BtnInverse").show();
          };
          reader.readAsDataURL(this.files[0]);
        }        
    }); 
    
    
    $(".Mode").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $("#DivLogo").css('background-color','#37BC9B');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $("#DivLogo").css('background-color','');
            }
   });
         
     $("#New").click( function () {   

         var params= { Employer: {                                        
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $(".Employer.Input").each(function() { params.Employer[this.name]=$(this).val(); });
                  $(".Employer.Select").each(function() { params.Employer[this.name]=$(this).val(); });
                  $("input.Employer[type=radio]:checked").each(function() { params.Employer[this.name]=$(this).val(); }); 
                   
                //     alert("params="+params.toSource()); return ;    

            return $.ajax2({    
                data:params   , 
                files : ".Files",
                url: "{*url_to('employers_ajax',['action'=>'NewEmployer'])*}",               
                target: "#page-wrapper"
           });
         });
        
       $('#Cancel').click(function(){ return $.ajax2({ 
                        url:"{url_to('employers_ajax',['action'=>'ListPartialPopular'])}" , 
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#page-wrapper"}); 
        });
         
         
</script>