<?php

class EmployerAdvertDocument extends EmployerAdvertDocumentBase {
     
      function __construct($parameters = null,$user=null) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);      
        if ($parameters instanceof EmployerAdvert)      
            $this->set('advert_id',$parameters);
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);    
        if (is_array($parameters) && $user && isset($parameters['file']) && isset($parameters['id']))
            return $this->loadByIdAndFile($parameters['file'],$parameters['id'],$user);
        if (is_array($parameters) && isset($parameters['file']) && isset($parameters['id']))
            return $this->loadByIdAndPublicFile($parameters['file'],$parameters['id']);
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    
    function loadByIdAndFile($file,$id,$user)
    {      
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
    
     function loadByIdAndPublicFile($file,$id)
    {             
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}' AND is_public='Y'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
    
    
     function loadByIdAndEmployer($id,EmployerUser $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    static function getMediasForPager( $pager)
    {               
         foreach ($pager->getAdverts() as $advert)
            $advert->documents = new EmployerAdvertDocumentCollection();      
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array())         
           ->setQuery((string)mfQuery::getInstance()->select("*")
                                    ->from(self::getTable())
                                    ->where(self::getTableField('advert_id')." IN('".$pager->getAdverts()->getKeys()->implode("','")."') AND extension IN('png','jpg','jpeg','gif','svg')")
                                    ->whereIf(!$pager->getUser(),"is_public='Y'")
                                )
           ->makeSqlQuery(); 
       //  echo $db->getQuery();
          if (!$db->getNumRows())
                 return ;             
        while ($item=$db->fetchObject('EmployerAdvertDocument'))
        {   
            if (!$pager->getAdverts()->hasItemByKey($item->get('advert_id')))
                continue; 
            $pager->getAdverts()->getItemByKey($item->get('advert_id'))->getDocuments()->push($item->loaded());          
        }          
    }
    
    
    static function getMediasForCollection(EmployerAdvertCollection $collection)
    {        
         foreach ($collection as $advert)
             $advert->documents = new EmployerAdvertDocumentCollection();
       
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array())         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('advert_id')." IN('".$collection->getKeys()->implode("','")."') AND ".                                                      
                                " extension IN('png','jpg','jpeg','gif','svg') ".
                        ";")
           ->makeSqlQuery(); 
       //  echo $db->getQuery();        
          if (!$db->getNumRows())
                 return ;             
        while ($item=$db->fetchObject('EmployerAdvertDocument'))
        {             
            if (!$collection->hasItemByKey($item->get('advert_id')))
                continue;          
            $collection->getItemByKey($item->get('advert_id'))->getDocuments()->push($item->loaded());          
        }          
    }
}