// 很多网页会加载广告或者其他用户不想看见的元素，这时就需要使用以下命令屏蔽相关元素，代码在浏览器控制台执行。
var remove=n=>{n.split(",").forEach(v=>{if(v.indexOf("@ID(")==0){document.getElementById(v.substring(4,v.length-1)).style.display="none"}else{for(let e of document.getElementsByClassName(v))e.style.display="none"}})}
remove("css-knqde")
// 首先你需要对页面点击检查元素，找到你需要屏蔽的div，然后填写class或者name等之类可以标识div的名称填入，如果需要屏蔽多个div用「,」区分。