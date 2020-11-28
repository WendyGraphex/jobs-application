<?php


class CsvFileObject extends fileObject2 {
    
   
    function getInformation() {
          if (!$this->information)
           $this->information=new CsvFile($this->getFile());
       return $this->information;
    }
}

