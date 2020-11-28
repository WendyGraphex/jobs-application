<?php

class mfValidatorCmsPageURL extends mfValidatorRegex {
    
     const REGEX_NAME = '~^
       ((http|https)://                         # protocol        
        (
          ([a-z0-9-]+\.)+[a-z]{2,6}             # a domain name          
        )?
        (\/?|/\S+)
       )?
       (\/?|/\S+)|[\w- \#]+        
    $~ix';

    protected function configure($options = array(), $messages = array()) {    
        parent::configure($options, $messages);
        $this->setValidatorName(strtolower(str_replace("mfValidator","",get_class())));
        $this->setOption('pattern', self::REGEX_NAME);
    }

    protected function doIsValid($value) {
        $clean = parent::doIsValid($value);
        $clean = str_replace(array(" ","_"),array("-",""),$clean);       
        // Remove all accents
        $clean = htmlentities($clean, ENT_NOQUOTES, self::getCharset());
        $clean = preg_replace('#&([A-za-z])(?:acute|cedil|circ|grave|orn|ring|slash|th|tilde|uml);#', '\1', $clean);
        $clean = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $clean); // pour les ligatures e.g. '&oelig;'
        $clean = preg_replace('#&[^;]+;#', '', $clean); // supprime les autres caractères        
        return $clean;
    }
    
}


