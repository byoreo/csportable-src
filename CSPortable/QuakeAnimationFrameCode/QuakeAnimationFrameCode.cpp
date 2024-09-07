// QuakeAnimationFrameCode.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <iostream>
#include <fstream>




using namespace std;


void main(){

int iFrames, iAnimation, iWeiter,iAnimationsumme,iFramesumme,iTest;
char szName[30], szVorname[30];
std::ofstream os("output.txt");
 iTest =0;

 cout <<"############################################################\n";
 cout <<"############## Quake Frame Generator #######################\n";
 cout <<"##############    by Stealth Kill    #######################\n";
 cout <<"############################################################\n\n\n";

 os << "//Generated with Stealth Kills Frame Generator\n\n\n\n";

cout << "Enter the number of your frames\nFrames: ";
cin >> iFrames;


	cout<< "Enter the name of your frame\nName: ";
	cin >> szName;

 cout << "$frame ";
 os << "$frame ";
for(iWeiter = 1;iWeiter <=iFrames;iWeiter++){

	cout <<szName<<iWeiter<<" ";
	os <<szName<<iWeiter<<" ";
}
    cout << "\n\n\n";
    os << "\n\n\n";

    cout << "Enter the number of your model frames\nFrames: ";
    cin >> iAnimation;

	cout<< "Enter the name of your model frames (example player_run)\nName: ";
	cin >> szVorname;

for(iWeiter = 1;iWeiter <=iAnimation;iWeiter++){
	iTest = iTest +1;
	
    cout <<"void()	"<<szVorname<<iWeiter<<"	=	[	$"<<szName<<iTest<<",	"<<szVorname<<iWeiter+1<<"	] {};\n";
	os <<"void()	"<<szVorname<<iWeiter<<"	=	[	$"<<szName<<iTest<<",	"<<szVorname<<iWeiter+1<<"	] {};\n";
	if(iTest == iFrames){
		iTest = 0;}


}

}