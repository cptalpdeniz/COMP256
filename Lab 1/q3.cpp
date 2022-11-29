/*
*	Alp Deniz Senyurt
*/

#include <iostream>
#include <string>
#include <bitset>

std::string intToStr(int num)
{
	std::bitset<16> bs(num);
	return bs.to_string();
}


int main()
{	
	std::cout << "Integer is: " << "12572" << "\n---After running the function---\nIn binary in string type:" << intToStr(12572) << std::endl;
	return 0;
}