<script type="text/javascript">
      
    {JqueryScriptsReady}  
    $(".FilterSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
        
        
        
         $('.Myadvert-carousel').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:1,
           // autoplay:true,
            autoplayTimeout:10000,
            autoplayHoverPause:true,
            nav : true,
            dots: true, //Make this true
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],           
        });  
       
       
       
       
       
        {*$(".videos-wrap").each(function() {
            var n = $(this).find(".video-carousel").length;
            if (n < 3) {
                $('.owlnav', this).css('display', 'none');
            }
        });*}
       
       
            
        $('.carousel-categories').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:6,
            loop:true,
            autoplay:true,
            autoplayTimeout:3000,
            autoplayHoverPause:true,
            nav : true,
            dots: false,
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
             responsive:{
                 1450:{
                    items:6,
                    nav:true,
                    loop:true
                },
                1384:{
                    items:5,
                    nav:true,
                    loop:true
                },
                1242:{
                    items:4,
                    nav:true,
                    loop:true
                },
                1000:{
                    items:3,
                    nav:true,
                    loop:true
                },
                400:{
                    items:2,
                    nav:true,
                    loop:true
                },
                0:{
                    items:1,
                    nav:true,
                    loop:true
                },
            },
        });  
       

   
        function getFilterParameters()
        {
            var params={    {if $node_i18n}EmployerCategoryI18n : '{$node_i18n->getUrlString()}', {/if}
                            filter: {  in : { }, equal: { },   range : { },                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                sortby : $(".Filter.SortBy.Options.active").attr('data-value'),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            $(".Filter.Equal.Options.active").each(function () { params.filter.equal[$(this).attr('name')]=$(this).attr('data-value'); });            
            $(".Filter.Range").each(function () {  
                if (!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('data-id')]=$(this).val();
            });
             $(".Filter.In.Options.active").each(function () {                
                var name=$(this).parent().parent().parent().attr('name');
                if (!params.filter.in[name]) params.filter.in[name]= [];
                if (!$(this).attr('data-value')) return ;
                params.filter.in[name].push($(this).attr('data-value')); 
            });        
            return params;             
        }
        
        function updateFilter()
        {          
            $("#ftco-loader").addClass('show');
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employers_ajax',['action'=>'ListPartialCategory'])}" ,                          
                            target: "#page-wrapper",
                             success : function (resp)
                                {                                    
                                    $("#ftco-loader").removeClass('show');
                                }
                             });
        }
        
        {*$(".Filter.Equal.Options").click(function () {          
             $(".Filter.Equal.Options."+$(this).attr('name')).removeClass('active');             
             $(this).addClass('active').parent().parent().attr('data-selected',$(this).attr('data-value'));
             return updateFilter();
        });*}
        
    {*  $(".Filter.Equal.Options").click(function (e) {          
             $(this).toggleClass('active');  
             e.stopPropagation();
        }); *}
        
        {*$(".Filter.Equal.Options.active").each(function () {                
            var name=$(this).parent().parent().attr('name');
            if (!params.filter.equal[name]) params.filter.equal[name]= [];
            if (!$(this).attr('data-value')) return ;
            params.filter.equal[name].push($(this).attr('data-value')); 
        });*}
        
        $(".Filter.Equal.Options").click(function () {          
             $(".Filter.Equal.Options."+$(this).attr('data-name')).removeClass('active');             
             $(this).addClass('active'); //.parent().parent().attr('data-selected',$(this).attr('data-value'));
              return updateFilter();
        });
        
        $(".Filter.In.Options").click(function (e) {          
             $(this).toggleClass('active');  
             e.stopPropagation();
        });
        
        
         $(".Filter.SortBy.Options").click(function () {          
             $(".Filter.SortBy.Options").removeClass('active');             
             $(this).addClass('active');           
             return updateFilter();
        });
        
        $(".ApplyBtn").click(function () {          
               return updateFilter();
        });                
        
        $(".pager").click(function () {         
                 $("#ftco-loader").addClass('show');
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCategory'])}?page="+$(this).attr('data-page'),                                
                                 target: "#page-wrapper",
                                  success : function (resp)
                                {                                    
                                    $("#ftco-loader").removeClass('show');
                                }
                });
        });
        
        $(".copyLink").tooltip({
            //trigger: 'click',
            placement: 'bottom',
            {*trigger: 'hover',*}
                    hide: {
                        delay: 2000,
                    },
        });

        $(".copyLink").click(function() {
            var n = $(".copyMe-"+$(this).attr('id')).text();
            $(".copied").attr("value", n);
            $(".copied").attr("type", "text").select();
            document.execCommand("copy");
            $(".copyLink-"+$(this).attr('id')).attr('data-original-title', 'Copied');
            alert("Link copied");
            //$(".copied").attr("type", "hidden");
            //$("#copyLink").tooltip('hide');
        });
        
    {if $mode=='mixed'}  
         {if $node->isRoot()} 
     
     $("#Employee").click(function () {          
         $("#ftco-loader").addClass('show');
         var params={   filter: {  order : { },  search : { },
                                 equal: { lang : $(".Filter.Equal[name=lang]").attr('data-selected') }, 
                                 range : { },                                
                                 nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                 token:'{mfForm::getToken('EmployeePartnerWorkCategoryFormFilter')}'
                         } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('partners_ajax',['action'=>'ListPartialCategoryEmployee'])}",                                
                                 target: "#page-ctn",
                                 success : function (resp)
                                {                                    
                                    $("#ftco-loader").removeClass('show');
                                }
                });       
        });  
        {else} 
    $("#ftco-loader").addClass('show');
         var params={   filter: {  order : { },  search : { },
                                 equal: { lang : $(".Filter.Equal[name=lang]").attr('data-selected') }, 
                                 range : { },                                
                                 nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                 token:'{mfForm::getToken('EmployeePartnerWorkCategoryFormFilter')}'
                         } };
                return $.ajax2({ data: params, 
                                 url:"{url_to('partners_ajax',['action'=>'ListPartialCategoryEmployee'])}",                                
                                 target: "#page-ctn",
                                 success : function (resp)
                                {                                    
                                    $("#ftco-loader").removeClass('show');
                                }
                });       
        });  
    
     {/if}
 {/if}
     
     
     $("#min_price,#max_price").off("paste keyup change");
          
	$("#min_price,#max_price").on("paste keyup change", function () {                                        	  
	  $("#slider-range").slider({ values: [ parseInt($("#min_price").val()), parseInt($("#max_price").val()) ]  });
	}); 
	
	$("#slider-range").slider({
		range: true,
		orientation: "horizontal",
		min: {$formFilter->range['budget']->getOption('min')},
		max: {$formFilter->range['budget']->getOption('max')},
		values: {$formFilter->getBudget()->toJson()},
		step: 100,
		slide: function (event, ui) {
		  if (ui.values[0] == ui.values[1]) 
			  return false;		  
		  $("#min_price").val(ui.values[0]);
		  $("#max_price").val(ui.values[1]);
		}
         });
     
     
     
    {/JqueryScriptsReady}  
</script>         