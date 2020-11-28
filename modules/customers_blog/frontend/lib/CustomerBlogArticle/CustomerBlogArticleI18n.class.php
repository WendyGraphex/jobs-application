<?php

class CustomerBlogArticleI18n extends CustomerBlogArticleI18nBase {
     
   
     function __construct($parameters = null) {
        if (is_array($parameters) || $parameters instanceof ArrayAccess)
        {
          if (isset($parameters['lang']) && isset($parameters['url']) && $parameters['url'] instanceof mfString)
                return $this->loadByLangAndUrl((string)$parameters['lang'],$parameters['url']); 
        }
        parent::__construct($parameters);
    }
    
     protected function loadByLangAndUrl($lang,mfString $url)
    {         
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>(string)$url->urldecode(),"lang"=>$lang))              
            ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                      
                       " INNER JOIN ".self::getOuterForJoin('article_id').
                       " WHERE lang='{lang}' AND url='{url}'".
                           " AND ".CustomerBlogArticle::getTableField('is_active')."='YES'".
                        ";")
            ->makeSqlQuery();              
        return $this->rowtoObject($db);
    }
}
