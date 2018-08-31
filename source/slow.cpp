#include <bits/stdc++.h>

using namespace std;

vector <int> data;

int main(){
    int n;
    cin >> n;
    for(int i = 0; i < n; i++){
        int x;
        cin >> x;
        data.push_back(x);
    }
    sort(data.begin(), data.end());
    cout << data[0] << "\n";
}
