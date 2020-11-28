<?php

class CustomerEmployeeMessageFileManager extends CustomerMessageFileManager {
    
    
     function getFile()
    {
        return new FileObject2(array(
                 "path"=>$this->getDirectory(),
                 "file"=>$this->getItem()->get('file'),
                 "urlPath"=>url_to("employees_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'frontend'),
                 "url"=>url_to("employees_messager_download",array('file'=>$this->getPathForUrl(),'id'=>$this->getItem()->get('id')),'frontend')
              ));
    }
}
