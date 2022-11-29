/*
*	Alp Deniz Senyurt
*/

#include <iostream>
#include <string>

unsigned long hexStrToInt(std::string str1)
{
    int base = 1;
    unsigned long dec = 0;
 
    for (int i = 8 - 1; i >= 0; i--)
    {
        if (str1[i] >= '0' && str1[i] <= '9')
        {
            dec += (int(str1[i]) - 48) * base;
            base = base * 16;
        }
 		else if (str1[i] >= 'A' && str1[i] <= 'F')
        {
            dec += (int(str1[i]) - 55) * base;
            base = base * 16;
        }
    }
    return dec;
}


int main()
{	
	std::cout << "In string type: " << "0x1F72D4A8" << "\n---After running the function---\nIn integer type:" << hexStrToInt("1F72D4A8") << std::endl;
	return 0;
}


