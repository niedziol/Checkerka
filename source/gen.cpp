#include <bits/stdc++.h>

using namespace std;

const int MAX = 1e2;

inline int rand_range(int a, int b){ return (rand() % (b - a + 1)) + a; }

int main(int argc, char **argv){
    srand(atoi(argv[1]));
    int n = rand_range(1, MAX);
    cout << n << "\n";
    for(int i = 0; i < n; i++){
        cout << rand_range(1, 100 * MAX) << " ";
    }
}
