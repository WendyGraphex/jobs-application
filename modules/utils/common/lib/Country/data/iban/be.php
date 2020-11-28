<?php
//country_code|country_name|domestic_example|bban_example|bban_format_swift|bban_format_regex|bban_length|iban_example|iban_format_swift|iban_format_regex|iban_length|bban_bankid_start_offset|bban_bankid_stop_offset|bban_branchid_start_offset|bban_branchid_stop_offset|registry_edition|country_sepa
//BE|Belgium|539-0075470-34|539007547034|3!n7!n2!n|^(\d{3})(\d{7})(\d{2})$|12|BE68539007547034|BE2!n3!n7!n2!n|^BE(\d{2})(\d{3})(\d{7})(\d{2})$|16|0|2|||2011-06-20|1
return array(
 //   'domestic_example'	=>"539-0075470-34",
//    'bban_example'		=>"539007547034",
//    'bban_format_swift'		=>"3!n7!n2!n",
//    'bban_format_regex'		=>"^(\d{3})(\d{7})(\d{2})$",
//    'bban_length'		=>12,
//    'iban_example'		=>"BE68539007547034",
//    'iban_format_swift'	=>"BE2!n3!n7!n2!n",
//    'iban_format_regex'		=>"^BE(\d{2})(\d{3})(\d{7})(\d{2})$",
//    'iban_length'		=>16,
 //   'bban_bankid_start_offset'	=>,
 //   'bban_bankid_stop_offset'	=>,
 //   'bban_branchid_start_offset'=>,
 //   'bban_branchid_stop_offset'	=>,
  //  'registry_edition'		=>"",
 //   'country_sepa'	        =>,
    "iban"=>array(
         'iban_format_regex'		=>"^BE(\d{2})(\d{3})(\d{7})(\d{2})$",
         'iban_length'		=>16,
    ),
);