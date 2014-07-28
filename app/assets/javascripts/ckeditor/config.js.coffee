# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'it'
  config.height = '500'
  config.extraPlugins = 'youtube';
  config.removeDialogTabs = 'link:advanced;image:advanced';
  config.toolbar_Pure = [
    { name: 'document',    items: [ 'Undo','Redo','-','Templates','-','Preview'] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord'] },
    { name: 'editing',     items: [ 'Find','Replace','-','SelectAll'] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] },
    '/',
    { name: 'styles',      items: [ 'Format','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'links',       items: [ 'Link','Unlink','-','Image','Youtube'] },
    { name: 'insert',      items: [ 'Table','HorizontalRule','Smiley','SpecialChar'] },
  ]
  config.toolbar = 'Pure'
  true

