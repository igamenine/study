// 浏览器为了安全，在使用【选择文件】控件时会故意隐藏上传文件的实际路径为C:\fakepath，这个不用管。

// 扩展阅读：
$(function(){
  $('#file').change(function(){
  $(this).select();
  });
  
  $('#import_').click(function(){
  var realpath = '';
  if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
  realpath = document.selection.createRange().text;
  }else{
  alert("此上传控件暂时只支持IE浏览器！");
  return;
  }
  $(this).attr("disabled",true); 
  if(realpath.indexOf("C:\fakepath")> -1){
  alert("系统未能获取正确的文件路径，请根据提示修改浏览器安全级别！");
  return;
  }
  //下面的无关紧要了，是我自己的处理
  var file = realpath;
 
 var filetype = file.substring(file.lastIndexOf('.')+1, file.length);
  if(filetype != 'xls' && filetype != 'xlsx' ){
  alert('请选择Excel文件：(.xls或.xlsx)');
  return;
  }
  $("#box1").mask("正在保存中...",null,true);
  
  $.ajax({
  type : 'POST',
  url : '<%=path%>/',
  data : { "file":file
    },
  success : function(result){
  top.Dialog.alert(result.message,function(){
  top.document.getElementById("_DialogFrame_firstDialog").contentWindow.toReload();
  $("#box1").unmask();
  //关闭窗口
  top.Dialog.close();
  
  
             });
  },
  error : function(a){
  top.Dialog.alert("访问服务器端出错！");
  },
  dataType : 'json'
  });
   return false;
  });
  });