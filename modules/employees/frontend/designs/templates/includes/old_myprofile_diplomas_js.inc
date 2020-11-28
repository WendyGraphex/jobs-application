$(document).off('click',".EmployeeDiplomas-Add");
     
$(document).off('click',".EmployeeDiplomas-Delete");

$(document).off('change',".EmployeeDiplomas.Languages");
  
$(document).on('click',".EmployeeDiplomas-Add",function () {  
alert("aaaaaaaaaaaa");
        var count=$(".diplomas-ctn").length;    
        if (count >= 5) 
        { 
            alert('MAX'); return ; 
        }
            
           $("#diplomas").append('<div class="diplomas-ctn" data-index="'+count+'" style="line-height: 53px;">'+                                                  
            '<div class="row" data-index="'+count+'">'+  
                '<div class="col-md-1">'+
                    '<div class="form-group row Index">'+
                        '<div class="col-md-3">'+
                            (count+1)+
                        '</div>'+                                            
                        '<div class="col-md-9">'+                                                
                            '<div class="field_with_errors">'+
                                '<input placeholder="{__('Year')}" class="form-control" name="year" style="padding: 8px;"/>'+
                            '</div>'+                                        
                       '</div>'+
                    '</div>'+    
                '</div>'+
                '<div class="col-md-3">'+
                    '<div class="form-group row Index">'+
                        '<div class="col-md-6">'+
                            '<div class="field_with_errors"></div>'+
                                '<select class="EmployeeDiplomas Select form-control" data-index="'+ count +'" name="graduate_id">'+
                                   {foreach $user_diploma['graduate_id']->getChoices() as $key=>$value}
                                       {if $key}
                                       '<option data-index="'+ count +'" value="{$key}">{$value}</option>'+
                                       {else}
                                       '<option data-index="'+ count +'" value="">{$value}</option>'+
                                       {/if}    
                                   {/foreach}
                                '</select>'+
                        '</div>'+
                        '<div class="col-md-6">'+
                            '<div class="field_with_errors"></div>'+
                            '<select class="EmployeeDiplomas Select form-control" data-index="'+ count +'" name="country">'+
                               {foreach $user_diploma['country']->getChoices() as $key=>$value}
                                   {if $key}
                                   '<option data-index="'+ count +'" value="{$key}">{$value}</option>'+
                                   {else}
                                   '<option data-index="'+ count +'" value="">{$value}</option>'+
                                   {/if}    
                               {/foreach}
                            '</select>'+ 
                        '</div>'+
                    '</div>'+
                '</div>'+            
                '<div class="col-md-8">'+
                    '<div class="form-group row Index">'+
                        '<div class="col-md-2">'+
                            '<select class="EmployeeDiplomas Languages Select form-control" data-index="'+ count +'" name="lang">'+
                                {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                               
                                       '<option data-index="'+ count +'" {if $user->getLanguage()==$language->get('code')}selected=""{/if} value="{$language->get('code')}">{$language->getFormatter()->getText()->ucfirst()}</option>'+                                            
                                {/foreach}   
                            '</select>'+
                        '</div>'+
                        '<div class="col-md-10">'+
                            {foreach $form->getLanguages()->byIndex() as $idx=>$language}  
                                '<div style="{if $user->getLanguage()!=$language->get('code')}display:none{/if}" class="diplomas-i18n-ctn diplomas-i18n-ctn-'+ count +'-{$language->get('code')}">'+
                                        '<div class="form-group row Index">'+
                                            '<div class="col-md-3">'+
                                                '<input type="text" placeholder="{__('Diploma')}" data-index="'+ count +'" class=" Input form-control" data-lang="{$language->get('code')}" name="diploma" value="{if $form->hasErrors()}{else}{/if}">'+ 
                                            '</div>'+
                                            '<div class="col-md-5">'+
                                                '<input type="text" placeholder="{__('Address')}" data-index="'+ count +'" class=" Input form-control" data-lang="{$language->get('code')}" name="location" value="{if $form->hasErrors()}{else}{/if}">'+
                                            '</div>'+
                                            '<div class="col-md-3">'+
                                                '<input type="text" placeholder="{__('City')}" data-index="'+ count +'" class=" Input form-control" data-lang="{$language->get('code')}" name="city" value="{if $form->hasErrors()}{else}{/if}">'+
                                            '</div>'+
                                            '<div class="col-md-1">'+
                                            '<div class="form-group row">'+
                                                '<div class="col-md-12">'+      
                                                    '<a href="javascript:void(0);" class="EmployeeDiplomas-Add" data-index="'+ count +'"><i class="fa fa-plus"></i></a>&nbsp'+                                                              
                                                    '<a href="javascript:void(0);" class="EmployeeDiplomas-Delete" data-index="'+ count +'"><i class="fa fa-trash"></i></a>'+
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
            
     
$(document).on('click',".EmployeeSkills-Delete",function () {
    $(".diplomas-ctn[data-index="+$(this).attr('data-index')+"]").remove();
    $(".diplomas-index").each(function (id) { $(this).html(id+1); });
});  

$(document).on('change',".EmployeeSkills.Languages",function () { 
        $(".diplomas-i18n-ctn-"+$(this).attr('data-index')).hide();
        $(".diplomas-i18n-ctn-"+$(this).attr('data-index')+"-"+$(this).val()).show();
});
