<?php
//country_code|country_name|domestic_example|bban_example|bban_format_swift|bban_format_regex|bban_length|iban_example|iban_format_swift|iban_format_regex|iban_length|bban_bankid_start_offset|bban_bankid_stop_offset|bban_branchid_start_offset|bban_branchid_stop_offset|registry_edition|country_sepa
//FR|France|20041 01005 0500013M026 06|20041010050500013M02606|5!n5!n11!c2!n|^(\d{5})(\d{5})([A-Za-z0-9]{11})(\d{2})$|23|FR1420041010050500013M02606|FR2!n5!n5!n11!c2!n|^FR(\d{2})(\d{5})(\d{5})([A-Za-z0-9]{11})(\d{2})$|27|0|4|5|9|2011-06-20|0
return array(
//    'domestic_example'	=>"20041 01005 0500013M026 06",
//    'bban_example'		=>"20041010050500013M02606",
//    'bban_format_swift'	=>"5!n5!n11!c2!n",
//    'bban_format_regex'		=>"^(\d{5})(\d{5})([A-Za-z0-9]{11})(\d{2})$",
//    'bban_length'		=>23,
//    'iban_example'		=>"FR1420041010050500013M02606",
//    'iban_format_swift'	=>"FR2!n5!n5!n11!c2!n",
 //   'iban_format_regex'		=>"^FR(\d{2})(\d{5})(\d{5})([A-Za-z0-9]{11})(\d{2})$",
 //   'iban_length'		=>27,
//    'bban_bankid_start_offset'=>0,
//    'bban_bankid_stop_offset'	=>4,
//    'bban_branchid_start_offset'=>5,
 //   'bban_branchid_stop_offset'=>9,
  //  'registry_edition'	=>"2011-06-20",
  //  'country_sepa'	        =>0,
    "iban"=>array(
        'iban_format_regex'		=>"^FR(\d{2})(\d{5})(\d{5})([A-Za-z0-9]{11})(\d{2})$",
        'iban_length'		=>27,
    )
);