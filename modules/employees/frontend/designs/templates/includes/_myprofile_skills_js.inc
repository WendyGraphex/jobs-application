$(document).off('click',".EmployeeSkill-Add");
     
$(document).off('click',".EmployeeSkill-Delete");

$(document).off('change',".EmployeeSkillLanguages");
  
$(document).on('click',".EmployeeSkill-Add",function () {             
        var count=$(".skills-ctn").length;    
         if (count >= {$form->getSettings()->getMaxSkills()}) 
        { 
            alert("{__('%s max skills required.',$form->getSettings()->getMaxSkills())}"); return ; 
        }
        $("#skills").append('<div class="skills-ctn" data-index="'+count+'">'+                                                            
                                    '<div class="row" style="line-height: 53px;margin-top: -15px;">'+              
                                        '<div class="col-md-3">'+
                                            '<div class="form-group row">'+
                                                '<div class="col-md-2 skills-index">'+ (count+1)+
                                                '</div>'+   
                                                
                                                '<div class="col-md-10">'+   
                                                    '<select class="EmployeeSkill Select form-control" data-index="'+ count +'" name="skill_id">'+
                                                     {foreach $form->skills[0]['skill_id']->getChoices() as $key=>$value}                        
                                                         {if $key}
                                                        '<option data-index="'+count+'" value="{$key}">{$value}</option>'+
                                                        {else}
                                                        '<option data-index="'+count+'">{$value}</option>'+
                                                        {/if}  
                                                     {/foreach}
                                                    '</select>'+
                                                '</div>'+
                                            '</div>'+       
                                        '</div>'+
                                        
                                        '<div class="col-md-3">'+
                                            '<select class="EmployeeSkillLanguages Select form-control" data-index="'+ count +'" name="lang">'+
                                                {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                               
                                                       '<option data-index="'+count+'" {if $user->getLanguage()==$language->get('code')}selected=""{/if} value="{$language->get('code')}">{$language->getFormatter()->getText()->ucfirst()}</option>'+                                                                                                  
                                                {/foreach}   
                                            '</select>'+
                                        '</div>'+ 

                                        '<div class="col-md-3">'+
                                                {foreach $form->getLanguages()->byIndex() as $idx=>$language}             
                                                    '<div style="{if $user->getLanguage()!=$language->get('code')}display:none{/if}" class="skills-i18n-ctn-'+ count +' skills-i18n-ctn-'+ count +'-{$language->get('code')}">'+
                                                          '<input type="text" placeholder="{__('Enter your skill')}" data-index="'+ count +'" class="EmployeeSkillI18n Input form-control" data-lang="{$language->get('code')}" name="value" value="">'+                                                                                 
                                                    '</div>'+
                                                {/foreach}
                                        '</div>'+

                                        '<div class="col-md-1">'+
                                            '<div class="form-group row">'+
                                                '<div class="col-md-12">'+      
                                                    '<a href="javascript:void(0);" class="EmployeeSkill-Add" data-index="'+ count +'"><i class="fa fa-plus"></i></a>&nbsp'+                                                              
                                                    '<a href="javascript:void(0);" class="EmployeeSkill-Delete" data-index="'+ count +'"><i class="fa fa-trash"></i></a>'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>'+       
                                        
                                    '</div>'+                                                                                                 
                                '</div>');                       
});
     
$(document).on('click',".EmployeeSkill-Delete",function () {
    $(".skills-ctn[data-index="+$(this).attr('data-index')+"]").remove();
    $(".skills-index").each(function (id) { $(this).html(id+1); });
});  

$(document).on('change',".EmployeeSkillLanguages",function () { 
        $(".skills-i18n-ctn-"+$(this).attr('data-index')).hide();
        $(".skills-i18n-ctn-"+$(this).attr('data-index')+"-"+$(this).val()).show();
});
