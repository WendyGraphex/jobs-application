$(document).off('click',".EmployeeLanguage-Add");
     
$(document).off('click',".EmployeeLanguage-Delete");

{* $(document).off('change',".EmployeeLanguageLanguages"); *}
  
$(document).on('click',".EmployeeLanguage-Add",function () { 
        var count=$(".languages-ctn").length;    
         if (count >= {$form->getSettings()->getMaxLanguages()}) 
        { 
            alert("{__('%s max languages required.',$form->getSettings()->getMaxLanguages())}"); return ; 
        }
            
           $("#languages").append('<div class="languages-ctn" data-index="'+count+'" style="line-height: 53px;margin-top: -15px;">'+                                                  
            '<div class="row" data-index="'+count+'">'+  
                '<div class="col-md-1">'+                                                                                            
                    '<div class="form-group col-md-1 Index">'+ (count+1)+                                                                                               
                    '</div>'+
                '</div>'+
                '<div class="col-md-4">'+   
                    '<div class="form-group row">'+
                        '<label class="col-sm-4 col-form-label">{__('Language')}</label>'+
                        '<div class="col-sm-4">'+
                            '<div class="field_with_errors"></div>'+ 
                           '<select class="EmployeeLanguage Select form-control" data-index="'+ count +'" name="lang">'+
                               {foreach $form->languages[0]['lang']->getChoices() as $key=>$value}                                               
                                        {if $key}'<option data-index="'+count+'" value="{$key}">{$value->getFormatted()->ucfirst()}</option>'+                                                                                                  
                                        {else}'<option data-index="'+count+'" value="">{$value}</option>'+{/if}
                                {/foreach}  
                            '</select>'+  
                        '</div>'+
                    '</div>'+
                '</div>'+
                
                '<div class="col-md-4">'+   
                    '<div class="form-group row">'+
                        '<label class="col-sm-4 col-form-label">{__('Level')}</label>'+
                        '<div class="col-sm-4">'+
                            '<div class="field_with_errors"></div>'+ 
                            '<select class="EmployeeLanguage Select form-control" data-index="'+count+'" name="level_id">'+
                                {foreach $form->languages[0]['level_id']->getChoices() as $key=>$value}
                                    {if $key}
                                    '<option data-index="'+count+'" value="{$key}">{$value}</option>'+
                                     {else}
                                    '<option data-index="'+count+'" value="{$key}">{$value}</option>'+
                                    {/if}  
                                {/foreach}
                            '</select>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
                '<div class="col-md-1">'+
                    '<div class="form-group row">'+
                        '<div class="col-md-12">'+      
                                '<a href="javascript:void(0);" class="EmployeeLanguage-Add" data-index="'+ count +'"><i class="fa fa-plus"></i></a>&nbsp'+                                                              
                                '<a href="javascript:void(0);" class="EmployeeLanguage-Delete" data-index="'+ count +'"><i class="fa fa-trash"></i></a>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+ 
                '</div>'+
        '</div>');
     });
            
     
$(document).on('click',".EmployeeLanguage-Delete",function () {
    $(".languages-ctn[data-index="+$(this).attr('data-index')+"]").remove();
    $(".languages-index").each(function (id) { $(this).html(id+1); });
});  

{* $(document).on('change',".EmployeeLanguageLanguages",function () { 
        $(".languages-i18n-ctn-"+$(this).attr('data-index')).hide();
        $(".languages-i18n-ctn-"+$(this).attr('data-index')+"-"+$(this).val()).show();
}); *}
