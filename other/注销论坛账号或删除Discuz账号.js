// Discuz是国内主流BBS论坛的开源建站系统，但是年代久远没有设计账号注销功能，然而我们可以在浏览器控制台执行以下js代码清除或者说注销掉论坛账号
// 转自https://lengxx.com/post/475.html
(async function(){location.href=((d=(await(await fetch("./home.php?mod=spacecp&ac=avatar",{credentials:'include'})).text()).match(/\/\/\S+\/images\/ca\S+&ag/g)[0].replace('images/camera.swf?','?m=user&a=delete&'))&&confirm('真的要[永久]删除你的ID？'))?d:'';})()