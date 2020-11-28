<?php

class EmployerAdvertI18nEmployerCriteriaNotationCollection extends CustomerAdvertI18nCriteriaNotationCollection {
        
   function create()
   {
       $this->save();              
       return $this;
   }
}

