#pragma once

typedef int (FAR WINAPI *pDD_btn)(int btn);
typedef int (FAR WINAPI *pDD_whl)(int whl);
typedef int (FAR WINAPI *pDD_key)(int keycode,int flag);
typedef int (FAR WINAPI *pDD_mov)( int x,int y);
typedef int (FAR WINAPI *pDD_chk)();
typedef int (FAR WINAPI *pDD_str)(char *str);
typedef int (FAR WINAPI *pDD_todc)(int vk);


typedef int (FAR WINAPI *pDD_MouseMove)(HWND hwnd , int x , int y );
typedef int (FAR WINAPI *pDD_SnapPic)(HWND hwnd , int x, int y , int w, int h);
typedef COLORREF  (FAR WINAPI *pDD_PickColor)(HWND hwnd , int x, int y , int mode);
typedef HWND (FAR WINAPI *pDD_GetActiveWindow)();

class CDD
{
public:
	CDD(void);
	~CDD(void);
public:
	pDD_btn      DD_btn ;
	pDD_whl      DD_whl ;
	pDD_key      DD_key ;
	pDD_mov    DD_mov ;
	pDD_chk     DD_chk ;
	pDD_str       DD_str;
    pDD_todc    DD_todc;

	pDD_MouseMove DD_MouseMove;
	pDD_SnapPic DD_SnapPic;
	pDD_PickColor DD_PickColor;
	pDD_GetActiveWindow DD_GetActiveWindow;

public:
	HINSTANCE m_hModule;
	int GetFunAddr(CString dllfile);

};
