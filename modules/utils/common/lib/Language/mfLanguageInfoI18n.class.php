<?php



class mfLanguageInfoI18n extends mfLanguageInfo {
    
 
    static function getI18nLanguages()
    {
        $values=new mfLanguageCollection();
        foreach (self::getLanguages() as $lang)
        {          
            $values[$lang]=new LanguageFormatter($lang);
        }    
        return $values;
    }
  
}