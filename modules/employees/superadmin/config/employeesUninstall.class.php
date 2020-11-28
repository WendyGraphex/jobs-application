<?php

class employeesUninstall extends mfModuleInstall {

    function execute()
    {             
       $file=$this->getModelsPath()."/drop.sql";
       if (is_readable($file))
           ImportDatabase::getInstance()->import($file);
       return true;
    }
    
}