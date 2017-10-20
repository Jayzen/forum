var editor = new Simditor({ 
  textarea: $('#topic_content'), 
  toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', 'link','image', '|','hr','indent','outdent','alignment'], 
  placeholder: '这里输入文字...', 
  pasteImage: true, 
  fileKey: 'file', 
  upload: { url: '/topics', params: null, connectionCount: 3, leaveConfirm: 'Uploading is in progress, are you sure to leave this page?' } });
