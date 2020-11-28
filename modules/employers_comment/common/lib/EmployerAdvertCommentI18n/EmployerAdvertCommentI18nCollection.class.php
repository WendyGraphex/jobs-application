<?php


class EmployerAdvertCommentI18nCollection extends CustomerAdvertCommentI18nCollection {
        
    protected $comment=null;
    
    function __construct($data=null) {
        if ($data instanceof EmployerAdvertComment)
        {
            $this->comment=$data;
            return parent::__construct();
        }   
        parent::__construct($data);
    }
    
    function getComment()
    {
        return $this->comment;
    }
    
    function create($data)
    {
        $comment = new EmployerAdvertComment();
        $comment->add($data['comment']);
        $comment->save();
        foreach ($data['i18n']  as $values)
        {
            $i18n = new EmployerAdvertCommentI18n();   
            $i18n->set('comment_id',$comment);
            $i18n->add($values);
            $this[]=$i18n;
        }        
        $this->save();
        return $this;
    }
    
    function getAll()
    {
        if ($this->isLoaded()) return $this;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('comment_id'=>$this->getComment()->get('id')))           
            ->setQuery("SELECT * FROM ".EmployerAdvertCommentI18n::getTable().                                                            
                       " WHERE  ".EmployerAdvertCommentI18n::getTableField('comment_id')."='{comment_id}' ".                          
                       ";")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $this->loaded();     
         while ($item = $db->fetchObject('EmployerAdvertCommentI18n')) 
       {                                                
            $this[$item->get('id')]=$item->loaded();               
       }        
        $this->loaded();        
        return $this;
    }
}
