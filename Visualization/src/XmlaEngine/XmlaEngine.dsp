# Microsoft Developer Studio Project File - Name="XmlaEngine" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=XmlaEngine - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "XmlaEngine.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "XmlaEngine.mak" CFG="XmlaEngine - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "XmlaEngine - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "XmlaEngine - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "XmlaEngine - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "./include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /YX /FD /c
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 Ws2_32.lib  XODBCV6RM.lib DWSchemaSLib.lib xerces-c_2D.lib Query.lib PreComputation.lib ConfigurationLib.lib /nologo /subsystem:console /machine:I386 /libpath:"./lib"

!ELSEIF  "$(CFG)" == "XmlaEngine - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /FR /YX /FD /GZ /c
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 Ws2_32.lib XODBCV6DM.lib DWSchemaSLib.lib xerces-c_2D.lib Query.lib PreComputation.lib ConfigurationLib.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept /libpath:".\lib"

!ENDIF 

# Begin Target

# Name "XmlaEngine - Win32 Release"
# Name "XmlaEngine - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\src\soap\xsd\AnyURI.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\apr_base64.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\Attribute.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\AxisSoapException.cpp
# End Source File
# Begin Source File

SOURCE=.\src\common\AxisUserAPI.cpp
# End Source File
# Begin Source File

SOURCE=.\src\common\AxisUtils.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Base64Binary.cpp
# End Source File
# Begin Source File

SOURCE=.\src\common\BasicTypeSerializer.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Boolean.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Byte.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\CharacterElement.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\ComplexElement.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Date.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\DateTime.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Decimal.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_DATASOURCES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_ENUMERATORS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_KEYWORDS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_LITERALS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_PROPERTIES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_SCHEMA_ROWSETS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DiscoverMethod.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Double.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Duration.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\ENTITIES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\ENTITY.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\Enumeration.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\ExecuteMethod.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Float.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\FractionDigits.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\GDay.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\GMonth.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\GMonthDay.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\GYear.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\GYearMonth.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\HeaderBlock.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\HexBinary.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\HexCoder.cpp
# End Source File
# Begin Source File

SOURCE=.\src\socket\HTTPParser.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\IAnySimpleType.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\IConstrainingFacet.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\ID.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\IDREF.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\IDREFS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Int.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Integer.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Language.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\Length.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Long.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\main.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MaxExclusive.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MaxInclusive.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MaxLength.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_ACTIONS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_CUBES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_DIMENSIONS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_HIERARCHIES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_LEVELS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_MEASURES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_MEMBERS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_PROPERTIES.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_SETS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MinExclusive.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MinInclusive.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\MinLength.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Name.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\Namespace.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NCName.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NegativeInteger.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NMTOKEN.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NMTOKENS.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NonNegativeInteger.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NonPositiveInteger.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NormalizedString.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\NOTATION.cpp
# End Source File
# Begin Source File

SOURCE=.\src\common\Param.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\Pattern.cpp
# End Source File
# Begin Source File

SOURCE=.\src\platforms\windows\PlatformSpecificWindows.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\PositiveInteger.cpp
# End Source File
# Begin Source File

SOURCE=.\src\precompute\PreComputeMethod.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\ResultSet.cpp
# End Source File
# Begin Source File

SOURCE=.\src\xmla\RowsetBuilder.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Short.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapBody.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapEngineMethod.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapEnvelope.cpp
# End Source File
# Begin Source File

SOURCE=.\src\common\SoapEnvVersions.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapFault.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapHeader.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapKeywordMapping.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapMethod.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapParser.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapSerializer.cpp
# End Source File
# Begin Source File

SOURCE=.\src\engine\SoapServer.cpp
# End Source File
# Begin Source File

SOURCE=.\src\transport\SOAPTransport.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\String.cpp
# End Source File
# Begin Source File

SOURCE=.\src\socket\TestSocket.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Time.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\Token.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\TotalDigits.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\UnsignedByte.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\UnsignedInt.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\UnsignedLong.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\UnsignedShort.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\URIMapping.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\constraints\WhiteSpace.cpp
# End Source File
# Begin Source File

SOURCE=.\src\socket\XmlRpcSocket.cpp
# End Source File
# Begin Source File

SOURCE=.\src\socket\XmlRpcUtil.cpp
# End Source File
# Begin Source File

SOURCE=.\src\soap\xsd\XSD_QName.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\src\soap\apr_base64.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\Attribute.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\AxisSoapException.h
# End Source File
# Begin Source File

SOURCE=.\src\common\AxisUtils.h
# End Source File
# Begin Source File

SOURCE=.\src\common\BasicTypeSerializer.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\CharacterElement.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\ComplexElement.h
# End Source File
# Begin Source File

SOURCE=.\src\common\ComplexObjectHandler.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_DATASOURCES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_ENUMERATORS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_KEYWORDS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_LITERALS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_PROPERTIES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DISCOVER_SCHEMA_ROWSETS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\DiscoverMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\ExecuteMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\HeaderBlock.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\HexCoder.h
# End Source File
# Begin Source File

SOURCE=.\src\socket\HTTPContext.h
# End Source File
# Begin Source File

SOURCE=.\src\socket\HTTPParser.h
# End Source File
# Begin Source File

SOURCE=.\src\common\ISoapMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_ACTIONS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_CUBES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_DIMENSIONS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_HIERARCHIES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_LEVELS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_MEASURES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_MEMBERS.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_PROPERTIES.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\MDSCHEMA_SETS.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\Namespace.h
# End Source File
# Begin Source File

SOURCE=.\src\common\Param.h
# End Source File
# Begin Source File

SOURCE=.\src\precompute\PreComputeMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\Resultset.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\Rowset.h
# End Source File
# Begin Source File

SOURCE=.\src\xmla\RowsetBuilder.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapBody.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapEngineMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapEnvelope.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapFault.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapHeader.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapKeywordMapping.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapMethod.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapParser.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\SoapSerializer.h
# End Source File
# Begin Source File

SOURCE=.\src\engine\SoapServer.h
# End Source File
# Begin Source File

SOURCE=.\src\transport\SOAPTransport.h
# End Source File
# Begin Source File

SOURCE=.\src\soap\URIMapping.h
# End Source File
# Begin Source File

SOURCE=.\src\socket\XmlRpc.h
# End Source File
# Begin Source File

SOURCE=.\src\socket\XmlRpcSocket.h
# End Source File
# Begin Source File

SOURCE=.\src\socket\XmlRpcUtil.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
