#ifndef __COMMON_H__
#define __COMMON_H__

#include <algorithm>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <assert.h>
#include "MdxParser/QueryMember.h"

using namespace std;

/*
 *MDX语句支持多个Hierarchy，一般情况下，Hierarchy
 *是默认的，在MDX语句里面是不会出现Hierarchy的信息的
 *但也可以指定是不对默认的Hierarchy进行查询，此时，
 *Hierarchy的名字附加在Dimension名字后。
 *如，默认情况下，[Time].[1997],Time 是维度名字，1997是
 *成员名，Hierarchy名字是看不到的，默认的；但可以指定
 *对一个非默认的Hierarchy进行查询，如[Time.***].[1997]
 *这时，***即为指定的Hierarchy;
 *
 */

inline bool isDimHie(string& dimHie)
{
	int a = dimHie.find(".");
    if(a == -1)
		return false;
	else
		return true;
}


inline std::vector<string> distinct(string& dimHie)
{
	std::vector<string> dimHieInfo;
     if (isDimHie(dimHie))
     {
		 int n = dimHie.find(".");
		 int size = dimHie.size();
		 string dimName, hieName;
		 dimName.assign(dimHie, 0, n);
		 hieName.assign(dimHie, n+1, size);
		 dimHieInfo.push_back(dimName);
		 dimHieInfo.push_back(hieName);
     }
	 else
	 {
	     string dimName = dimHie;
		 dimHieInfo.push_back(dimName);
	 }

	 return dimHieInfo;
}

//判断两个同size的vector<QueryMember*>的第n个QueryMember是否相同,n的范围为[0,vec1.size()-1]
//0表示对第一列进行处理，前面没有列，永为真。
//主要用在hirarchize函数的处理上
inline bool isEqual(vector<QueryMember*>& vec1, vector<QueryMember*>& vec2, int n )
{
	bool eql = true;
	if (vec1.size() != vec2.size())
	{
		return false;
	}
	else if(n >= vec1.size())
	{
		return false;
	}
	else if (n == 0)
	{
		return true;
	} 
	else
	{
		for (int i = 0; i != n; i++)
		{
			if ((vec1[n-1]->getVal() != vec2[n-1]->getVal())&&(vec1[n-1]->getLevelName() != vec2[n-1]->getLevelName()))
			{
				eql = false;
			}
		}
		return eql;
	}
}

#endif  