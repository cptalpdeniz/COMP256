/*
*	Alp Deniz Senyurt
*/

#include <iostream>
#include <string>
#include <bitset>

std::string intToHexStr(int num)
{
	std::bitset<16> bs(num);	
	std::string str = "";
	int index = 0;
	for (int i = 0; i < 16; i += 4)
	{
		std::bitset<4> tempBs;
		for (int j = i; j < (i + 4); ++j)
		{
			tempBs[index] = bs[j];
			index++;
		}
		int a = tempBs.to_ulong();
		unsigned char c;
		if (a >= 0 && a <= 9)
		{
			c = static_cast<unsigned char>(a) + 48;
		}
		else
		{
			c = static_cast<unsigned char>(a) + 55;
		}
		str = (char)c + str;
		index = 0;
	}

	return str;
}

int main()
{	
	std::cout << "Integer is: " << "12572" << "\n---After running the function---\nHexadecimal stored in string type: 0x" << intToHexStr(12572) << std::endl;
	return 0;
}