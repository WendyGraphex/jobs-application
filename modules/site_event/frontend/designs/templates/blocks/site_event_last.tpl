<section class="ftco-section bg-light">
               <div class="container">
                   <div class="row justify-content-center mb-5 pb-3">
                       <div class="col-md-7 heading-section text-center ftco-animate">
                           <h2>{__('Events')}</h2>
                       </div>
                   </div>
                   <div id="SectionEvents" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
                       {foreach $last_events as $item_i18n}
                           {component name="/site_event/eventDisplay" tpl="home" item_i18n=$item_i18n}
                         {*   <div class="item">
                           <div class="blog-entry align-self-stretch">
                               <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                               </a>
                               <div class="SectionEventDivInfo">
                                   <div class="titleAndDate">
                                       <h4>Titre 1</h4>
                                       <span class="ClassFloatRight">22/08/2020</span>
                                   </div>
                                   <div>
                                       <span class="icon-my_location"></span> <span>Western City, UK</span>
                                       <button class="btn btn-primary BookEvent">Book Event</button>
                                   </div>
                               </div>
                           </div>
                       </div> *}
                           
                       {/foreach}    
                       
                     {*  <div class="item">
                           <div class="blog-entry align-self-stretch">
                               <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                               </a>
                               <div class="SectionEventDivInfo">
                                   <div class="titleAndDate">
                                       <h4>Titre 1</h4>
                                       <span class="ClassFloatRight">22/08/2020</span>
                                   </div>
                                   <div>
                                       <span class="icon-my_location"></span> <span>Western City, UK</span>
                                       <button class="btn btn-primary BookEvent">Book Event</button>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="item">
                           <div class="blog-entry align-self-stretch">
                               <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                               </a>
                               <div class="SectionEventDivInfo">
                                   <div class="titleAndDate">
                                       <h4>Titre 1</h4>
                                       <span class="ClassFloatRight">22/08/2020</span>
                                   </div>
                                   <div>
                                       <span class="icon-my_location"></span> <span>Western City, UK</span>
                                       <button class="btn btn-primary BookEvent">Book Event</button>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="item">
                           <div class="blog-entry align-self-stretch">
                               <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                               </a>
                               <div class="SectionEventDivInfo">
                                   <div class="titleAndDate">
                                       <h4>Titre 1</h4>
                                       <span class="ClassFloatRight">22/08/2020</span>
                                   </div>
                                   <div>
                                       <span class="icon-my_location"></span> <span>Western City, UK</span>
                                        <button class="btn btn-primary BookEvent">Book Event</button>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="item">
                           <div class="blog-entry align-self-stretch">
                               <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                               </a>
                               <div class="SectionEventDivInfo">
                                   <div class="titleAndDate">
                                       <h4>Titre 1</h4>
                                       <span class="ClassFloatRight">22/08/2020</span>
                                   </div>
                                   <div>
                                       <span class="icon-my_location"></span> <span>Western City, UK</span>
                                        <button class="btn btn-primary BookEvent">Book Event</button>
                                   </div>
                               </div>
                           </div>
                       </div>  *}
                   </div>
               </div>
           </section>
            
<script type="text/javascript">
     {JqueryScriptsReady}     
         
    $("#SectionEvents").owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                items: 4,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    },
                    1020: {
                        items: 4
                    }
                },
            });
            
    {/JqueryScriptsReady}        
</script>                   


