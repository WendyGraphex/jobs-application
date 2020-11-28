<?php

return array(
    
  "site_comments"=>array("pattern"=>'/comments',"module"=>"site_comment","action"=>"comments"),
    
  "site_comment_ajax"=>array("pattern"=>'/module/comment/{action}',"module"=>"site_comment","action"=>"ajax{action}","requirements"=>array("action"=>".*")),   
);

