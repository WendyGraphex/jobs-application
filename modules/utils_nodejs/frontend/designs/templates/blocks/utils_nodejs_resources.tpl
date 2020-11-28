<script type="text/javascript">
  {JqueryScriptsReady}
                                 
                    ws = new WebSocket('ws://{$ip}:6969');
                    ws.onopen = () => {
                      console.log('Connection detected....!');
                      ws.send(JSON.stringify({ user: 1 }));
                    }
                    
                    ws.onmessage = ({ data }) => {
                        console.log(data);
                    };
                    
                    ws.onclose = function() {
                      ws = null;
                      console.log('Connection Closed....!');
                    }
           
  {/JqueryScriptsReady}   
</script>