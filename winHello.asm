.386    ;表示指令集,再往前就是 16位指令集了.
.model flat , stdcall ;model flat :表示内存模型为 flat    stdcall:默认的调用约定,如果不在这里写,那么,每个函数我们都要自己写调用约定.
option casemap:none   ;区分大小写,如果不写这一行,不区分大小写.

;-------这里的路径必须是 RadASM 32位 软件的安装目录下的 include 跟 lib,要不然生成不了 exe 文件
;inc相关
include C:\RadASM\masm32\include\windows.inc
include C:\RadASM\masm32\include\kernel32.inc
include C:\RadASM\masm32\include\user32.inc
;lib相关
includelib C:\RadASM\masm32\lib\kernel32.lib
includelib C:\RadASM\masm32\lib\user32.lib

;-------------各段定义的先后顺序无所谓,每个段的声明就是一个段的开始,当遇到下一个段的声明或者end就是上一个段的结束.

.data    ;数据段,用来存放全局变量和局部变量,可以用?,也可以初始化.
    g_szHello db 'Hello world!',0    ;dos下是以$作为字符串的结束符,在386及往后的版本中,以0作为字符串的结束符.
	g_szTitle db 'Page404',0

.data?   ;未初始化的数据段,只能用?,不能初始化. (几乎不占磁盘空间,内存空间还是同样会占用)


.const   ;常量段,该段的内容是只读的.


.code    ;代码段

START:
    ;调用user32.dll 的弹出框
    invoke MessageBox,NULL,offset g_szHello,offset g_szTitle,MB_OK
	
	;调用 kernel32.dll 正常退出程序
    invoke ExitProcess,0
end START
