<div>  
 {if $qrcode->hasQrCode()}<a href="{$qrcode->getUrl()}"><img src="{$qrcode->getQrCode()->getURL()}" alt="{__('QR code')}"/></a>{/if}                            
</div>