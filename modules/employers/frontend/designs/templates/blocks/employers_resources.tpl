<script type="text/javascript">
  {JqueryScriptsReady}
                                 
                    ws = new WebSocket('ws{if $_request->isSecure()}s{/if}://{$_request->getHost()}:{$settings->get('port','6969')}');                       
                    ws.onopen = () => {
                    //  console.log('Connection detected....!');
                      ws.send(JSON.stringify({ employer: {$user->getGuardUser()->get('id')} }));
                    }
                    
                    ws.onmessage = ({ data }) => {
                      //  console.log(data);
                    };
                    
                    ws.onclose = function() {
                      ws.send(JSON.stringify({ employer: {$user->getGuardUser()->get('id')} }));  
                      ws = null;
                    //  console.log('Connection Closed....!');
                    }
           
  {/JqueryScriptsReady}   
</script>
