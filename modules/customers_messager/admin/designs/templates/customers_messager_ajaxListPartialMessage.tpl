
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Customer messages')}</h3>
              <h3 class="admin-header-small-text">{__('Customer messages management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>               
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Customer messages')}              
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class=" bg-white px-2 py-2">
            <div class="col-md-12">
                
                <div class="float-left w-50">
                      {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                </div>
                <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
            </div>

     <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
       <thead class="bgSpec">{*<thead class="bg-info thead-color">*}
         <tr role="row">
            <th>#</th>
            <th>{__('ID')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th class="sorting norm-width" >{__('From')}</th>          
            <th class="sorting norm-width">{__('To')}</th>                   
            <th class="sorting norm-width">{__('Subject/Message')}</th>
            <th class="sorting norm-width">{__('Read?')}</th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>            
            <th>{__('Actions')}</th>
         </tr>
      </thead>
      <tbody>
          <tr role="row">
                <td></td>               
                <td></td>
                <td>
                      {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="sender" options=$formFilter->equal.sender->getOption('choices') selected=(string)$formFilter.equal.sender}
                </td>           
                <td>
                       {*html_options style="height: 31px;" class="notequal Select show-menu-arrow form-control" name="sender" options=$formFilter->notequal.sender->getOption('choices') selected=(string)$formFilter.notequal.sender*}
                </td>  
                <td></td>  
                <td>
                     {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="read_at" options=$formFilter->equal.read_at->getOption('choices') selected=(string)$formFilter.equal.read_at}
                </td>  
                <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>              
                  <td></td>    
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list CustomerMessage" id="{$item->get('id')}" role="row">
             <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>  
          <td>{$item->get('id')}</td>          
          <td>
                 {if $item->isEmployerSender()}
                    {$item->get('employer_user_id')} {$item->getEmployerUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployerUser()->getFormatter()->getlastname()->ucfirst()} 
                 {elseif $item->isEmployeeSender()}   
                   {$item->get('employee_user_id')} {$item->getEmployeeUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployeeUser()->getFormatter()->getlastname()->ucfirst()} 
                 {else}
                     {__('Administrator')} - {$item->getUser()->getFormatter()->getFirstname()->ucfirst()}  {$item->getUser()->getFormatter()->getLastname()->ucfirst()}                    
                 {/if}                    
          </td>
          <td>             
                 {if $item->hasEmployeeUser() && !$item->isEmployeeSender()}
                    {$item->getEmployeeUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployeeUser()->getFormatter()->getlastname()->ucfirst()} 
                 {elseif $item->hasEmployerUser() && !$item->isEmployerSender()}
                    {$item->getEmployerUser()->getFormatter()->getFirstname()->ucfirst()} {$item->getEmployerUser()->getFormatter()->getlastname()->ucfirst()}  
                {else} 
                    {__('Administrator')} - {$item->getUser()->getFormatter()->getFirstname()->ucfirst()}  {$item->getUser()->getFormatter()->getLastname()->ucfirst()}   
                 {/if}                                             
          </td>         
          <td>
              <div><strong>{$item->get('subject')}</strong></div>
               <div>{$item->get('message')|truncate:80}</div>
               {if $item->hasFiles()}
                    {$item->getFormatter()->getNumberOfFiles()->getChoicesText('[0]no file|[1]one file|(1,Inf]%s files')}
                    {foreach $item->getFiles() as $file}
                        <div>  <a target="_blank" href="{$file->getFileManager()->getUrl()}"><img src="{url("/icons/files/`$file->get('extension')`.gif",'picture')}"/>
                {$file->get('file')}</a>       ({$file->getSize()->getFilesize()})  </div>
                    {/foreach}    
                {/if}  
          </td>  
          <td class="CustomerMessage Read" id="{$item->get('id')}">
              {if !$item->isRead()}
                  <i class="fa fa-circle text-danger"></i>
              {/if}    
          </td>  
          <td>       
            {$item->getFormatter()->getCreatedAt()->getFormatted()}
        </td>       
            <td>
              {if !$item->isSender()}
              <a href="#" class="list-action text-info Reply" id="{$item->get('id')}"  title="{__('Reply')}"><i class="fa fa-reply"></i></a>
              {/if}
              <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('View')}"><i class="fa fa-search"></i></a>             
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('subject')}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
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
    
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
 
        <div id="Modal-Message" class="modal" role="dialog">
        <div class="modal-dialog modal-lg">    
            <div class="modal-content">
                <span class="close" id="Modal-Message-Close">&times;</span>   
                <div id="Modal-Message-ctn" class="tab-content">            
                </div>
            </div>
        </div>
    </div>     
<script type="text/javascript">
    
      $("#Modal-Message-Close").click(function () {  $("#Modal-Message").hide();   });
    
    
        function change(action,resp) {
               $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                    $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                    $("."+action+"[id="+this+"]").attr('name',resp.value);
               });
       }
    
    
        var created_at_dates = $( ".Range.CreatedAtDate#created_at_from, .Range.CreatedAtDate#created_at_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "created_at_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    created_at_dates.not( this ).datepicker( "option", option, date );
        } } );
      
{* =================================== PAGER/FILTER ======================================================== *}
    
      function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },   
                                    notequal: { },                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            $(".notequal option:selected").each(function() { params.filter.notequal[$(this).parent().attr('name')] =$(this).val(); });
            return params;                  
        }
        
         function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('customers_messager_ajax',['action'=>'ListPartialMessage'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });
        
        $(".equal").change(function() { return updateFilter(); });
        
         $(".notequal").change(function() { return updateFilter(); });
        
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
         $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_messager_ajax',['action'=>'ListPartialMessage'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $(".filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_messager_ajax',['action'=>'ListPartialMessage'])}",
                                 target: "#actions"
                });
        });
         
    $("#init").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('customers_messager_ajax',['action'=>'ListPartialMessage'])}",               
                    target: "#actions"
              });              
   }); 

{* =================================== ACTIONS ======================================================== *}
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { CustomerMessage : $(this).attr('id') },                               
                                  url:"{url_to('customers_messager_ajax',['action'=>'ViewMessage'])}",                                                       
                                  target :"#Modal-Message-ctn",
                                  success: function () { $("#Modal-Message").show();  } 
                        });
          });
          
          
     $(".Reply").click( function () {                    
                  return $.ajax2({ data : { CustomerMessage : $(this).attr('id') },                               
                                  url:"{url_to('customers_messager_ajax',['action'=>'ReplyMessage'])}",                                                       
                                  target :"#Modal-Message-ctn",
                                  success: function () { $("#Modal-Message").show(); }
                      });        
    });
      
           
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Message \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ CustomerMessage: $(this).attr('id') },
                                 url :"{url_to('customers_messager_ajax',['action'=>'DeleteMessage'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteMessage') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });    
     
</script>
  