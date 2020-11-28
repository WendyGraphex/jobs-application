<?php

return array("rule1"=>array("pattern"=>'"^/?((..)/)?admin/(images)/(.*)$"',"replace"=>"/\\1admin/pictures/\\4"),
             "rule2"=>array("pattern"=>'"^/?((..)/)?admin/(photos)/(.*)$"',"replace"=>"/\\1admin/pictures/\\4"),     
  );