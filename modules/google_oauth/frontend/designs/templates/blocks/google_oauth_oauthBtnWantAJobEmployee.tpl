{if $error}<!-- Error from google: {$error} -->{/if}
<button type="button" id="loginGoogle" class="btn btn-google auth-form-btn flex-grow ml-1" style="width: 100%;{*margin-left: 0px !important;*}">
    <i class="mdi mdi-google mr-2"></i><a href="{$auth_url}" target="{$target}" style="color: white !important;">Google</a>
</button>

