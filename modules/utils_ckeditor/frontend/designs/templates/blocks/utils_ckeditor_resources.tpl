{* <link rel="stylesheet" href="{url("/module/utils_ckeditor/js/`$version`/contents.css",'web')}">*}
{javascripts}


  <script type="text/javascript">
        CKEDITOR.config.language = '{$language}';
        CKEDITOR.config.baseUrl = "{$base_url}";
{if $tpl=='default'}    
        CKEDITOR.config.enterMode = CKEDITOR.ENTER_BR ;
        CKEDITOR.config.toolbarGroups = [
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		//{ name: 'forms' },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		//{ name: 'links' },
		{ name: 'insert' },
		{ name: 'styles' },
		{ name: 'colors' },
		//{ name: 'tools' },
		//{ name: 'others' },
		//{ name: 'about' }
	];

	CKEDITOR.config.removeButtons = 'Cut,Copy,Paste,Undo,Redo,Anchor,Underline,Strike,Subscript,Superscript,Iframe';
	
	CKEDITOR.config.removeDialogTabs = 'link:advanced';
{elseif $tpl=="simple"} 
     CKEDITOR.config.enterMode = CKEDITOR.ENTER_BR ;
        CKEDITOR.config.toolbarGroups = [
		//{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		//{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		//{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		//{ name: 'forms' },
		//{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		//{ name: 'links' },
		//{ name: 'insert' },
		//{ name: 'styles' },
		//{ name: 'colors' },
		//{ name: 'tools' },
		//{ name: 'others' },
		//{ name: 'about' }
	];

	CKEDITOR.config.removeButtons = 'Source,Cut,Copy,Paste,Undo,Redo,Anchor,Underline,Strike,Subscript,Superscript';
	
	CKEDITOR.config.removeDialogTabs = 'link:advanced';
{/if}
     
</script>
