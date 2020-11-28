{messages}
<h3>{__("Add employees")}</h3>
<div>
    <a href="#" id="Save" class="btn btn-primary">
        <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
    {__('Save')}</a>
    <a href="#" id="Cancel" class="btn btn-primary">
        <i class="fa fa-times" style="margin-right:10px;"></i>
    {__('Cancel')}</a>
</div>
<div class="row form"> 
     {foreach $form->employees->getChoices() as $code=>$language}    
        <div class="employees col-lg-1 col-md-3 col-xs-3" >
            <span>               
                <input type="checkbox" class="Employees Checkbox" id="{$code}" name="employees" {if $form->getEmployees()->in($language->getCode())}checked=""{/if} style="margin-right: 4px;float:left;"/>
                <label for="{$code}">{$language->getCode()->getFormatted()->ucfirst()}</label>
            </span>
        </div>      
     {/foreach}    
</div>

<script type="text/javascript">
                            
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ 
                              url : "{url_to('site_employee_ajax',['action'=>'ListPartial'])}",                                                    
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {              
                                SiteEmployees: {  
                                   employees : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Employees.Checkbox:checked").each(function() { params.SiteEmployees[$(this).attr('name')].push($(this).attr('id')); });                  
           //   alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,                              
                           url: "{url_to('site_employee_ajax',['action'=>'Add'])}",                            
                           target: "#actions"}); 
        });  
     
</script>

