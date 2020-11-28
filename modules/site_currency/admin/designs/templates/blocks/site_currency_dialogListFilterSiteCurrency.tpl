<div id="dialogListFilterSiteCurrency" class="dialogs" title="{__('site currency')}" style="display:none">
  {include file="./../site_currency_ajaxDialogListFilterSiteCurrency.tpl"}  
</div>
<script type="text/javascript">
    
     $("#dialogListFilterSiteCurrency").find("script").remove(); // Remove script in dialog container
     
     $("#dialogListFilterSiteCurrency").dialog('destroy'); // Remove old dialog 
      
     $("#dialogListFilterSiteCurrency").dialog({
                    "autoOpen":false,"height":"auto","modal":true,"width":"auto",
                  
                    buttons: {
                        "{__('select')|capitalize}": function() {
                               selected={ };
                               $(".dialogListFilterSiteCurrency.selected td").each(function (id) {
                                   if ($(this).attr('name'))
                                      selected[$(this).attr('name')]=$(this).attr('title')  
                               });
                               selected.id=$("#dialogListFilterSiteCurrency").data('selected');
                                $("#dialogListFilterSiteCurrency").trigger({ type:'change',  
                                       selected: selected
                               });
                               $( this ).dialog( "close" );
                        },
                        "{__('cancel')|capitalize}": function() {
                            $( this ).dialog( "close" );
                        }
                    }
     });  
     
     $("#dialogListFilterSiteCurrency").unbind(); // Remove all events
</script>