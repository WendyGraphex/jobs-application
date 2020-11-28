<?php


class EmployeePortfolioFileFrame  extends Pictures {
    
    
   function __construct(EmployeePortfolioDocument $item) {
        parent::__construct($item);
    }
    
     function hasPicture()
    {
        return $this->getItem()->hasPicture();
    }
    
    protected function getPicture($type="")
    {
        return new PictureObject3(array(
                 "path"=>$this->getItem()->getDirectory()."/".$type,
                 "picture"=>$this->getItem()->get('file'),
                 "urlPath"=>url("/data/employees/portfolio/documents/".$this->getItem()->get('id')."/".$type,"url","frontend"),
                 "url"=>url("/data/employees/portfolio/documents/".$this->getItem()->get('id')."/".$type."/".$this->getItem()->get('file'),"url","frontend")
              ));
    }
    
    
}
