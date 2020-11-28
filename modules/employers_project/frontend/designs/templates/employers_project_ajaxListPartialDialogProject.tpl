<div class="NewClassAtTable bg-white px-2 py-2">    
    <div class="col-md-12  padd-col">

        
            <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager class="dialog"}  
                 </div>

 
        <div class="float-right w-50">                   
  
              <button style="float: right;" id="dialog-filter" class="btn btn-secondary btn-color btn-f" >{__("Filter")}</button>   
                        <button style="float: right;margin-right: 10px;" id="dialog-init" class="btn btn-secondary btn-color btn-init btn-f">{__("Init")}</button>
        </div>
    </div>



    <table id="DialogProjectList" class="table table-bordered table-hover table-striped list-user" role="grid" aria-describedby="Myliste_info">
        <thead class="thead-color">
            <tr role="row">
                <th>#</th>           
                <th><span class="mr-1">{__('Name')}</span></th>                                             
                <th><span class="mr-1">{__('Budget')}</span></th>                                                                                   
            </tr>
        </thead>
        <tbody class="tablebody">
            <tr role="row">
                <td></td>             
                <td><input class="form-control form-control-sm ml-1 dialog-search" name="query" value="{$formFilter.search.query}"></td>                                          
                <td></td>
            </tr>           
           {foreach $pager as $item} 
            <tr class="DialogProjectList list {if $formFilter->getSelection()->in($item->get('id'))}selected{/if}" id="{$item->get('id')}" role="row">
                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                <td>
                    {$item->getFormatter()->getName()->ucfirst()}
                </td> 
                <td>{$item->getFormatter()->getBudget()->getAmount()}</td>                                                               
            </tr>
            {foreach $item->getProjectsI18n() as $i18n}                                                                   
            <tr class="list-i18n" id="{$i18n->get('id')}" data-project="{$item->get('id')}" role="row">
                <td></td>
                <td>                                 
                   <div>{__('Ref.')}: {$i18n->get('reference')}</div>
                   <div>{$i18n->getFormatter()->getLanguage()->getText()->ucfirst()} - <a target="_blank" href="{$i18n->getUrl()}">{$i18n->get('title')}</a></div>   
                </td>                             
                <td></td>
            </tr>
             {/foreach}
         {/foreach}
                         
        {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog"} 
        {if !$pager->hasItems()}
            <tr role="row" >
                <td  colspan="13">{__('No project')}</td>
            </tr>
        {/if}               
        </tbody>         
    </table>
</div>
    
<script type="text/javascript">
    
    $("#DialogProjectList").data('selection',{$formFilter->getSelection()->toJson()});  
    
    
    function getDialogFilterParameters()
    {
        var params={ filter: {  search : { },                                                                    
                            selection : $("#DialogProjectList").data('selection'),
                            nbitemsbypage: $("[name=dialog-nbitemsbypage]").val(),                                
                            token:'{$formFilter->getCSRFToken()}'
                     } };        
        $(".dialog-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
        return params;                  
    }

    function updateDialogFilter()
    {          
       return $.ajax2({ data: getDialogFilterParameters(), 
                        url:"{url_to('employers_project_ajax',['action'=>'ListPartialDialogProject'])}" ,                          
                        target: "#Projects-Dialog-ctn"
                         });
    } 
    
    $(".dialog-search").keypress(function(event) {  if (event.keyCode==13)   return updateDialogFilter(); });

    $("[name=dialog-nbitemsbypage]").change(function () {  return updateDialogFilter();  });
    
    
     $("#dialog-init").click(function () {                     
                return $.ajax2({ data : { filter : { selection : $("#DialogProjectList").data('selection'), token: '{mfForm::getToken('EmployerProjectDialogFormFilter')}' }  },                                
                                 url:"{url_to('employers_project_ajax',['action'=>'ListPartialDialogProject'])}",
                                    target: "#Projects-Dialog-ctn"
                });
        });
        
        $("#dialog-filter").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                  url:"{url_to('employers_project_ajax',['action'=>'ListPartialDialogProject'])}",              
                                  target: "#Projects-Dialog-ctn"
                });
        });
          
          
       $(".DialogProjectList").click(function () {
           $(this).toggleClass("selected");        
           if ($(this).hasClass("selected"))                                                  
            $("#DialogProjectList").data("selection").push(parseInt($(this).attr("id")));                                 
           else              
            $("#DialogProjectList").data("selection").splice($.inArray(parseInt($(this).attr("id")),$("#DialogProjectList").data("selection")),1);                    
            console.log($("#DialogProjectList").data("selection"));
        });
</script>                     