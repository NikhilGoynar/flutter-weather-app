#include <iostream>
#include <vector>
using namespace std;

int main() {
	int t;
	cin>>t;
	while(t--){
	    int n,m,mex;
	    cin>>n>>m>>mex;
	    int arr[n];
	    vector<int>a(mex,0); 
	    for(int i=0;i<n;i++){
	        cin>>arr[i];
	        if(arr[i]<mex){
	            a[arr[i]]++;
	        }
	    }
	    int res=0;
	    if(mex>n){
	        cout<<"No"<<endl;
	    }
	    else{
	        int ct=0;
	        for(int i=0;i<mex;i++){
	            if(a[i]==0){
	                cout<<"No"<<endl;
	                break;
	            }
	            ct+=a[i];
	        }
	        if(ct>=m)res=1;break;
	        for(int i=0;i<n;i++){
	            if(arr[i]>mex)ct++;
	            if(ct>=m)res=1;break;
	        }
	    }
	    if(res==1)cout<<"Yes"<<endl;
	}
	return 0;
}
