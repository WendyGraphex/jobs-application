{if $error}<!-- Error from Linkedin: {$error} -->{/if}
<button type="button" id="loginLinkedin" class="btn btn-linkedin auth-form-btn flex-grow ml-1" style="width: 100%;margin-left: 0px !important;height: 100%;">
    <i class="mdi mdi-linkedin mr-2"></i><a href="{$auth_url}" target="{$target}" style="color: white !important;">Linkedin</a>
</button>