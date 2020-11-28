<?php


class BankingUtils {
    
    static function Luhn($numero)
    { 
        $longueur=strlen($numero);       
        for ($i=0;$i<$longueur;$i++)
        {
                $tableauChiffresNumero[$i]=substr($numero,$i,1);
        }            
        $luhn=0; 
        for ($i=0;$i<$longueur;$i++)
        {
           if ($i%2==0)
           { 
              if(($tableauChiffresNumero[$i]*2) > 9)
              { 
                 $tableauChiffresNumero[$i]=($tableauChiffresNumero[$i]*2)-9; //si oui on lui retire 9
              }
              else
              {
                $tableauChiffresNumero[$i]=$tableauChiffresNumero[$i]*2; // si non on remplace la valeur
              }
           }
           $luhn=$luhn+$tableauChiffresNumero[$i]; 
        }                
        return ($luhn%10==0);
    }
}


