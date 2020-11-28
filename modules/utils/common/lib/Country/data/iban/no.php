<?php
//country_code|country_name|domestic_example|bban_example|bban_format_swift|bban_format_regex|bban_length|iban_example|iban_format_swift|iban_format_regex|iban_length|bban_bankid_start_offset|bban_bankid_stop_offset|bban_branchid_start_offset|bban_branchid_stop_offset|registry_edition|country_sepa

return array(
 //   'domestic_example'	=>"539-0075470-34",
//    'bban_example'		=>"539007547034",
//    'bban_format_swift'		=>"3!n7!n2!n",
//    'bban_format_regex'		=>"^(\d{3})(\d{7})(\d{2})$",
//    'bban_length'		=>12,
//    'iban_example'		=>"BE68539007547034",
//    'iban_format_swift'	=>"BE2!n3!n7!n2!n",
//    'iban_format_regex'		=>"^NO(\d{2})(\d{4})(\d{6})(\d{1})$",
//    'iban_length'		=>15,
 //   'bban_bankid_start_offset'	=>,
 //   'bban_bankid_stop_offset'	=>,
 //   'bban_branchid_start_offset'=>,
 //   'bban_branchid_stop_offset'	=>,
  //  'registry_edition'		=>"",
 //   'country_sepa'	        =>,
    "iban"=>array(
         'iban_format_regex'		=>"^NO(\d{2})(\d{4})(\d{6})(\d{1})$",
         'iban_length'		=>15,
    )
);