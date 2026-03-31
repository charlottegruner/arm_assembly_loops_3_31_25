#include <iostream>
using namespace std;

int main() 
{
        int userVal;
        cout << "Enter a number: ";
        cin >> userVal;
        userVal++;

        int sum = 0;
        int count = 0;

        do
        {
                sum += count;
                count++;
        } while (count != userVal);

        cout << "Sum is " << sum << endl;
}
