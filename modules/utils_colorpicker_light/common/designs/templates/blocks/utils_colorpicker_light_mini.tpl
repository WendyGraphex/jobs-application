{stylesheets}
<script type="text/javascript">
 
  {foreach $javascripts as $script=>$options}
      $.ajax({ 
              cache: true,
              async:false,
              dataType: "script",
              url: "{url("/module/`$options.module`/js/`$script`","web","admin")}"
          });
  {/foreach}
</script>