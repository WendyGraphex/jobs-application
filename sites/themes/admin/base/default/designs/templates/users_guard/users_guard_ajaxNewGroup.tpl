{messages class="site-errors"}
<fieldset>
    <legend><h3>{__("New group")}</h3></legend>
<div>
    <a href="#" id="Save" class="btn" style="display:none">
         <i class="fa fa-floppy-o"  style="color:#000; margin-right:10px;"></i>
         {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('Save')}</a>
    <a href="#" id="Cancel" class="btn">
        <i class="fa fa-times" class="btn" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
</div>
<table class="tab-form" cellspacing="0">
    <tr class="full-with">
        <td class="label">{__("name")}</td>
        <td> 
            <div class="error-form">{$form.name->getError()}</div> 
            <input type="text" class="Group" name="name" value="{$group->get('name')|escape}" size="30"/>{if $form->name->getOption('required')}*{/if}
        </td>
    </tr>
</table>  
</fieldset>
<script type="text/javascript">
    
        $('#Cancel').click(function(){ return $.ajax2({ 
                        url:"{url_to('users_guard_ajax',['action'=>'ListPartialGroup'])}" , 
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#actions"}); 
        });
         
        $(".Group").click(function() { $("#Save").show(); });
        
        
        $('#Save').click(function(){ 
              var params= { Group: {                                    
                                    token :'{$form->getCSRFToken()}' 
                                  } };
              $("input.Group").each(function() { params.Group[this.name]=this.value; });
              return $.ajax2({  data:params, 
                                url:"{url_to('users_guard_ajax',['action'=>'NewGroup'])}" , 
                                loading: "#tab-site-dashboard-x-settings-loading",
                                errorTarget: ".site-errors",
                                target: "#actions"}); 
         });  
</script>
