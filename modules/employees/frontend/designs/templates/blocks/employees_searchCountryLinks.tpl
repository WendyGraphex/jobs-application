  <li>{('Country')}:
  {foreach $country_letters as $letter}<a href="{$letter->getUrl()}">{$letter} </a>{/foreach}
  </li>
