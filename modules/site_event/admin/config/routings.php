<?php

return array(    
    "site_event_ajax"=>array("pattern"=>'/module/site/event/admin/{action}',"module"=>"site_event","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
    
    
    
    "site_event_event"=>array("pattern"=>'/event/{url}.html',
                            "module"=>"site_event",
                            "action"=>"event", 
                             "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")
                         ),
    
    
    
     "site_event_document_download"=>array("pattern"=>'/events/download/document/{id}/{file}',
                            "module"=>"site_event",
                            "action"=>"downloadDocument",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*")
                          ),
    
     "site_event_document_download_picture"=>array("pattern"=>'/events/download/document/pictures/{id}/{type}/{file}',
                            "module"=>"site_event",
                            "action"=>"downloadDocumentPicture",
                            "parameters"=>array("file"=>"{file}","id"=>"{id}","type"=>"{type}"),
                            "requirements"=>array("file"=>".*","id"=>"[0-9]*","type"=>"small|medium|thumb")
                          ),
  );
