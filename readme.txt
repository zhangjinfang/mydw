Engin: OLAP引擎
metadata：元数据模块
PreComputation：预计算模块
Query：查询模块
Visualization：控制台管理模块
TestCenter：共享目录，存放个模块的公共测试数据以及测试模块，请生成测试数据时，指向该目录，并在此目录写测试程序
include：共享目录，请将.h文件放入此目录，以同步更新此目录的头文件
lib: 共享目录，请在Project->Settings->General->Output files设置为..\lib，以同步更新此目录的库文件






DWSchemaSLib.lib(XSchemas.obj) : error LNK2001: unresolved external symbol "public: class XElement * __thiscall XElementList::item(unsigned int)" (?item@XElementList@@QAEPAVXElement@@I@Z)
DWSchemaSLib.lib(XSchemas.obj) : error LNK2001: unresolved external symbol "public: unsigned int __thiscall XElementList::getLength(void)" (?getLength@XElementList@@QAEIXZ)
DWSchemaSLib.lib(XSchemas.obj) : error LNK2001: unresolved external symbol "public: bool __thiscall XElementList::hasChildNodes(void)" (?hasChildNodes@XElementList@@QAE_NXZ)
DWSchemaSLib.lib(XSchemas.obj) : error LNK2001: unresolved external symbol "public: class XElement * __thiscall DWConfig::getRoot(void)" (?getRoot@DWConfig@@QAEPAVXElement@@XZ)
Debug/TestPreComputation.exe : fatal error LNK1120: 10 unresolved externals
执行 link.exe 时出错.

TestPreComputation.exe - 1 error(s), 0 warning(s)


XODBCDatabase.cpp
f:\昆工\git\mydw\xodbc\xodbc\xodbc(v6)\src\xodbc\xodbcdatabase.cpp(3) : fatal error C1083: Cannot open include file: './XODBCDatabase.h': No such file or directory
XODBCDataSource.cpp
f:\昆工\git\mydw\xodbc\xodbc\xodbc(v6)\src\xodbc\xodbcdatasource.cpp(1) : fatal error C1083: Cannot open include file: 'XODBC/XODBCDataSource.h': No such file or directory
XODBCError.cpp
f:\昆工\git\mydw\xodbc\xodbc\xodbc(v6)\src\xodbc\xodbcerror.cpp(1) : fatal error C1083: Cannot open include file: 'xodbc/XODBCError.h': No such file or directory
XODBCException.cpp
f:\昆工\git\mydw\xodbc\xodbc\xodbc(v6)\src\xodbc\xodbcexception.cpp(1) : fatal error C1083: Cannot open include file: 'xodbc/XODBCException.h': No such file or directory
XODBCRecordset.cpp
f:\昆工\git\mydw\xodbc\xodbc\xodbc(v6)\src\xodbc\xodbcrecordset.cpp(1) : fatal error C1083: Cannot open include file: 'xodbc/XODBCRecordset.h': No such file or directory
执行 cl.exe 时出错.

xodbcv6d.lib - 1 error(s), 0 warning(s)
