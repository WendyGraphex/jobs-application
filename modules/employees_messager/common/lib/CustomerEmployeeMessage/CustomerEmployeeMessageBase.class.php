<?php

class CustomerEmployeeMessageBase extends CustomerMessageBase  {
    
     
        
    function delete()
    {       
        $this->set('employee_deleted_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }
    
    function getFiles()
    {
        if ($this->files===null)
        {
            $this->files= new CustomerEmployeeMessageFileCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('message_id'=>$this->get('id')))         
                ->setQuery("SELECT * FROM ".CustomerEmployeeMessageFile::getTable().                   
                           " WHERE ".CustomerEmployeeMessageFile::getTableField('message_id')."='{message_id}'".                                                   
                            ";")
                ->makeSqlQuery();  
             if (!$db->getNumRows())
                 return $this->files;
             while ($item=$db->fetchObject('CustomerEmployeeMessageFile'))
             {
                 $this->files[$item->get('id')]=$item->loaded();
             }        
        }   
        return $this->files;
    }
    
    function isSender()
    {
        return $this->get('sender')=='EMPLOYEE';
    }
    
    
}
