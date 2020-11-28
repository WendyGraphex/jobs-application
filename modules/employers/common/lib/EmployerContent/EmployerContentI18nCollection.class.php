<?php

class EmployerContentI18nCollection extends mfObjectCollection3 {
    
    
    function getLanguages()
    {
        $values=new mfLanguageCollection();
        foreach ($this as $item)
            $values[]=new LanguageFormatter($item->get('lang'));
        return $values;
    }

}

