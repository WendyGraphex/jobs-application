<?php

class tests_cryptAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
       if (function_exists('openssl_pkey_get_private'))
           echo "OK"; else echo "KO";
      $toEncrypted = "This is a test";
      
      $privateKey = openssl_pkey_get_private(file_get_contents(__DIR__."/../data/private.pem"));
      
      var_dump($privateKey);
/*$publicKey = openssl_pkey_get_public(file_get_contents(__DIR__."/../data/public.pem"));

var_dump($privateKey,$publicKey);
openssl_public_encrypt($toEncrypted, $encryptedData, $publicKey);
echo "Encrypted data are : <br />";
echo $encryptedData;


openssl_private_decrypt($encryptedData, $plainTextData, $privateKey);
echo "<br /><br />Decrypted data using private key are : <br /> ";
echo $plainTextData;
echo "<br /><br />";*/
      
        return mfView::NONE;
        
    } 
}

/*
 * 
 
 openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem

  openssl req  -new -newkey rsa:1024 -nodes  -keyout mykey.pem -out myreq.pem
 
 */
