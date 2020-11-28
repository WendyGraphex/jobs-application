{alerts}          
<div class="NewClassAtTable bg-white px-2 py-2">     
             <div class="col-md-12  padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager class="dialog-pager"}  
                 </div>
                 <div class="float-right w-50">                   
                        <button  style="float: right;" id="dialog-filter" class="btn btn-secondary btn-f" >{__("Filter")}</button>   
                        <button  style="float: right;margin-right: 10px;" id="dialog-init" class="btn btn-secondary btn-init btn-f">{__("Init")}</button>
                 </div>
             </div>
                 
                 
                 
{*<table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
        <tr class="list-header">*}
      <table id="DialogSpeakerUserList" class="table table-bordered table-hover table-striped list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="{*bg-info*}thead-color">
        <tr role="row">
            <th>#</th>
            {*<th><span class="mr-1">{__('ID')}</span>
                         <div class="d-inline-block">
                             <a href="#" class="dialog-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="title"><i class="fa fa-sort-up acs-desc"></i></a>
                             <a href="#" class="dialog-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="title"><i class="fa fa-sort-down"></i></a>            
                          </div>
            </th>   *}           
            <th><span class="mr-1">{__('First name/Last name')}</span></th>                                                      
        </tr>
      </thead>
      <tbody class="tablebody">
          <tr role="row">
              {*<td></td>*}
              <td></td>             
              <td><input class="form-control form-control-sm ml-1 dialog-search" name="name" value="{$formFilter.search.name}"></td>                                                         
          </tr>
      
       {foreach $pager as $item} 
      <tr class="DialogSpeakerUserList list {if $formFilter->getSelection()->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          {*<td>{$item->get('id')}</td>*}                  
          <td>{$item->getFormatter()->getName()}
          </td>                                              
             </tr>
        {/foreach}
         {if !$pager->hasItems()}
             <tr role="row" >
                 <td  colspan="13">{__('No result')}</td>
             </tr>
        {/if}  
        </tbody>         
    </table>
      </div>
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog-pager"} 
  </div>
  
</div>
<script type="text/javascript">
   
     $("#DialogSpeakerUserList").data('selection',{$formFilter->getSelection()->toJson()});
      
     function getDialogFilterParameters()
        {
            var params={    filter: {  order : { }, 
                                    search : { },
                                    equal: { },          
                                    range: { },  
                                selection : $("#DialogSpeakerUserList").data('selection'),
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                                
                                token:'{$formFilter->getCSRFToken()}'
                         } };
             if($(".dialog-order_active").attr("name"))
                 params.filter.order[$(".dialog-order_active").attr("name")] =$(".dialog-order_active").attr("id");            
            $(".dialog-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateDialogFilter()
        {          
           return $.ajax2({ data: getDialogFilterParameters(), 
                            url:"{url_to('site_event_ajax',['action'=>'ListPartialDialogSpeaker'])}" ,                          
                            target: "#Modal-Speakers-ctn"
                             });
        }
        
       
        $(".dialog-search").keypress(function(event) {  if (event.keyCode==13)   return updateDialogFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateDialogFilter();  });
    
        $(".dialog-pager").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialDialogSpeaker'])}?page="+$(this).attr('data-page'),                                
                                 target: "#Modal-Speakers-ctn"
                });
        });
          
        $("#dialog-init").click(function () {                     
                return $.ajax2({ data : { filter : {  
                                              token : '{$formFilter->getCSRFToken()}' ,
                                              selection : $("#DialogSpeakerUserList").data('selection')
                                         } },
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialDialogSpeaker'])}",
                                 target: "#Modal-Speakers-ctn"
                });
        });
        
        $("#dialog-filter").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogSpeaker'])}",                                
                                 target: "#Modal-Speakers-ctn"
                });
        });
              
       $(".DialogSpeakerUserList").click(function () {
           $(this).toggleClass("Selected");        
           if ($(this).hasClass("Selected"))                                                  
            $("#DialogSpeakerUserList").data("selection").push(parseInt($(this).attr("id")));                                 
           else              
            $("#DialogSpeakerUserList").data("selection").splice($.inArray(parseInt($(this).attr("id")),$("#DialogSpeakerUserList").data("selection")),1);                                                                    
        });
        
    
</script>
