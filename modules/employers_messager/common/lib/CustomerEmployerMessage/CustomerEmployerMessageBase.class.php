<?php

class CustomerEmployerMessageBase extends CustomerMessageBase  {
    
     
        
    function delete()
    {       
        $this->set('employee_deleted_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }        
    
    function isSender()
    {
        return $this->get('sender')=='EMPLOYER';
    }
    
    function getFiles()
    {
        if ($this->files===null)
        {
            $this->files= new CustomerEmployerMessageFileCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('message_id'=>$this->get('id')))         
                ->setQuery("SELECT * FROM ".CustomerEmployerMessageFile::getTable().                   
                           " WHERE ".CustomerEmployerMessageFile::getTableField('message_id')."='{message_id}'".                                                   
                            ";")
                ->makeSqlQuery();  
             if (!$db->getNumRows())
                 return $this->files;
             while ($item=$db->fetchObject('CustomerEmployerMessageFile'))
             {
                 $this->files[$item->get('id')]=$item->loaded();
             }        
        }   
        return $this->files;
    }
}
