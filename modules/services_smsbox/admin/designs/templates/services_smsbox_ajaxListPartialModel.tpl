{messages}
<div class="content-header row">
  <div class="content-header-left col-md-6 col-12 mb-2">
      <h3 class="content-header-title mb-0">{__('Modèles')}</h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
      <div class="media width-250 float-right">
        <div class="media-left media-middle">
          <div id="sp-bar-total-sales"></div>
        </div>
        <div class="media-body media-right text-right">
        
          <a href="#" class="btn btn-primary float-right" id="New" title="{__('Nouveau')}" >
              <i class="fa fa-plus"></i>
              {__('Nouveau')}</a>   
        
        </div>
      </div>
    </div>
</div>
  
{* {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}*}
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
        <div class="heading-elements">
            <ul class="list-inline mb-0">
                <li><a><i class="fa fa-search" id="filter"></i></a></li>
                <li><a><i class="fa fa-sync" id="init"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="card-content collapse show">
        <div class="card-body">   
          <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped"> 
                <thead>
                     <tr class="list-header">
                        <th>#</th>                        
                         <th>{__('Nom')}
                               <div>             
                             </div> 
                         </th>
                          <th>{__('Actions')}</th>
                     </tr>
                </thead>  
                <tr>
                    <td>                        
                    </td>                     
                     <td>                        
                    </td>
                     <td>                        
                    </td>
                </tr>
                  {foreach $pager as $item}
                  <tr class="Model list {if $item->get('status') =="DELETE"} LigneBarre  {/if}" id="{$item->get('id')}">
                       <td class="Model-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                     
                      <td>
                          {$item->get('name')}
                      </td>
                      <td>                 
                        {*<button class="btn btn-float btn-square btn-outline-secondary"><i class="fa fa-edit"></i></button> *}
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="fa fa-align-justify"></span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                          <a class="dropdown-item Edit" id="{$item->get('id')}" href="#"><span class="fa fa-edit"></span>Modifier</a>                                                        
                             <a class="dropdown-item Delete"  id="{$item->get('id')}" name="{$item->get('name')}" href="#"><span class="fa fa-trash-alt"></span>Poubelle</a>
                                <a class="dropdown-item Status"  id="{$item->get('id')}" name="{$item->get('status')}" href="#"><i class="StatusIcon fa fa-{$item->getStatusAwe()}" id="{$item->get('id')}"/><span class="StatusText" id="{$item->get('id')}">{$item->getStatusText()}</span></a>

                            </div>
                        </div>
                      </td> 
                  </tr>
                  {/foreach}
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{if !$pager->hasItems()} 
     {__("Aucun résultat")}
{/if}        
 <script type="text/javascript">          
         
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },                                                                                                                                   
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialModel'])}" ,
                            target: "#actions"
                             });
        }
    
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('Résultats')}":"{__('Un résultat')}"));
           $("#end_result").html($(".count:last").html());
        }
                   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
          $("#init").click(function() {                 
               $.ajax2({ url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialModel'])}",
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
          
          $("[name=nbitemsbypage],[name=is_active]").change(function() { return updateFilter(); }); 
                           
           
          $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialModel'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 target: "#actions"
                });
          });
          {* =====================  A C T I O N S =============================== *}


     $(".Status").click( function () {
         return $.ajax2({
             data : { SmsBox : { id : $(this).attr('id'), value: $(this).attr('name'), token : '{mfForm::getToken('ChangeStatusForm')}' } },
             url: "{url_to('services_smsbox_ajax',['action'=>'ChangeStatusSmsModel'])}",
             success : function (resp)
             {
                 if (resp.action !='ChangeStatusSmsModel') return ;
                 $(".Status[id="+resp.id+"]").attr('name',resp.state.status);
                 $(".StatusIcon[id="+resp.id+"]").removeClass('fa-'+resp.state.delete).addClass('fa-'+resp.state.active);
                 $(".StatusText[id="+resp.id+"]").html(resp.state.text);
                 if(resp.state.status=="ACTIVE"){
                     $(".list[id="+resp.id+"]").removeClass('LigneBarre');
                 }else{
                   $(".list[id="+resp.id+"]").addClass('LigneBarre');
                 }
             }
         });
     });


     $(".Delete").click( function () {
         if (!confirm('{__("Le modèle de verre \"#0#\" va être supprimée. Confirmez vous ?")}'.format($(this).attr('name')))) return false;
         return $.ajax2({ data :{ SmsBox: $(this).attr('id') },
             url :"{url_to('services_smsbox_ajax',['action'=>'DeleteSmsModel'])}",
             success : function(resp) {
                 if (resp.action!='DeleteSmsModel') return ;
                 $(".list[id="+resp.id+"]").remove();
                 if ($('.list').length==0)
                     return $.ajax2({ url:"{url_to('services_smsbox_ajax',['action'=>'ListPartialSmsModel'])}",
                     });
                 updatePager(1);
             }
         });
     });



        $("#New").click( function () {             
          return $.ajax2({                    
            url: "{url_to('services_smsbox_ajax',['action'=>'NewModel'])}",
            target: "#actions"
          });
        });

         $(".Edit").click( function () {
          return $.ajax2({      
            data : { SmsBoxModel : $(this).attr('id') },
            url: "{url_to('services_smsbox_ajax',['action'=>'ViewModel'])}",
            target: "#actions"
          });
        });
 </script>    

