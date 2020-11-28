
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Academy')}</h3>
              <h3 class="admin-header-small-text">{__('Academy Courses management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">        
                  {* <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New course')}</a> *}
                 {* <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                  <a class="btn btn-success admin-header-button" id="Statistics" href="#"><i class="fa fa-chart-bar"></i> {__('Statistics')}</a> *}
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>                
                    <i class="fa fa-home" style="color: #37bc9b;"></i>           
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Academy')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Courses')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class=" bg-white px-2 py-2">
             <div class="col-md-12 padd-col">
                 <div>                    
             <div class="form-group" style="max-width: 200px;min-width: 130px;">
    
    <select class="SelectListLanguages equal Select" name="lang" id="SelectListLanguages">
       {foreach $formFilter->equal.lang->getChoices() as $key=>$language}
           <option class="SelectListLanguagesOptions" {if $key==$formFilter.equal.lang->getValue()}selected{/if} 
                   id="{$key}" value="{$key}" name="{$language}"> 
                {$language}
           </option>
       {/foreach}
    </select>
</div> 
 
         </div>
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}                       
                 </div>
                 <div class="float-right w-50">                   
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
                 </div>
             </div>

      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
          {*
          'lang','url','title','short_description','content','reference','price',
                                    'number_of_views','number_of_documents','ranking','is_validated','published_at','refused_at',
                                    'expired_at','state','status','teacher_user_id'
          
          *}
      <thead class="bgSpec">
         <tr role="row">
             <th  class="sorting_asc">
                #    
             </th>  
              <th>
                <span>{__('Reference')}</span>
              <div class="position-relative float-right mr-2">
               
              </div>
            </th>           
            <th>
                <span>{__('Teacher')}</span>  
              <div class="position-relative float-right mr-2">
               
              </div>
            </th>
            <th>
                <span>{__('Course')}</span>  
              <div class="position-relative float-right mr-2">
             
              </div>
            </th>     
             <th>
                <span>{__('Price')}</span>
            </th>
             <th>
                <span>{__('Created at')}</span>
            </th>
              <th>
                <span>{__('Committed?')}</span>
            </th>
            <th>
                <span>{__('Refused?')}</span>
            </th>
            <th>
                <span>{__('Published?')}</span> 
              <div class="position-relative float-right mr-2">               
              </div>
            </th>          
            <th>
                <span>{__('Actions')}</span> 
            
            </th>
         </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>           
              <td></td>           
              <td></td>
              <td></td> 
                <td></td> 
               <td></td>             
               <td>
               {html_options class="equal form-control Select" name="committed_at" options=$formFilter->equal.committed_at->getChoices()  selected=$formFilter.equal.committed_at}                         
               </td> 
               <td>
                     {html_options class="equal form-control Select" name="refused_at" options=$formFilter->equal.refused_at->getChoices()  selected=$formFilter.equal.refused_at}                         
               </td> 
              <td>
                    {html_options class="equal form-control Select" name="published_at" options=$formFilter->equal.published_at->getChoices()  selected=$formFilter.equal.published_at}                         
                </td>   
                <td>
             
          </td>
          </tr>      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>      
            <td>
             {$item->get('reference')} 
          </td>         
              <td>{$item->getTeacherUser()->getFormatter()->getName()} ({$item->getTeacherUser()->getFormatter()->getNumberOfCourses()}) 
                                     <div>{$item->getTeacherUser()->get('email')} / {$item->getTeacherUser()->get('mobile')}</div>
                                 </td>                 
          <td>
              <a href="{$item->getUrl()}">{$item->getFormatter()->getTitle()->ucfirst()}</a>
          </td>
          <td>{$item->getFormatter()->getPrice()->getAmount()}</td>
                   
              <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>            
          <td>
               {if $item->hasCommittedAt()}
                    {$item->getFormatter()->getCommittedAt()->getText()}
                {else}
                    {__('---')}
                {/if}
          </td> 
         <td>
                {if $item->hasRefusedAt()}
                   {$item->getFormatter()->getRefusedAt()->getText()}
               {else}
                   {__('---')}
               {/if}
           </td>  
           <td>
                {if $item->hasPublishedAt()}
                   {$item->getFormatter()->getPublishedAt()->getText()}
               {else}
                   {__('---')}
               {/if}
           </td>  
                <td>
              <a href="#" class="list-action text-info Display" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-search" aria-hidden="true"></i></a>                                                                        
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

       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}    
  
  </div>

<script type="text/javascript">
    
      $("#SelectListLanguages").chosen();
        
    var updated_dates = $( " .Range.UpdatedAtDate#updated_at_from, .Range.UpdatedAtDate#updated_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "updated_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				updated_dates.not( this ).datepicker( "option", option, date );
    } } );
    
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },
                                    range : { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
             $(".Range.Date").each(function () {
               // params.filter.range[$(this).attr('name')]= { }
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('customers_academy_ajax',['action'=>'ListPartialCourse'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });
                
        $("[name=nbitemsbypage],.equal.Select").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_academy_ajax',['action'=>'ListPartialCourse'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $("#init").click(function () {                     
                return $.ajax2({   url:"{url_to('customers_academy_ajax',['action'=>'ListPartialCourse'])}",
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_academy_ajax',['action'=>'ListPartialCourse'])}",
                                 target: "#actions"
                });
        });                              
            
      $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
           
             $(".Display").click( function () {                    
                  return $.ajax2({ data : { CustomerAcademyCourseI18n : $(this).attr('id') },                               
                                  url:"{url_to('customers_academy_ajax',['action'=>'DisplayCourseI18n'])}", 
                                  target: "#actions"});
          });
    
     
</script>
    