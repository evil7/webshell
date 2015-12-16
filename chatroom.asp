<%@ LANGUAGE = VBScript %>
<%
server.scripttimeout=120
response.buffer = true
on error resume next
tm = now
ff = Request.ServerVariables("SCRIPT_NAME")
 
uip = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
If uip = "" Then uip = Request.ServerVariables("REMOTE_ADDR")
uip=split(uip,".",-1,1)
ipx=uip(0)&"."&uip(1)&"."&uip(2)&".*"
 
data = left(replace(trim(request.form("what")),"说点什么吧",""),200)
 
if data<>"" then
data = replace(replace(replace(replace(replace(replace(replace(replace(replace(data,"http://",""),"<","&lt;"),">","&gt;"),"%","&#37;"),"(","["),")","]"),"/","&#47;"),"'","&#39;"),"""","&#34;")
data = replace(data,"[img]","<img src=""http://")
data = replace(data,"[&#47;img]",""" />")
txt = "<pre>"&data&"<p>IP为"&ipx&"的兄弟 >>> Say this at:"&tm&"</p></pre>"
Set Fs=Server.CreateObject("Scripting.FileSystemObject") 
Set File=Fs.OpenTextFile(Server.MapPath(ff),8,Flase)
File.Writeline txt
File.Close
response.write "<script>location.replace(location.href);</script>"
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Hacked by LJokerP</title>
<style type="text/css">
html{background:#f7f7f7;}
pre{font-size:15pt;font-family:Times New Roman;line-height:120%;}
p{font-size:10pt;}
.tx{font-family:Lucida Handwriting,Times New Roman;}
</style>
</head>
<center>
<a style="letter-spacing:3px;"><b>welcome to</b><br></a>
<h1>=>菊花聊天室<=</h1>
<hr>
<form method=post action="?">
<p><a href="#img" onclick="document.getElementById('what').value+='[img]这里换成图片的URL地址[/img]'">插入图片</a></p>
<textarea rows="5" id="what" style="font-family:Times New Roman;font-size:14pt;" cols="80" name="what">说点什么吧</textarea>
<input type="submit" value="雁过留声 路过留言" tilte="提交" style="width:120px;height:64px;">
</form>
</center>