<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Our services')}</title>
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all" href="{url('css/owl.carousel.min.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('css/owl.theme.default.min.css','web','frontend')}">*}
        <link rel="stylesheet" media="all" href="{url('css/magnific-popup.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/aos.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/ionicons.min.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/bootstrap-datepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/jquery.timepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/flaticon.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/icomoon.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">
        {* <link rel="stylesheet"  media="all" href="{url('css/dropzone.css','web','frontend')}"> *}       
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}   
        <link rel="stylesheet" media="all" href="{url('css/ui/1.12.1/jquery-ui.min.css','web','frontend')}">
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="border-bottom: 1px solid #f5f1f1;">    
            <div class="divAllInside">
                <div class="container">
                    {component name="/site_company/Display" tpl="logoCompany"}
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span>{__('Menu')}
                    </button>
                    {include file="./includes/event-header.tpl"}
                </div>
            </div>
        </nav>

        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <img src="/web/pictures/event-page.jpg" style="margin: 0 auto;display: block;max-width: 100%;" />
            <div style="text-align: center;background-color: rgb(173, 155, 79);margin: 30px 0px 30px 0px;padding: 17px;">
                <h1 style="margin-bottom: 0px;font-weight: bolder;color: rgb(101, 68, 4);">{__('To Our Event Users')}</h1>
            </div>
            <div class="container">
                <p>
                    {__('We are thrilled to invite you to take a tour to our event page. The page includes, but not limited to: <br/>
                Conferences, Job fares, and all type of events that we are going to have throughout the year. <br/>
                All the activities and events we are invited to are in the calendar as well.')}<span id="showTextEvent" style="padding: 10px;color: #222;font-size: 20px;cursor: pointer;text-align: center;">{__('See more.....')}</span>
                </p>
            </div>
            <div id="TextEvent" style="margin-bottom: 70px;display: none;">
                <div class="container" style="font-weight: bold;">
                    <p>
                        {__('Meet the CEO: </br>
                    If you want to book the CEO for an event, conference, job fare, or you want to meet with him for business purposes.<br/>
                    Please take time to go through the calendar to see if he’s not already booked on the day of your event.<br/>
                     You can also, contact the team for arrangements at: contact@graphex.net for more details. <br/> ')}
                    </p>
                    <p>
                        {__('We are thrilled to invite you to take a tour to our event page. The page includes, but not limited to: Conferences, Job fares, and all type of events that we are going to have throughout the year. All the activities and events we are invited to are in the calendar as well. Meet the CEO: If you want to book the CEO for an event, conference, job fare, or you want to meet with him for business purposes.  Please take time to go through the calendar to see if he’s not already booked on the day of your event. You can also, contact the team for arrangements at: contact@graphex.net for more details. We have paid events, and free events as well. If you are going to book an event, even if the event is free, you have to go through the same process, As if you were going to buy it. The only difference, you will put 0.00 (zero dollar) at the time of booking.')}
                    </p>
                    <p>
                        {__('When you attend our conferences, <br/>
                    This will help you scale into the untapped potential into our platform and other possible business opportunities.<br/>
                    You will be shown how to create an account, give you the tools you need to make you become successful on Graphex Technology. <br/> 
                    This would attract more people into your Graphex portfolio and profile.  <br/>
                    You will be directed as how to properly save and invest in Graphex, thus helping you grow financially.  <br/>
                    You will be given the chance to learn how to properly navigate the site just so you can potentially and efficiently successful.  <br/> ')}
                    </p>
                    <p>
                        {__('By attending our events, you will have the chance to grow both career-wise and also investment wise.<br/>  
                    Your presence at our events will be much appreciated. <br/>')}
                    </p>
                    <p>
                        {__('Choose the event you would like to attend, we’ll see you there.<br/> 
                    Have fun!<br/>')}
                    </p>
                    <p>
                        {__('Graphex Technology Team.')}
                    </p>
                </div>
                <div style="text-align: center;margin-bottom: 25px;">
                    <a href="{link_i18n("customers_contact")}" class="btn btn-primary">{__('Contact us')}</a>
                </div>
                <div style="width: 20%;margin: 0 auto;">
                    <img src="/web/pictures/event-page-bottom.jpg" style="max-width: 100%;">
                </div>
            </div>
            <div id="page-wrapper" class="container"> 
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                        <h2>Events</h2>
                    </div>
                </div>
                <div id="SectionEvents-onEvents">
                    <div style="margin: 25px;">
               <div class="global-class-drop dropdown budget-drop">
                            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Price')}
                                <span class="caret"></span></button>
                            <ul class="myDropDownDrop dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
                
                <div id="slider-range"></div>   <br>                               
                <input type="number" value="{$formFilter.range.price.min}" min="{$formFilter->range['price']->getOption('min')}" max="{$formFilter->range['price']->getOption('max')}" oninput="validity.valid||(value='0');" id="min_price" data-id="min" name="price" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;" />
                <input type="number" value="{$formFilter.range.price.max}" min="{$formFilter->range['price']->getOption('min')}" max="{$formFilter->range['price']->getOption('max')}" oninput="validity.valid||(value='10000');" id="max_price" data-id="max" name="price" class="form-control Filter Range" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>                    
                <div style="text-align: right;">
                    <button class="btn btn-success ApplyBtn">{__('Apply')}</button> 
                </div>           
            </ul>
                        </div>
                          <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Language')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="lang" data-selected="{$formFilter.in.lang->getValue()}">
                <input type="text" class="FilterSearch form-control" name="lang" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>    
                    {foreach $formFilter->in.lang->getChoices()->toArray() as $key=>$language}                   
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.lang->getArray()->in($key)}active{/if} Filter In Options" name="lang" data-value="{$key}">{$language}</a></li>                    
                    {/foreach}  
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
            
                       <div class="global-class-drop dropdown country-drop">
            <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">{__('Country')}
            <span class="caret"></span></button>
            <ul class="myDropDownDrop dropdown-menu Filter In ulFilter" name="country" data-selected="{$formFilter.in.country->getValue()}">
                <input type="text" class="FilterSearch form-control" name="country" placeholder="{__('Search')}" style="margin-bottom: 10px;height: 35px !important;font-size: 14px;width: 150px;"/>
                <div>
                    {foreach $formFilter->in.country->getChoices()->toArray() as $key=>$country}
                        <li clas="item"><a href="javascript:void(0);" class="dropdown-item {if $formFilter.in.country->getArray()->in($key)}active{/if} Filter In Options Country" name="Country" data-value="{$key}">{$country}</a></li>
                    {/foreach}
                </div>
                <div style="text-align: right;"><button class="ApplyBtn btn btn-success" style="padding: 4px;font-size: 13px;">{__('Apply')}</button></div>
            </ul>
        </div>
            </div>
                    <div class="row">
                        {foreach $pager as $item_i18n}
                            {component name="/site_event/eventDisplay" event_i18n=$item_i18n}                           
                        {/foreach}                                                
                    </div>
                </div>
            </div>                
        </section> 
        {component name="/site_event_cart/AddToCartBtnActions"}
        
        {component name="/customers_newsletter/signin"}	                                          
        {include file="./includes/event-footer.tpl"}
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <script src="{url('js/jquery-migrate-3.0.1.min.js','web','frontend')}"></script>  
        <script src="{url('js/popper.min.js','web','frontend')}"></script>
        <script src="{url('js/bootstrap.min.js','web','frontend')}"></script>
        {*<script src="{url('js/jquery.easing.1.3.js','web','frontend')}"></script>*}
        <script src="{url('js/jquery.waypoints.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.stellar.min.js','web','frontend')}"></script> 
        <script src="{url('js/owl.carousel.min.js','web','frontend')}"></script>
        <script src="{url('js/jquery.magnific-popup.min.js','web','frontend')}"></script>
        <script src="{url('js/aos.js','web','frontend')}"></script>
        <script src="{url('js/jquery.animateNumber.min.js','web','frontend')}"></script> 
        {* <script src="{url('js/bootstrap-datepicker.js','web','frontend')}"></script>  *}
        <script src="{url('js/scrollax.min.js','web','frontend')}"></script>  
        {component name="/utils/UIresources" version="1.11.3"}
        {* <script src="{url('js/google-map.js','web','frontend')}"></script>*}
        <script src="{url('js/main.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web')}"></script>  
        <script src="{url('js/ui/1.12.1/jquery-ui.min.js','web','frontend')}" type="text/javascript"></script>     
 
 <script type="text/javascript">
     
    {*$("#SectionEvents-onEvents").owlCarousel({
        loop: false,
        autoPlay: 3000,
        autoplay: false,
        items: 4,
        nav: true,
        dots: true,
        margin: 30,
        navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
    });*}
        
        function getFilterParameters()
        {
            var params={    {*if $node_i18n}EmployeeCategoryI18n : '{$node_i18n->getUrlString()}', {/if*}
                            filter: {   equal: {  }, in : { }, range : { },                               
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                sortby : $(".Filter.SortBy.Options.active").attr('data-value'),
                                token:'{$formFilter->getCSRFToken()}'
                         } };  
            $(".Filter.Equal.Options.active").each(function () { params.filter.equal[$(this).attr('name')]=$(this).attr('data-value'); }); 
                        
            $(".Filter.In.Options.active").each(function () {                
                var name=$(this).parent().parent().parent().attr('name');
                if (!params.filter.in[name]) params.filter.in[name]= [];
                if (!$(this).attr('data-value')) return ;
                params.filter.in[name].push($(this).attr('data-value')); 
            });
            $(".Filter.Range").each(function () {  
                if (!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('data-id')]=$(this).val();
            });
            return params;                  
        }
        
        
        function updateFilter()
        {        
            $("#ftco-loader").addClass('show');
            return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('site_event_',['action'=>'events'])}" ,                          
                            target: "#page-wrapper",
                            success : function (resp)
                            {
                                $("#ftco-loader").removeClass('show');
                            }
            });
        }
        
        $(".Filter.Equal.Options").click(function () {          
             $(".Filter.Equal.Options."+$(this).attr('data-name')).removeClass('active');             
             $(this).addClass('active'); //.parent().parent().attr('data-selected',$(this).attr('data-value'));
              return updateFilter();
        });
        
        
        $(".Filter.In.Options").click(function (e) {
            $(this).toggleClass('active');  
            e.stopPropagation();
        });
        
        $(".ApplyBtn").click(function () {          
               return updateFilter();
        });
        
        $(".Filter.SortBy.Options").click(function () {          
            $(".Filter.SortBy.Options").removeClass('active');             
            $(this).addClass('active');           
            return updateFilter();
        });
        
        $(".FilterSearch").on("keyup", function() {
        var value = $(this).val().toLowerCase();
            $(".ulFilter[name="+$(this).attr('name')+"] li").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
    
    
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
        
    
    $("#showTextEvent").click( function () { 
        $("#TextEvent").toggle();
    }); 
    
 </script>
 
</body>

</html>




