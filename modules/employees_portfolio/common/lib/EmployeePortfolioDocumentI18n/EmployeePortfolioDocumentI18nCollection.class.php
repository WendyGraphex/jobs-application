<?php

class EmployeePortfolioDocumentI18nCollection extends mfObjectCollection3 {
    
    protected $document =null;
    
    function __construct($data) {
        if ($data instanceof EmployeePortfolioDocument)
        {
             $this->document=$data;
             return parent::__construct();
        }
        parent::__construct($data);
    }
    
    function getDocument()
    {
        return $this->document;
    }
    
    function getAll()
    {
        if ($this->all===null)
        {    
          $this->all=new $this();
          $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('document_id'=>$this->getDocument()->get('id')))                
                ->setQuery("SELECT ".EmployeePortfolioDocumentI18n::getFieldsAndKeyWithTable(). " FROM ".EmployeePortfolioDocumentI18n::getTable().                                                 
                           " WHERE ".EmployeePortfolioDocumentI18n::getTableField('document_id')."='{document_id}' ".                                                                  
                           ";")               
                ->makeSqlQuery(); 
           if (!$db->getNumRows())
               return $this->all;
            while ($item=$db->fetchObject('EmployeePortfolioDocumentI18n'))
            {                            
                $this->all->set($item->get('lang'),$item->loaded());  
            } 
            $this->all->loaded();
        }
        return $this->all;        
    }
}

