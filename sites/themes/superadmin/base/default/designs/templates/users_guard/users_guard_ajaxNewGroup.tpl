{messages class="{$site->getSiteID()}-site-errors"}
<h3>{__("New group")}</h3>
<div>
    <a href="#" id="{$site->getSiteID()}-Save" class="btn" style="display:none">
         <i class="fa fa-floppy-o"  style="color:#000; margin-right:10px;"></i>
         {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
    <a href="#" id="{$site->getSiteID()}-Cancel" class="btn">
        <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
<table class="tab-form" cellpadding="0" cellspacing="0">
    <tr class="full-with">
        <td class="label">{__("name")}</td>
        <td> 
            <div class="error-form">{$form.name->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-Group" name="name" value="{$group->get('name')|escape}" size="30"/>{if $form->name->getOption('required')}*{/if}
        </td>
    </tr>
</table>  
<script type="text/javascript">
    
        $('#{$site->getSiteID()}-Cancel').click(function(){ return $.ajax2({ 
                        url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" , 
                        loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                        errorTarget: ".{$site->getSiteID()}-site-errors",
                        target: "#{$site->getSiteID()}-actions"}); 
        });
         
        $(".{$site->getSiteID()}-Group").click(function() { $("#{$site->getSiteID()}-Save").show(); });
        
       
        $('#{$site->getSiteID()}-Save').click(function(){ 
              var params= { Group: {                                    
                                    token :'{$form->getCSRFToken()}' 
                                  } };
              $("input.{$site->getSiteID()}-Group").each(function() { params.Group[this.name]=this.value; });
              return $.ajax2({  data:params, 
                                url:"{url_to('users_guard_ajax',['action'=>'NewGroup'])}" , 
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                target: "#{$site->getSiteID()}-actions"}); 
         });  
</script>
