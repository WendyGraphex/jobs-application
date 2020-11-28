<div class="form-group" style="max-width: 200px;min-width: 130px;">
    
    <select class="SelectListLanguages" id="SelectListLanguages{if $name}-{$name}{/if}">
       {foreach $languages as $language}
           <option class="SelectListLanguagesOptions{if $name}-{$name}{/if}" {if $language->get('code')==$selected}selected{/if} 
                   id="{$language->get('code')}" name="{$language->getI18nLanguage()}"
                   data-img-src="{url("/flags/`$language->get('code')`.png","picture")}"> 
                {$language->getI18nLanguage()}
           </option>
       {/foreach}
    </select>
</div> 
<script>
    $("#SelectListLanguages{if $name}-{$name}{/if}").chosen();
</script>