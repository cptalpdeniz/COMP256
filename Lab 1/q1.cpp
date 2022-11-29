/*
*	Alp Deniz Senyurt
*/

#include <iostream>
#include <string>

int strToInt(std::string str1)
{
	int dec = 0;
	for (int i = 0; i < 16; ++i)
	{
		if (str1[i] == '1')
		{
			dec += (1 << (15-i));
		}
	}
	return dec;
}

int main()
{

	std::cout << "In string type: " << "0010111010110101" << "\n---After running the function---\nIn integer type:" << strToInt("0010111010110101") << std::endl;
	return 0;
}