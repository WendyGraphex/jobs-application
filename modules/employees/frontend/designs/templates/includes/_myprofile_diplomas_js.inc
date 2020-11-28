$(document).off('click',".EmployeeDiploma-Add");
     
$(document).off('click',".EmployeeDiploma-Delete");

$(document).off('change',".EmployeeDiplomaLanguages");
  
$(document).on('click',".EmployeeDiploma-Add",function () {   

        var count=$(".diplomas-ctn").length;    
          if (count >= {$form->getSettings()->getMaxDiplomas()}) 
        { 
            alert("{__('%s max diplomas required.',$form->getSettings()->getMaxDiplomas())}"); return ; 
        }
        /* *********************************** DIPLOMAS ************************************************************ */
        $("#diplomas").append(
'<div class="diplomas-ctn" data-index="'+count+'">'+
    '<div class="row" style="line-height: 53px;margin-top: -50px;">'+
       '<div class="col-md-1">'+
            '<div class="form-group row Index">'+
                '<div class="col-md-3">'+
                    + (count+1) +
                '</div>'+                                            
                '<div class="col-md-9">'+                                                
                    '<div class="field_with_errors">'+
                        '<input placeholder="{__('Year')}" data-index="'+count+'" class="EmployeeDiploma Input form-control" name="year" style="padding: 8px;"/>'+
                    '</div>'+                                        
               '</div>'+
            '</div>'+   
        '</div>'+                                    

         '<div class="col-md-3">'+
            '<div class="form-group row Index">'+
                '<div class="col-md-6">'+
                    '<div class="field_with_errors"></div>'+
                        '<select class="EmployeeDiploma Select form-control" data-index="'+count+'" name="graduate_id">'+
                           {foreach $form->diplomas[0]['graduate_id']->getChoices() as $key=>$value}{if $key}'<option data-index="'+count+'" value="{$key}">{$value}</option>'+{else}'<option data-index="'+count+'" value="">{$value}</option>'+{/if}{/foreach}
                        '</select>'+ 
                '</div>'+
                '<div class="col-md-6">'+
                    '<div class="field_with_errors"></div>'+
                     '<select class="EmployeeDiploma Select form-control" data-index="'+count+'" name="country">'+
                       {foreach $form->diplomas[0]['country']->getChoices() as $key=>$value}{if $key}'<option data-index="'+count+'" value="{$key}">{$value|replace:"'":"\'"}</option>'+{else}'<option data-index="'+count+'" value="">{$value}</option>'+{/if}{/foreach}
                    '</select>'+ 
                '</div>'+
            '</div>'+
        '</div>'+ 

        '<div class="col-md-8">'+
            '<div class="form-group row Index">'+
                '<div class="col-md-2">'+
                    '<select class="EmployeeDiplomaLanguages Select form-control" data-index="'+count+'" name="lang">'+
                    {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                               
                           '<option data-index="'+count+'" {if $user->getLanguage()==$language->get('code')}selected=""{/if} value="{$language->get('code')}">{$language->getFormatter()->getText()->ucfirst()}</option>'+                                              
                    {/foreach}   
                    '</select>'+
                '</div>'+
                '<div class="col-md-10">'+
                    {foreach $form->getLanguages()->byIndex() as $idx=>$language}  
                        '<div style="{if $user->getLanguage()!=$language->get('code')}display:none{/if}" class="diplomas-i18n-ctn-'+ count +' diplomas-i18n-ctn-'+count+'-{$language->get('code')}">'+
                                '<div class="form-group row Index">'+
                                    '<div class="col-md-3">'+
                                         '<input type="text" placeholder="{__('Diploma')}" data-index="'+count+'" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="diploma">'+ 
                                    '</div>'+
                                    '<div class="col-md-5">'+
                                        '<input type="text" placeholder="{__('Address')}" data-index="'+count+'" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="location">'+
                                    '</div>'+
                                     '<div class="col-md-3">'+
                                        '<input type="text" placeholder="{__('City')}" data-index="'+count+'" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="city">'+
                                    '</div>'+
                                    '<div class="col-md-1">'+
                                        '<div class="form-group row">'+  
                                            '<div class="col-md-12">'+      
                                                '<a href="javascript:void(0);" class="EmployeeDiploma-Add" data-index="'+count+'"><i class="fa fa-plus"></i></a>&nbsp'+                                                   
                                                '<a href="javascript:void(0);" class="EmployeeDiploma-Delete" data-index="'+count+'"><i class="fa fa-trash"></i></a>'+                                                                                
                                            '</div>'+ 
                                        '</div>'+
                                    '</div>'+
                                '</div>'+
                        '</div>'+
                    {/foreach} 
               '</div>'+
            '</div>'+
        '</div>'+   
        
    '</div>'+
'</div>');
});


$(document).on('click',".EmployeeDiploma-Delete",function () {
    $(".diplomas-ctn[data-index="+$(this).attr('data-index')+"]").remove();
    $(".diplomas-index").each(function (id) { $(this).html(id+1); });
});  

$(document).on('change',".EmployeeDiplomaLanguages",function () { 
        $(".diplomas-i18n-ctn-"+$(this).attr('data-index')).hide();
        $(".diplomas-i18n-ctn-"+$(this).attr('data-index')+"-"+$(this).val()).show();
});
