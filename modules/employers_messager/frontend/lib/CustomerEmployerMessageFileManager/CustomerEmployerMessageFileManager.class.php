<?php

class CustomerEmployerMessageFileManager extends CustomerMessageFileManager {
    
    
     function getFile()
    {
        return new FileObject2(array(
                 "path"=>$this->getDirectory(),
                 "file"=>$this->getItem()->get('file'),
                 "urlPath"=>url_to("employers_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'frontend'),
                 "url"=>url_to("employers_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'frontend')
              ));
    }
}
