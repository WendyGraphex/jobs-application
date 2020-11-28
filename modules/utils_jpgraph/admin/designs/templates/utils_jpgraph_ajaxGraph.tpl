
    <h3>Some Graphs</h3>
    
    <img src="data:image/png;base64,{$graph1->strokeBase64()}" />
    

    <a href="{url_to('utils_pdf_ajax',['action'=>'Pdf'])}" style="cursor:pointer;" id="pdf" >Génerer le graph en PDF--></a><br>
    
    <a href="{url_to('utils_html2pdf_ajax',['action'=>'Html2pdf'])}" style="cursor:pointer;"  >Génerer le graph en PDF avec HTML2PDF--></a>

<script type="text/javascript">
    
      
    /* $('#pdf').click(function(){                           
             return $.ajax2({                               
                              url : "{url_to('utils_pdf_ajax',['action'=>'Pdf'])}",
                              errorTarget: ".EmployeeStatus-errors",
                              loading: "#tab-site-dashboard-x-settings-loading",                         
                              target: "#page-wrapper" }); 
      });*/
    /*$("#pdf").click(function(){
        var image={ img:'data:image/png;base64,'+{$graph1->strokeBase64()} };
        console.log("hhh");
        /* return $.ajax2({
            data:image,
            url:"{url_to('utils_pdf_ajax',['action'=>'Pdf'])}"
        });*/
   /* } );*/
    
    
</script>  