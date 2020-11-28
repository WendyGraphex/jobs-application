<?php
//country_code|country_name|domestic_example|bban_example|bban_format_swift|bban_format_regex|bban_length|iban_example|iban_format_swift|iban_format_regex|iban_length|bban_bankid_start_offset|bban_bankid_stop_offset|bban_branchid_start_offset|bban_branchid_stop_offset|registry_edition|country_sepa
//GB|United Kingdom|60-16-13 31926819|NWBK60161331926819|4!a6!n8!n|^([A-Z]{4})(\d{6})(\d{8})$|18|GB29NWBK60161331926819|GB2!n4!a6!n8!n|^GB(\d{2})([A-Z]{4})(\d{6})(\d{8})$|22|0|3|4|9|2011-06-20|1
return array(
 //   'domestic_example'	=>"60-16-13 31926819",
//    'bban_example'		=>"NWBK60161331926819",
//    'bban_format_swift'		=>"4!a6!n8!n",
//    'bban_format_regex'		=>"^([A-Z]{4})(\d{6})(\d{8})$",
//    'bban_length'		=>18,
//    'iban_example'		=>"GB29NWBK60161331926819",
//    'iban_format_swift'	=>"GB2!n4!a6!n8!n",
 //   'iban_format_regex'		=>"^GB(\d{2})([A-Z]{4})(\d{6})(\d{8})$",
 //   'iban_length'		=>22,
 //   'bban_bankid_start_offset'	=>,
 //   'bban_bankid_stop_offset'	=>,
 //   'bban_branchid_start_offset'=>,
 //   'bban_branchid_stop_offset'	=>,
  //  'registry_edition'		=>"",
 //   'country_sepa'	        =>,
      "iban"=>array(
           'iban_format_regex'		=>"^GB(\d{2})([A-Z]{4})(\d{6})(\d{8})$",
           'iban_length'		=>22,
          ),
);