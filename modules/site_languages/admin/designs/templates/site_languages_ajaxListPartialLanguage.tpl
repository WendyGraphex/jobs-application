<!-- Begin page heading -->
          <div class="row admin-header-container">
            <div class="col-sm">
                <h3 class="admin-header-big-text">{__('Languages')} </h3>
                <h3 class="admin-header-small-text">{__('Languages management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">
                  <a class="btn btn-success admin-header-button" href="#" id="Add">
                      <i style="margin-right: 5px;" class="fa fa-plus"></i>
                      {__('Add language')}
                  </a>
                </div>
            </div>  
          </div>          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
        <div class="breadcrumb-title">
            <p>
                <i class="fa fa-home" style="color: #37bc9b;"></i>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Languages')}
            </p>
        </div> 
          <!-- End breadcrumb -->

 {alerts}         
          <div class="table-responsive bg-white px-1 py-2">
              
              <div class="col-md-12">
                
                    <div class="float-left w-50">
                          {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                    </div>
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             </div>
              
              
          
            <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                                <thead class="bgSpec">
                                <tr class="list-header">
                                <th>#</th>
                                <th>{__('ID')}              
                                    <div style="float: right;">
                                           <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                                           <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                                       </div>
                               </th>                            
                               <th class="sorting" style="width: 1082px;">{__('Name')}</th>     
                               <th class="sorting">{__('Active?')}</th>     
                              <th class="sorting" style="width: 100px;">{__('Actions')}</th></tr>
                        </thead>
                        <tbody> 
                        {foreach $pager as $item}
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count" id="{$item->get('id')}">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                                <td>{$item->get('id')}</td>
                                <td style ="word-break:break-all;">{$item->getCode()->getFormatted()->ucfirst()}</td>    
                                 <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
                                </td>  
                                <td>                                                                     
                                  <a href="#" id="{$item->get('id')}" name="{$item->getCode()->getFormatted()->ucfirst()}" class="list-action text-danger Delete" data-confirm="{__('Are you sure ?')}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        {/foreach}    
                        </tbody>
                    </table>
                </div>
            </div>      
            {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
            
          </div>

                        
                        
<script type="text/javascript">

    function change(action,resp) {
               $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                    $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                    $("."+action+"[id="+this+"]").attr('name',resp.value);
               });
       }

    function getFilterParameters()
    {
        var params={ filter: {  order : { },
                    search : {  },
                    equal: {   },
                    nbitemsbypage: $("[name=nbitemsbypage]").val(),
                    token:'{$formFilter->getCSRFToken()}'
                } };
        if ($(".order_active").attr("name"))
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
        $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
        $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
        return params;
    }

    function updateFilter()
    {
        return $.ajax2({ data: getFilterParameters(),
            url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}" ,          
            target: "#actions"
        });
    }

    function updatePager(n)
    {
        var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
        var records_by_page=$("[name=nbitemsbypage]").val();
        var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
        $(".count").each(function(id) { $(this).html(start+id); }); // Update index column
        var nb_results=parseInt($("#nb_results").html())-n;
        $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
        $("#end_result").html($(".count:last").html());
    }


    {* =====================  P A G E R  A C T I O N S =============================== *}

    $("#init").click(function() {
        $.ajax2({ url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}",            
            target: "#actions"});
    });

    $('.order').click(function() {
        $(".order_active").attr('class','order');
        $(this).attr('class','order_active');
        return updateFilter();
    });

    $(".search").keypress(function(event) {
        if (event.keyCode==13)
            return updateFilter();
    });

    $("#filter").click(function() { return updateFilter(); });

    $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); });


    $(".pager").click(function () {
        return $.ajax2({ data: getFilterParameters(),
            url:"{url_to('languages_ajax',['action'=>'ListPartialLanguage'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),        
            target: "#actions"
        });
    });
    {* =====================  A C T I O N S =============================== *}

    $(".View").click( function () {
        return $.ajax2({ data : { Language : $(this).attr('id') },           
            url:"{url_to('languages_ajax',['action'=>'ViewLanguage'])}",         
            target: "#actions"});
    });                  
     
    $(".Delete").click( function () {
        if (!confirm("{__('Language \"#0#\" will be deleted. Confirm ?')}".format($(this).attr('name')))) return false;
        return $.ajax2({ data :{ SiteLanguage: $(this).attr('id') },
            url :"{url_to('languages_ajax',['action'=>'DeleteLanguage'])}",           
            success : function(resp) {
                   if (resp.action!='DeleteLanguage') return ;
               
                     $(".list[id="+resp.id+"]").remove();
                     if ($('.list').length==0) return updateFilter();
                     updatePager(1);               
            }
        });
    });


       $("#Add").click( function () {             
            return $.ajax2({                    
                url: "{url_to('languages_ajax',['action'=>'AddLanguage'])}",               
                target: "#actions"
           });
         });
     
       $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { SiteLanguage : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('languages_ajax',['action'=>'ChangeIsActiveLanguage'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveLanguage') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });       
</script>
                        