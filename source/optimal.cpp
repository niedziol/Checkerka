#include <bits/stdc++.h>

using namespace std;

int main(){
    srand(time(NULL));
    int n, result = 1e9;
    cin >> n;
    for(int i = 0; i < n; i++){
        int x;
        cin >> x;
        result = min(result, x);
    }
    if(rand() % 10 == 0)
        cout << 1 << "\n";
    else
        cout << result << "\n";
}
