{if $project->isLoaded()}
<h4 style="margin-bottom: 20px;">{__('Leave your review for %s',$form->getProject()->getEmployerUser()->get('username'))}</h4>
{foreach $form->getCriteriasByCategories() as $category}
<div>
    <span class="classCategoryStyle">{$category->getI18n()->getTitle()->ucfirst()}</span>
    <ul class="ulCategory">
        {foreach $category->getCriterias() as $criteria}
        <li>
            <span>{$criteria->getI18n()->getTitle()->ucfirst()}</span>
            <div>
                <ul class="allStars Notation" data-rate="0" data-criteria="{$criteria->get('id')}" data-category="{$category->get('id')}">
                    {section name=note start=0 loop=$criteria->get('max')}
                        <li> <a href="#" id="{$smarty.section.note.index}" class="Criteria-{$criteria->get('id')} Criteria" data-criteria="{$criteria->get('id')}" data-category="{$category->get('id')}" style="color:#222;">
                            <i class="mdi mdi-star-outline"></i>
                            </a></li>                  
                    {/section}                   
                </ul>
            </div>
        </li>
        {/foreach}
    </ul>
</div>
{/foreach}
<div style="text-align: center;">
    <button type="button" id="SaveReview-btn" class="btn btn-success">{__('Save')}</button>
</div> 
<script type="text/javascript">
          
    $('.Criteria').click(function() {
            let point = $(this).attr('id');
            let criteria = $(this).data('criteria');
            $('.Criteria').each(function() {
                if($(this).attr('id') <= point && $(this).hasClass('Criteria-'+criteria)){
                    $(this).addClass('selected-'+criteria);
                    $(this).addClass('selected');
                    $(this).find("i").removeClass('mdi-star-outline');
                    $(this).find("i").addClass('mdi-star');
                }
                else if($(this).attr('id') >= point && $(this).hasClass('Criteria-'+criteria)){
                    $(this).removeClass('selected-'+criteria);
                    $(this).removeClass('selected');
                    $(this).find("i").addClass('mdi-star-outline');
                    $(this).find("i").removeClass('mdi-star');
                }
            });                
            $(".Notation[data-criteria="+criteria+"]").attr('data-rate', $('.selected-'+criteria).length); 
     });
   
    {if $project->getWork()->getQuotation()->hasEmployeeAdvert()}
    $("#SaveReview-btn").click(function () { 
           if ($("#SaveReview-btn").hasClass('isBusy')) return ;
                $("#SaveReview-btn").addClass('isBusy');         
           var params = { Project: '{$project->get('id')}', ProjectEmployeeReviewNotations : { notations :[ ], token : '{mfForm::getToken('ProjectEmployeeAdvertEmployerNotationSendForm')}' } };
           $(".Notation").each(function () { params.ProjectEmployeeReviewNotations.notations.push({ criteria_id: $(this).attr('data-criteria'), notation: $(this).attr('data-rate') }); });
           return $.ajax2({ 
                            data : params,
                            url :"{url_to('employees_notation_ajax',['action'=>'SendProjectEmployeeNotation'])}",                           
                            success : function (resp)
                                {
                                     $("#SaveReview-btn").removeClass('isBusy');
                                    if (resp.action !='ProjectEmployeeNotation') return ;                                  
                                    if (resp.errors)
                                    {                                        
                                       // $.each(resp.errors, function (f) {  $(".ProjectEmployerComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }   
                                    $("#ModalAddCommentReview").modal('hide');                                        
                                }
                     });  
    });
    {else}
    $("#SaveReview-btn").click(function () { 
            if ($("#SaveReview-btn").hasClass('isBusy')) return ;
                $("#SaveReview-btn").addClass('isBusy');         
           var params = { Project: '{$project->get('id')}', ProjectEmployeeReviewNotations : { notations :[ ], token : '{mfForm::getToken('ProjectEmployeeAdvertEmployerNotationSendForm')}' } };
           $(".Notation").each(function () { params.ProjectEmployeeReviewNotations.notations.push({ criteria_id: $(this).attr('data-criteria'), notation: $(this).attr('data-rate') }); });
           return $.ajax2({ 
                            data : params,
                            url :"{url_to('employers_notation_ajax',['action'=>'SendProjectEmployeeNotation'])}",                           
                            success : function (resp)
                                {
                                    $("#SaveReview-btn").removeClass('isBusy');
                                    if (resp.action !='ProjectEmployeeNotation') return ;                                  
                                    if (resp.errors)
                                    {                                        
                                      //  $.each(resp.errors, function (f) {  $(".ProjectEmployerComment[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }   
                                    $("#ModalAddCommentReview").modal('hide');                           
                                }
                     });  
    });
    {/if}
</script>

{else}
    {__('Project is invalid')}
{/if}    
