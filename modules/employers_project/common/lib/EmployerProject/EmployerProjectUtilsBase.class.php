<?php


class EmployerProjectUtilsBase {
    
        
    
     static function getActiveProjectForEmployerAndSelection(EmployerUser $employer_user,mfArray $selection)
    {        
        $collection = new EmployerProjectCollection();
        if ($selection->isEmpty())
            return $collection;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('employer_user_id'=>$employer_user->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployerProjectI18n','EmployerProject'))
            ->setQuery("SELECT {fields} FROM ".EmployerProject::getTable().
                       " LEFT JOIN ".EmployerProjectI18n::getInnerForJoin('project_id')." AND lang='{lang}'".
                       " WHERE employer_user_id='{employer_user_id}' ".
                                " AND ".EmployerProject::getTableField('is_active')."='YES' AND ".EmployerProject::getTableField('state')."!='UPLOAD'".
                                " AND ".EmployerProject::getTableField('id')." IN('".$selection->implode("','")."')".
                       ";")
             ->makeSqlQuery();    
         if (!$db->getNumRows())
            return $collection;
         while ($items=$db->fetchObjects())
        { 
            $item=$items->getEmployerProject();                                                                
            $item->setI18n($items->hasEmployerProjectI18n()?$items->getEmployerProjectI18n():false);
            $collection[$item->get('id')]=$item; 
        }         
        return $collection;
    }
     
}

