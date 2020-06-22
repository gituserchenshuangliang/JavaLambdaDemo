REM BAT学习
REM 2020-4-4
REM Cherry

REM BAT指令
REM 2020-4-4
REM Cherry

REM REM 和 ::指令 
REM 1.REM为注释命令,命令后的内容不被执行，但能回显
REM 2.::后的字符行在执行时不会回显,打开命令行回显状态

REM @字符放在命令前将关闭该命令回显，无论此时echo是否为打开状态。

REM echo指令
REM 1.打开或关闭回显功能  格式：echo[{on|off}]
REM 2.显示当前echo设置状态
REM 3.输出提示信息
REM 4.关闭DOS命令提示符
REM 5.输出空行，使用echo.  例如：echo.|time  隔行输出时间
REM 6.答复命令中的提问  格式：echo 答复语|命令 文件名
REM 7.建立新文件或增加文件内容  格式：echo 文件内容>文件名 用>>表示追加内容
REM 8.向打印机输出打印内容或打印控制码 echo 打印机控制码>;PRN  echo 打印内容>;PRN
REM     创建a.txt文件，写入Hello World ！
        echo Hello World ! >> a.txt
REM TYPE显示文本文件的内容

REM PAUSE 停止系统命令的执行并显示下面的内容 
REM 格式：echo 其他提示语 & pause > nul

REM ERRORLEVEL 程序返回码
REM echo %errorlevel%
REM 每个命令运行结束，可以用这个命令行格式查看返回码
REM 用于判断刚才的命令是否执行成功
REM 默认值为0，一般命令执行出错会设 errorlevel 为1

REM TITLE
REM 设置cmd窗口的标题 格式：title 新标题

REM COLOR
REM 设置默认的控制台前景和背景颜色 
REM 格式：color [attr]  attr指定控制台输出的颜色属性
REM 颜色属性由两个十六进制数字指定 A7 , 0B
REM     0 = 黑色       8 = 灰色
REM     1 = 蓝色       9 = 淡蓝色
REM     2 = 绿色       A = 淡绿色
REM     3 = 湖蓝色     B = 淡浅绿色
REM     4 = 红色       C = 淡红色
REM     5 = 紫色       D = 淡紫色
REM     6 = 黄色       E = 淡黄色
REM     7 = 白色       F = 亮白色

REM MODE 配置系统设备
REM help mode 查看mode的相关信息

REM GOTO 和 :
REM 在批处理中允许以“:XXX”来构建一个标号，然后用GOTO XXX跳转到标号:XXX处，
REM 然后执行标号后的命令。
    :A
    echo 循环......
    goto :A
REM STA
RT 命令
REM 批处理中调用外部程序的命令（该外部程序在新窗口中运行，
REM 批处理程序继续往下执行，不理会外部程序的运行状况），
REM 如果直接运行外部程序则必须等外部程序完成后才继续执行剩下的指令
REM 调用图形界面打开D盘
    start explorer E:\MyDemo 

REM assoc 和 ftype 文件关联
REM assoc 设置'文件扩展名'关联，关联到'文件类型'
REM ftype 设置'文件类型'关联，关联到'执行程序和参数'
REM     assoc           #显示所有'文件扩展名'关联
REM     ftype           #显示所有'文件类型'关联
REM     assoc .txt      #显示.txt代表的'文件类型'，结果显示 .txt=txtfile
REM     ftype exefile   #显示exefile类型关联的命令行，结果显示 exefile="%1" %* 
REM     assoc .txt=Word.Document.8
REM                     设置.txt为word类型的文档，可以看到.txt文件的图标都变了
REM     assoc .txt=txtfile 恢复.txt的正确关联
REM     ftype exefile="%1" %* 恢复 exefile 的正确关联

REM pushd 和 popd
REM 切换当前目录和恢复目录
REM     cd E:\     #切换到E:\
REM     pushd D:\  #切换到D:\
REM     popd       #恢复到E:\ 只能恢复pushd操作的目录
        @echo off
        start explorer E:\MyDemo\batDemo
        cd E:\     
        echo 切换到E:\-------------------
        dir
        pushd D:\ 
        echo 切换到D:\-----------------
        dir
        popd      
        echo 恢复到E:\-------------------
        dir
REM CALL
REM 批处理执行过程中调用另一个批处理，当另一个批处理执行完后，
REM 再继续执行原来的批处理 格式：CALL command
REM CALL [drive:][path]filename [batch-parameters] 调用的其它批处理程序。
REM filename 参数必须具有 .bat 或 .cmd 扩展名。%1表示参数
    REM C.bat文件
    echo %1 
    echo %2
    REM B.bat文件
    call C.bat Cherrry Chen
    REM 打印Cherry Chen

REM CALL :label arguments
REM 调用程序片段，相当于子程序。被调用的命令段以标签:label开头
REM 以命令goto :eof结尾。
    @echo off
    echo CALL :label arguments的例子   
    call :A A.bat
    exit
    :A
    echo 删除引号： %~1
    echo 扩充到路径： %~f1
    echo 扩充到一个驱动器号： %~d1
    echo 扩充到一个路径： %~p1 
    echo 扩充到一个文件名： %~n1
    echo 扩充到一个文件扩展名： %~x1
    echo 扩充的路径指含有短名： %~s1 
    echo 扩充到文件属性： %~a1 
    echo 扩充到文件的日期/时间： %~t1 
    echo 扩充到文件的大小： %~z1 
    echo 扩展到驱动器号和路径：%~dp1
    echo 扩展到文件名和扩展名：%~nx1
    echo 扩展到类似 DIR 的输出行：%~ftza1
    echo.
    pause
    goto :eof
REM   批脚本里的 %* 指出所有的参数(如 %1 %2 %3 %4 %5 ...)
REM      批参数(%n)的替代已被增强。您可以使用以下语法:（看不明白的直接运行后面的例子）
REM          %~1         - 删除引号(")，扩充 %1
REM          %~f1        - 将 %1 扩充到一个完全合格的路径名
REM          %~d1        - 仅将 %1 扩充到一个驱动器号
REM          %~p1        - 仅将 %1 扩充到一个路径
REM          %~n1        - 仅将 %1 扩充到一个文件名
REM          %~x1        - 仅将 %1 扩充到一个文件扩展名
REM          %~s1        - 扩充的路径指含有短名
REM          %~a1        - 将 %1 扩充到文件属性
REM          %~t1        - 将 %1 扩充到文件的日期/时间
REM          %~z1        - 将 %1 扩充到文件的大小
REM          %~$PATH : 1 - 查找列在 PATH 环境变量的目录，并将 %1
REM                        扩充到找到的第一个完全合格的名称。如果环境
REM                        变量名未被定义，或者没有找到文件，此组合键会
REM                        扩充到空字符串
REM     可以组合修定符来取得多重结果:
REM         %~dp1       - 只将 %1 扩展到驱动器号和路径
REM         %~nx1       - 只将 %1 扩展到文件名和扩展名
REM         %~dp$PATH:1 - 在列在 PATH 环境变量中的目录里查找 %1，
REM                        并扩展到找到的第一个文件的驱动器号和路径。
REM         %~ftza1     - 将 %1 扩展到类似 DIR 的输出行。
REM     在上面的例子中，%1 和 PATH 可以被其他有效数值替换。
REM %~ 语法被一个有效参数号码终止。%~ 修定符不能跟 %*使用
    @echo off
    set a=123456
    set b=echo %a%
    set c=echo Hello World !
    call %b%
    %c%
    call %c%
    pause

REM IF
REM if 条件判断语句，语法格式如下：
REM if [not] errorlevel number command
REM number 0~255，判断时按由大到小执行，返回的值大于等于指定的值时，条件成立
    @echo off
    echo Chen
    if %errorlevel%==1 (echo T) else (echo F)
    echo %errorlevel%
    pause

REM if [not] string1==string2 command
    set a=1
    set b=2
    if a==b (echo EQ) else echo UEQ
    if not a==b echo UEQ
    pause
REM if [not] exist filename command
    if exist a.txt echo 存在此文件
    if not exist a.txt (echo 不存在此文件) else echo 存在此文件
    pause
    
REM 增强用法：if [/I] string1 compare-op string2 command
REM 增强用法中加上/I就不区分大小写了!
REM 增强用法中还有一些用来判断数字的符号,compare-op：
REM EQU - 等于
REM NEQ - 不等于
REM LSS - 小于
REM LEQ - 小于或等于
REM GTR - 大于
REM GEQ - 大于或等于


REM setlocal 与 变量延迟
REM 在没有开启变量延迟的情况下，某条命令行中的变量改变，必须到下一条命令才能体现。
    @echo off
    set a=4
    set a=5 & echo %a%
    echo %a%
    pause
REM 结果：4,5
REM setlocal enabledelayedexpansion 开启变量延迟 !!括起来（英文的叹号）
    @echo off
    setlocal enabledelayedexpansion
    set a=4
    set a=5 & echo !a!
    echo %a%
    pause
REM 结果：5,5
REM 启动了变量延迟，所以批处理能够感知到动态变化
REM 利用关闭变量延时交换变量
    @echo off
    set a=123
    set b=abc
    echo a=%a%,b=%b%
    set a=%b% & set b=%a%
    echo a=%a%,b=%b%
    pause

REM ATTRIB  显示或更改文件属性
REM ATTRIB [+R|-R] [+A|-A] [+S|-S] [+H|-H] [[drive:] [path] filename] [/S [/D]]
REM   +   设置属性。
REM   -    清除属性。
REM   R   只读文件属性。
REM   A   存档文件属性。
REM   S   系统文件属性。
REM   H   隐藏文件属性。
REM   [drive:][path][filename]指定要处理的文件属性。
REM   /S  处理当前文件夹及其子文件夹中的匹配文件。
REM   /D  也处理文件夹。
REM 设置a.txt文件为隐藏属性，去除隐藏属性
    attrib +h a.txt
    attrib -h a.txt
REM ATTRIB [drive:][path][filename]查看文件属性
    attrib A.bat

REM BAT常用特殊符号
REM 2020-4-5
REM Cherry
REM     1、@  命令行回显屏蔽符
REM     2、%  批处理变量引导符
REM     3、>   重定向符
REM     4、>>  重定向符
REM     5、<、>&、<& 重定向符
REM     6、^  转义字符
REM     7、&  组合命令
REM     8、&& 组合命令
REM     9、|  命令管道符
REM     10、||  组合命令
REM     11、""  字符串界定符
REM     12、, 逗号
REM     13、; 分号
REM     14、() 括号
REM     15、! 感叹号
REM     16、批处理中可能会见到的其它特殊标记符: （略）
REM         CR(0D) 命令行结束符 
REM         Escape(1B) ANSI转义字符引导符 
REM         Space(20) 常用的参数界定符 
REM         Tab(09) ; = 不常用的参数界定符 
REM         + COPY命令文件连接符 
REM         * ? 文件通配符 
REM         / 参数开关引导符 
REM         : 批处理标签引导符 

REM 2020-4-7
REM @  命令行回显屏蔽,符这个字符在批处理中的意思是关闭当前行的回显。

REM %  批处理变量引导符
REM 引用变量用%var%，调用程序外部参数用%1至%9等等
REM %0  %1  %2  %3  %4  %5  %6  %7  %8  %9  %*为命令行传递给批处理的参数
REM %0 批处理文件本身，包括完整的路径和扩展名
REM %1 第一个参数
REM %9 第九个参数
REM %* 从第一个参数开始的所有参数
REM 参数%0具有特殊的功能，可以调用批处理自身，
REM 以达到批处理本身循环的目的，也可以复制文件自身等等
    @echo off
    copy %0 D.bat
    if not %errorlevel%==1 (echo successed) else echo failed
    pause

REM >   重定向符
REM 这个字符的意思是传递并且覆盖，他所起的作用是将运行的结果传递到后面的范围
REM （后边可以是文件，也可以是默认的系统控制台）
    @echo off
    echo "some logs" > logs_file.log

REM >>  重定向符,传递并在文件的末尾追加结果
    echo "other logs" >> logs_file.log

REM <、>&、<& 重定向符
REM < 输入重定向命令，从文件中读入命令输入

REM ^  转义字符,也可以用作续行符号
    echo a ^> 3  REM 显示 a > 3
    echo A^
        BC^
        DEF
    pause

REM &  组合命令
REM 语法：第一条命令 & 第二条命令 [& 第三条命令...](发生错误不会停止后面的命令)
    echo new windows & start cmd

REM && 组合命令（断路）
REM 语法：第一条命令 && 第二条命令 [&& 第三条命令...](发生错误会停止后面的命令)
    dir W: && echo Jack

REM |  命令管道符
REM 格式：第一条命令 | 第二条命令 [| 第三条命令...]
REM 将第一条命令的结果作为第二条命令的参数来使用
    dir E:\MyDemo\BAT| find "bat" 
    find "errorlevel" A.bat | find "else"

REM ||  组合命令
REM 语法：第一条命令 || 第二条命令 [|| 第三条命令...](上一条指令错误才会执行下一条)

REM ""  字符串界定符
REM , 逗号相当于空格 dir,E:

REM ; 分号
REM 当命令相同时，可以将不同目标用；来隔离，
REM 但执行效果不变，如执行过程中发生错误，则只返回错误报告，但程序仍会执行。
    dir C:;D:;E:

REM () 括号 括号中可以包括多行命令，这些命令将被看成一个整体，视为一条命令行。

REM ! 感叹号 在变量延迟问题中，用来表示变量

REM 2020-4-7
REM DOS循环

REM 基本格式
REM for %%var in (set) do cmd [cmd-params]
REM   %%var 指定一个单一字母表示可替换的参数。
REM  (set) 指定一个或一组文件。可以使用通配符。*号表示任意N个字符,而?号只表示任意一个字符
REM   cmd   指定对每个文件执行的命令。
REM   cmd-params  为特定命令指定参数或命令行开关。
REM 在批处理程序中使用 FOR 命令时，指定变量请使用 %%var
REM 而不要用 %variable。变量名称是区分大小写的，所以 %i 不同于 %I.
REM for有4个参数  /d     /l       /r     /f 

REM 参数 /D  -> set集合中的元素匹配目录类型 
    for /d %i in (C:/*) do echo %i >> a.txt
    type a.txt
    pause
REM 参数 /R  -> for /r [path:] %var in (set) do cmd [cmd-params] 
REM 遍历path中符合set的项目,如果没有指定[path:]，则默认为set所在目录
    @echo off
    cd E:/
    REM 搜索C:/windows中的日志文件
    for /r c:/windows %i in ("*.log") do echo %i
    REM 搜索E:/中的bat文件
    for /r %i in ("*.bat") do echo %i
    REM 搜索C:中的指定文件cmd.exe
    for /r c:\ %i in (cmd.exe) do if exist %i echo %%i
    pause

REM 参数 /L -> for /l  %var in (start,step,end) do cmd [cmd-params] 
REM /l将通过对 Start# 与 End# 进行比较来执行迭代变量。
    for /l %i in (1,1,4) do start cmd


REM 参数 /F -> for /f  [opt] %var in (file/string/command) do cmd [cmd-params]
REM 使用[opt]处理fileset/string/command。[opt]包括一个或多个
REM for /f会默认以每一行（无分隔符）来作为一个元素，但是有分隔符怎么办？
REM 命令默认是以空格和TAB为分隔符，所以它遇到分割符之后，默认只取第一个，
REM 就将分割符后面的都丢掉了。
REM 如果我们还想把每一行再分解更小的内容，该怎么办呢？for命令提供了更多的参数，
REM 它们就是：delims和tokens
REM delims 告诉for每一行应该拿什么作为分隔符，默认的分隔符是空格和tab键
REM tokens 它的作用就是当你通过delims将每一行分为更小的元素时,来控制要取哪一个或哪几个。
REM tokens=i,i*  %%i，%%j，%%k k代表剩下的项
REM skip  告诉for跳过行。
REM usebackq  就是反转的意思，他把字符串("out.txt")当做文件，或者把命令('command')当做字符串。
        For /f "delims=" %i in ('Type b.txt^|Find ","') do (Echo %i)
REM         b.txt 内容如下：
REM         第1行第1列 第1行第2列 第1行第3列
REM         第2行第1列,第2行第2列,第2行第3列
        REM 以,分块
        for /f "tokens=1,3 delims=," %i in (b.txt) do echo %i %j
REM         第1行第1列 第1行第2列 第1行第3列
REM         第2行第1列 第2行第3列
        REM 以空格分块
        for /f "tokens=1,3 delims= " %i in (b.txt) do echo %i %j
REM         第1行第1列 第1行第3列
REM         第2行第1列,第2行第2列,第2行第3列
REM         c.txt内容如下：
REM         name=Cherry
REM         hobby=Game
        for /f "tokens=1,2 delims==" %i in (c.txt) do echo %i的值为：%j


REM 2020-4-7
REM FOR命令中的变量
REM      ~I          - 删除任何引号(")，扩展 %I
REM      %~fI        - 将 %I 扩展到一个完全合格的路径名
REM      %~dI        - 仅将 %I 扩展到一个驱动器号
REM      %~pI        - 仅将 %I 扩展到一个路径
REM      %~nI        - 仅将 %I 扩展到一个文件名
REM      %~xI        - 仅将 %I 扩展到一个文件扩展名
REM      %~sI        - 扩展的路径只含有短名
REM      %~aI        - 将 %I 扩展到文件的文件属性
REM      %~tI        - 将 %I 扩展到文件的日期/时间
REM      %~zI        - 将 %I 扩展到文件的大小
REM      %~$PATH:I   - 查找列在路径环境变量的目录，并将 %I 扩展
REM                    到找到的第一个完全合格的名称。如果环境变量名
REM                    未被定义，或者没有找到文件，此组合键会扩展到
REM                    空字符串

        for /f "delims==" %i in ('dir /b') do echo %i
        REM A.bat
        REM a.txt
        REM B.bat
        REM b.txt
        REM C.bat
        REM c.txt
        REM logs_file.log
        for /f "delims==" %i in ('dir /b') do echo %~fi
        REM E:\MyDemo\BAT\A.bat
        REM E:\MyDemo\BAT\a.txt
        REM E:\MyDemo\BAT\B.bat
        REM E:\MyDemo\BAT\b.txt
        REM E:\MyDemo\BAT\C.bat
        REM E:\MyDemo\BAT\c.txt
        REM E:\MyDemo\BAT\echo
        REM E:\MyDemo\BAT\logs_file.log
REM 其他的亦可自行验证
        @echo off
        cd C:/
        for /f "delims=" %i in ("notepad.exe") do echo  %~$PATH:i
REM i扩展到在C:盘搜索notepad.exe的路径


REM 2020-4-8
REM 批处理中的变量
REM 分别为"系统变量"和"自定义变量"

REM 系统变量
REM 系统将其根据事先定义的条件自动赋值,也就是这些变量系统已经给他们定义了值,
REM 不需要来给他赋值,只需要调用.变量如下：
REM %ALLUSERSPROFILE% 本地 返回“所有用户”配置文件的位置。
REM %APPDATA% 本地 返回默认情况下应用程序存储数据的位置。
REM %CD% 本地 返回当前目录字符串。
REM %CMDCMDLINE% 本地 返回用来启动当前的 Cmd.exe 的准确命令行。
REM %CMDEXTVERSION% 系统 返回当前的“命令处理程序扩展”的版本号。
REM %COMPUTERNAME%  系统 返回计算机的名称。
REM %COMSPEC%  系统 返回命令行解释器可执行程序的准确路径。
REM %DATE%  系统 返回当前日期。使用与 date /t 命令相同的格式。由 Cmd.exe 生成。有关
REM         date 命令的详细信息，请参阅 Date。
REM %ERRORLEVEL%  系统 返回上一条命令的错误代码。通常用非零值表示错误。
REM %HOMEDRIVE%  系统 返回连接到用户主目录的本地工作站驱动器号。基于主目录值而设置。用
REM         户主目录是在“本地用户和组”中指定的。
REM %HOMEPATH%  系统 返回用户主目录的完整路径。基于主目录值而设置。用户主目录是在“本地用户和组”中指定的。
REM %HOMESHARE%  系统 返回用户的共享主目录的网络路径。基于主目录值而设置。用户主目录是
REM         在“本地用户和组”中指定的。
REM %LOGONSERVER%  本地 返回验证当前登录会话的域控制器的名称。
REM %NUMBER_OF_PROCESSORS%  系统 指定安装在计算机上的处理器的数目。
REM %OS%  系统 返回操作系统名称。Windows 2000 显示其操作系统为 Windows_NT。
REM %PATH% 系统 指定可执行文件的搜索路径。
REM %PATHEXT% 系统 返回操作系统认为可执行的文件扩展名的列表。
REM %PROCESSOR_ARCHITECTURE%  系统 返回处理器的芯片体系结构。值：x86 或 IA64 基于Itanium
REM %PROCESSOR_IDENTFIER% 系统 返回处理器说明。
REM %PROCESSOR_LEVEL%  系统 返回计算机上安装的处理器的型号。
REM %PROCESSOR_REVISION% 系统 返回处理器的版本号。
REM %PROMPT% 本地 返回当前解释程序的命令提示符设置。由 Cmd.exe 生成。
REM %RANDOM% 系统 返回 0 到 32767 之间的任意十进制数字。由 Cmd.exe 生成。
REM %SYSTEMDRIVE% 系统 返回包含 Windows server operating system 根目录（即系统根目录）
REM         的驱动器。
REM %SYSTEMROOT%  系统 返回 Windows server operating system 根目录的位置。
REM %TEMP% 和 %TMP% 系统和用户 返回对当前登录用户可用的应用程序所使用的默认临时目录。
REM         有些应用程序需要 TEMP，而其他应用程序则需要 TMP。
REM %TIME% 系统 返回当前时间。使用与 time /t 命令相同的格式。由 Cmd.exe 生成。有关
REM         time 命令的详细信息，请参阅 Time。
REM %USERDOMAIN% 本地 返回包含用户帐户的域的名称。
REM %USERNAME% 本地 返回当前登录的用户的名称。
REM %USERPROFILE% 本地 返回当前用户的配置文件的位置。
REM %WINDIR% 系统 返回操作系统目录的位置。
REM %1 %2 %3 .... %9 %* 返回参数 ，%* 一次返回所有参数
REM %0 返回批处理所在绝对路径
    @echo off
    :A
    echo %0
    echo %1
    echo %2
    echo 按任意键退出！& pause > nul
    exit
    :eof
    call :A parameterOne parameterTwo

REM 自定义变量  使用set命令定义
    @echo off
    set /p var=用户输入:
    echo %var%
    pause
REM 直接输入set指令会打印系统变量，使用set p 会显示所有以字母 P 打头的变量
REM 在 SET 命令中添加了两个新命令行开关:
REM     SET /A expression
REM     SET /P variable=[promptString]

REM /A 命令行开关指定等号右边的字符串为被评估的数字表达式。该表达式
REM 评估器很简单并以递减的优先权顺序支持下列操作:
REM     ()                  - 分组
REM     ! ~ -               - 一元运算符
REM     * / %               - 算数运算符
REM     + -                 - 算数运算符
REM     << >>               - 逻辑移位
REM     &                   - 按位“与”
REM     ^                   - 按位“异”
REM     |                   - 按位“或”
REM     = *= /= %= += -=    - 赋值
REM       &= ^= |= <<= >>=
REM     ,                   - 表达式分隔符
REM 如果 SET /A 在命令脚本外的命令行执行的，那么它显示该表达式的最后值。
REM /P 命令行开关允许将变量数值设成用户输入的一行输入。读取输入
REM 行之前，显示指定的 promptString。promptString 可以是空的。

REM 环境变量替换已如下增强:
REM     %PATH:str1=str2%
REM 会扩展 PATH 环境变量，用 "str2" 代替扩展结果中的每个 "str1"。    
REM 也可以为扩展名指定子字符串。
REM     %PATH:~10,5%
REM 会扩展 PATH 环境变量，然后只使用在扩展结果中从第 11 个(偏
REM 移量 10)字符开始的五个字符。
REM     %PATH:~-10%
REM 会提取 PATH 变量的最后十个字符。
REM     %PATH:~0,-2%
REM 会提取 PATH 变量的所有字符，除了最后两个。







REM 一个界面设计案例
    @echo off
    cls
    color 0A
    title 修复程序
    :menu
    cls
    echo            ==============================
    echo            请选择要进行的操作，然后按回车
    echo            ==============================
    echo.
    echo            1.网络修复及上网相关设置,修复IE,自定义屏蔽网站
    echo.
    echo            2.病毒专杀工具，端口关闭工具,关闭自动播放
    echo.
    echo            3.清除所有多余的自启动项目，修复系统错误
    echo.
    echo            4.清理系统垃圾,提高启动速度
    echo.
    echo            Q.退出
    echo.
    echo.
    :funs
    set c=
    set /p c=       请选择：
    if not "%c%"=="" set c=%c:~0,1%
    if /i "%c%"=="1" goto menu
    if /i "%c%"=="2" goto menu
    if /i "%c%"=="3" goto menu
    if /i "%c%"=="4" goto menu
    if /i "%c%"=="Q" exit
    echo 选择无效，重新选择：
    echo.
    goto funs

REM 2020-4-9
REM Cherry
REM if…command else…command条件语句
REM 上面的command命令都可以用小括号来使用多条命令的组合，包括else子句，
REM 组合命令中可以嵌套使用条件或循环命令。

REM 指定次数循环 for /l %var in (start,step,end) do cmd [cmd-params]
REM 对某集合执行循环语句  for /r [path:] %var in (set) do cmd [cmd-params]

REM 条件循环 利用goto语句和条件判断
        @echo off
        :conntinue
        set /a var +=1
        echo 循环第%var%次
        if %var% lss 5 goto conntinue
        pause

REM 子程序
REM 批处理可以调用本程序中的一个程序段，相当于子程序，这些子程序一般放在主程序后面。
REM 也可以调用外部可运行程序，比如exe程序
REM 子程序调用格式：
REM   call :label arguments
REM 子程序语法：
REM   :label
REM   command1
REM   command2
REM   ......
REM   commandn
REM   goto :eof
REM 在子程序段中，参数%0指标签:label
REM 子程序和主程序中的变量都是全局变量，其作用范围都是整个批处理程序。
REM 在子程序中用%1,%2至%9的形式调用call的参数
REM 子程序的数据只需在调用结束后直接引用,也可指定返回变量
    @echo off
    call :re param
    pause
    :re
    set %1=子程序返回值
    :eof
    echo %param%
    REM 求和
    @echo off
    call :sum a 23 43 56 33
    echo %a%
    pause
    :sum
    set /a %1=%1+%2
    shift /2
    if not "%2"=="" goto sum
    goto :eof


REM 2020-4-9
REM FTP CHOICE 






