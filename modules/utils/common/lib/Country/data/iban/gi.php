<?php

return array(
  //  'country_code'=>'GI',
  //  'country_name'=>'Gibraltar',
  //  'domestic_example'=>'0000 00007099 453',
  //  'bban_example'=>'NWBK000000007099453',
  //  'bban_format_swift'=>'4!a15!c',
  //  'bban_format_regex'=>'^([A-Z]{4})([A-Za-z0-9]{15})$',
  //  'bban_length'=>'19',
  //  'iban_example'=>'GI75NWBK000000007099453',
  //  'iban_format_swift'=>'I2',
  //  'iban_format_regex'=>'^GI(\d{2})([A-Z]{4})([A-Za-z0-9]{15})$',
  //  'iban_length'=>'23',
  //  'bban_bankid_start_offset'=>'0',
  //  'bban_bankid_stop_offset'=>'3',
  //  'bban_branchid_start_offset'=>'0',
  //  'bban_branchid_stop_offset'=>'0',
  //  'registry_edition'=>'2011-06-20',
  //  'country_sepa'=>'1',
     "iban"=>array(
         'iban_format_regex'	=>"^GI(\d{2})([A-Z]{4})([A-Za-z0-9]{15})$",
         'iban_length'		=>23,
    ),
);