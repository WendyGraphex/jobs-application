<?php

class cron_test2Action extends cronAction {
    
    function execute()
    {
     // echo "task cron=".__METHOD__."\n" ;
      sleep(2);
      $this->getCron()->getReport()->addMessage("ok impeccable");
    }
}
