 <div>{$meeting->getCustomer()}</div>
{messages class="customers-email-errors"}
<h3>{__('Emails')}</h3>    
{if $meeting->isLoaded()}
{*<div>
  <a href="#" class="btn" id="CustomerEmail-New" title="{__('new email')}" ><img  src="{url('/icons/new.gif','picture')}" alt="{__('new')}"/>{__('New email')}</a>   
</div> *}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="Email"}
<button class="btn-table" id="CustomerEmail-filter">{__("Filter")}</button>   
<button class="btn-table" id="CustomerEmail-init">{__("Init")}</button>
<table class="tabl-list" cellpadding="0" cellspacing="0">     
    <tr class="list-header">
    <th>#</th>
    {*    <th>
            <span>{__('id')|capitalize}</span>
            <div>
                <a href="#" class="CustomerEmail-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="CustomerEmail-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
        </th>  *}     
        <th>
            <span>{__('date')|capitalize}</span>              
        </th>         
        <th>
            <span>{__('sent at')|capitalize}</span>      
            
        </th> 
        <th>
            <span>{__('subject')|capitalize}</span>      
            
        </th>
        <th> <span>{__('send by')|capitalize}</span>      
        </th>  
        <th><span>{__('actions')|capitalize}</span>  
        </th>
    </tr>   
    <tr class="input-list">
    </tr>
    {foreach $pager as $item}
    <tr class="Email-list list"> 
        <td class="CustomerEmail-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>            
          {*  <td><span>{$item->get('id')}</span></td> *}
            <td>                
                 {$item->get('created_at')}
            </td>            
            <td>
                 {$item->getEmail()->get('sent_at')} 
            </td> 
            <td>
                 {$item->getEmail()->get('subject')} 
            </td> 
            <td>
                {$item->getUser()}{if $item->getUser()->isSuperAdministrator()}&nbsp;({__('Superadmin')}){/if} 
            </td>             
            <td>
                 <a href="#" title="{__('Edit')}" class="CustomerEmail-View" id="{$item->get('id')}">
                     <img  src="{url('/icons/edit.gif','picture')}" alt='{__("Edit")}'/></a> 
             {*    <a href="#" title="{__('Resend Email')}" class="CustomerMeetings-ResendEmail" id="{$item->get('id')}">
                     <img  src="{url('/icons/send_email16x16.gif','picture')}" alt='{__("Resend Email")}'/></a> *}
            </td>
    </tr>    
    {/foreach}  
</table> 
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="Email"}    
{if !$pager->getNbItems()}
     <span>{__('No email')}</span>
{/if} 
{else}
    <span>{__('Meeting is invalid.')}</span>
{/if}    
<script type="text/javascript">
 
 {* =====================  A C T I O N S =============================== *}  
      
         $(".CustomerEmail-View").click( function () { 
           
            return $.ajax2({
                data : { CustomerMeeting: "{$meeting->get('id')}", CustomerEmailHistory: $(this).attr('id') },                
                url: "{url_to('customers_communication_emails_ajax',['action'=>'ViewEmailForMeeting'])}",
                errorTarget: ".customers-email-errors",               
                loading: "#tab-site-dashboard-customers-meeting-loading",
                target: "#tab-customer-meetings-customer-emails-{$meeting->get('id')}"
       
           });
         });
         
         $(".CustomerMeetings-ResendEmail").click( function () {            
            return $.ajax2({
                data : { CustomerEmailHistory: $(this).attr('id') },                
                url: "{url_to('customers_communication_emails_ajax',['action'=>'ResendEmailForMeeting'])}",
                errorTarget: ".customers-email-errors",               
                loading: "#tab-site-dashboard-customers-meeting-loading",            
           });
         });
</script> 