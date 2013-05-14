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
 *MDX���֧�ֶ��Hierarchy��һ������£�Hierarchy
 *��Ĭ�ϵģ���MDX��������ǲ������Hierarchy����Ϣ��
 *��Ҳ����ָ���ǲ���Ĭ�ϵ�Hierarchy���в�ѯ����ʱ��
 *Hierarchy�����ָ�����Dimension���ֺ�
 *�磬Ĭ������£�[Time].[1997],Time ��ά�����֣�1997��
 *��Ա����Hierarchy�����ǿ������ģ�Ĭ�ϵģ�������ָ��
 *��һ����Ĭ�ϵ�Hierarchy���в�ѯ����[Time.***].[1997]
 *��ʱ��***��Ϊָ����Hierarchy;
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

//�ж�����ͬsize��vector<QueryMember*>�ĵ�n��QueryMember�Ƿ���ͬ,n�ķ�ΧΪ[0,vec1.size()-1]
//0��ʾ�Ե�һ�н��д���ǰ��û���У���Ϊ�档
//��Ҫ����hirarchize�����Ĵ�����
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