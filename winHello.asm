.386    ;��ʾָ�,����ǰ���� 16λָ���.
.model flat , stdcall ;model flat :��ʾ�ڴ�ģ��Ϊ flat    stdcall:Ĭ�ϵĵ���Լ��,�����������д,��ô,ÿ���������Ƕ�Ҫ�Լ�д����Լ��.
option casemap:none   ;���ִ�Сд,�����д��һ��,�����ִ�Сд.

;-------�����·�������� RadASM 32λ �����İ�װĿ¼�µ� include �� lib,Ҫ��Ȼ���ɲ��� exe �ļ�
;inc���
include C:\RadASM\masm32\include\windows.inc
include C:\RadASM\masm32\include\kernel32.inc
include C:\RadASM\masm32\include\user32.inc
;lib���
includelib C:\RadASM\masm32\lib\kernel32.lib
includelib C:\RadASM\masm32\lib\user32.lib

;-------------���ζ�����Ⱥ�˳������ν,ÿ���ε���������һ���εĿ�ʼ,��������һ���ε���������end������һ���εĽ���.

.data    ;���ݶ�,�������ȫ�ֱ����;ֲ�����,������?,Ҳ���Գ�ʼ��.
    g_szHello db 'Hello world!',0    ;dos������$��Ϊ�ַ����Ľ�����,��386������İ汾��,��0��Ϊ�ַ����Ľ�����.
	g_szTitle db 'Page404',0

.data?   ;δ��ʼ�������ݶ�,ֻ����?,���ܳ�ʼ��. (������ռ���̿ռ�,�ڴ�ռ仹��ͬ����ռ��)


.const   ;������,�öε�������ֻ����.


.code    ;�����

START:
    ;����user32.dll �ĵ�����
    invoke MessageBox,NULL,offset g_szHello,offset g_szTitle,MB_OK
	
	;���� kernel32.dll �ĵ�����
    invoke ExitProcess,0
end START