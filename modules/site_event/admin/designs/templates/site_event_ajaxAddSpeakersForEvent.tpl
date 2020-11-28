<div id="SiteEventSpeakerUser" style="padding-top: 15px;">
{foreach $form->getSelection() as $speaker} 
    <div class="btn btn-outline-primary SiteEventSpeakerUser-list" id="{$speaker->get('id')}">                           
         <div class="SiteEventSpeakerUser" id="{$speaker->get('id')}">
           {$speaker->getFormatter()->getName()}                                                                           
            <a href="javascript:void(0);" title="{__('Delete')}" class="SiteEventSpeakerUser-Delete" id="{$speaker->get('id')}"  name="{$speaker->getFormatter()->getName()}">
                <i  class="fa fa-times delete-color"></i>
            </a>                                                       
        </div>
    </div>    
{/foreach}    
</div>
<script type="text/javascript">   
     
     $("#SiteEventSpeakers").data('selection',{$form->getSelection()->getKeys()->toJson()});
     
     $(".SiteEventSpeakerUser-Delete").click(function () {                    
            $(".SiteEventSpeakerUser-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    
