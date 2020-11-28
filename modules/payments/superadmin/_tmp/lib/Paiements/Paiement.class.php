<?php

class payment extends paymentAdminBase {
     
    function register()
    {
        $this->save();
    }
    
    function unregister()
    {
      //  $this->delete();
        $this->set('is_active','NO');
        $this->save();
    }
    
   
   
}
