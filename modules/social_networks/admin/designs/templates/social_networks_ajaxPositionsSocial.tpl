{messages class="errors"}
<h3>{__("position social network")|capitalize}</h3>
<div>
    <a href="#" id="Save" style="display:none"><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a> 
    <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')}</a>  
</div>
{if $collection}
<table id="SocialNetworks">
    <thead>
        <tr>
            <th>{__('id')|capitalize}</th>
            <th>{__('name')|capitalize}</th>          
            <th>{__('position')|capitalize}</th>          
        </tr>
    </thead>
    <tbody>
     {foreach $collection as $item}   
         <tr id="{$item->get('id')}" name="{$item->get('position')}" class="ui-state-default">
             <td><span>{$item->get('id')}</span></td>
             <td><span>{$item->get('name')}</span>                         
             </td>            
             <td><span class="position">{$item->get('position')}</span></td>             
         </tr>
      {/foreach}   
    </tbody>
</table>
{else}
    <div>{__('no social network.')}</div>
{/if}
<div id="debug"></div>
<script type="text/javascript">
     var movedItems=[];
     function saveMovedItems(selected)
     {
        found=false;
        $.each(movedItems,function (i){ 
           if (this.id==selected.id)
           {
               found=true;
               movedItems[i]=selected;
               return true;
           }    
        });
        if (!found)
           movedItems.push(selected);
     }
     
         $('#Cancel').click(function(){                              
             return $.ajax2({ url:"{url_to('social_networks_ajax',['action'=>'ListPartialSocial'])}",target: "#actions"}); 
         });
                
           
          $(".positions").click(function() { 
            var current=$(this).parent().parent();
            if ($(this).attr('name')=='asc')
            {                   
                  current.prev().before(current);            
            }
            else
            {                
                 current.next().after(current);
            }    
            if (current.is(':first-child'))
            {    
              $("#debug").html("first");
              current.show();
            }  
            else 
            {
                if (current.is(':last-child'))
                {    
                    $("#debug").html("last");
                }
                else  $("#debug").html("----");
            }
         }); 
           
      $("#SocialNetworks tbody").sortable({
                            cursor: 'move',
                            start: function( event, ui ) {
                                  $("#Save").show();                            
                                  $(ui.item).addClass('selected')  ;
                            },
                            helper: function (event,ui) {
                                    ui.children().each(function() {
                                            $(this).width($(this).width());
                                    });
                                    return ui;
                            },
                            
			    stop: function( event, ui ) {
                                       
                                        selected={ id: $(ui.item).attr('id')};
                                        if (typeof $(ui.item).prev().attr('id')=='undefined'||$(ui.item).attr('name')>$(ui.item).prev().attr('name'))
					{
                                          selected.node=$(ui.item).next().attr('id');
					}
					else
					{
                                          selected.node=$(ui.item).prev().attr('id');
					}
                                        if (selected.node)
                                           saveMovedItems(selected); 
                                   //    alert("moves="+movedItems.toSource()) ;
                            }
	 });
         
          $("#Save").click(function(){  
                if (movedItems.length==0)
                             return false;
                if (movedItems.length==1)
                {
                     //   alert("move="+movedItems.toSource()) ;                
                            return $.ajax2({ data : { 
                                                 socialnetwork :  $.extend(movedItems[0],{ token : "{mfForm::getToken('movePositionForm')}" })
                                                 } ,
                                            url: "{url_to('social_networks_ajax',['action'=>'MoveSocial'])}",
                                            success:function (response) { 
                                                        if (response.action=='moveSocialNetwork' && response.id==movedItems[0].id)
                                                        {  
                                                                // Renumbering
                                                             $.each($("#SocialNetworks tbody").children(),function (id) {  $(this).attr('name',id+1); });
                                                             $(".position").each(function (id) { $(this).html((id+1))});
                                                             $("#SocialNetworks .selected").removeClass('selected');
                                                        }
                                                        movedItems=[];
                                                        $("#Save").hide();
                                            }    
                             });
                }
                else
                {
                   alert("move selection is not implemented"+movedItems.toSource()); 
                }    
        });
</script>