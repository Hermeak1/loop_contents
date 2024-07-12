/***********************
프로젝트 명 : Autohotkey_Macro_NoriCube
목        적
[As-Is] 3가지 게임프로그램을 사용자가 종료할때까지 계속 돌아갈 수 있게 매크로 제작
[To-Be] 당사 유니티 프로젝트 매크로 적용통한 원활한 운영 도모
개   발   자 : 원 은정
빌 드  날 짜 : 2023.09.13
배 포  날 짜 : 2023.09.21
버        전 : v1.0.1.3
기        능 : AutoHotKey Macro Develop
- .WEJ 2023.09.20 1차 개발
- .WEJ 2023.09.21 피드백 :
- .WEJ Autohotkey 공식문서 참조하여 함수 사용필독 (https://www.autohotkey.com/docs/v2/lib/)
- .WEJ 2023.09.21 배포
- .WEJ 240408 F1 키 실행 시 오토핫키 프로세스 강제 종료 및 유니티 빌드파일 강제 종료

************************/
; 바인딩 변수
; c드라이브->NoriCube폴더 내에 있는 게임을 바로가기로 만들어서 바로가기 이름을 1,2,3 이렇게 설정한 후 원하는 경로에 옮겨둔다

#SingleInstance  Force
    base := "C:\Just_Games"
    titles := ["NoriCube_Video.exe - exe", "NoriCube_Video.exe - exe","NoriCube_Video.exe - exe""]
    index := 1
    initialized := False

/*
2023.09.21 WEJ
이벤트 콜백함수로 프로세스 감지하여
프로세스 종료시에 자동으로 켜주는 매크로 함수

-RunGames()
*** 사용 Autohotkey에서 전역변수 사용시 'global aaa' 로 선언
*** Run 실행만 수행
*** RunWait 프로그램 실행 후 종료될때까지 수행
*** 반복할 프로그램 수 설정 Autohotkey에서는 인자를 1부터 인식

-StopGames()
*** ProcessClose : 프로세스아이디를 추적하여 강제 종료하는방식 단 ,프로그램의 데이터를 저장할 수 없음.
*** WinClose : 프로그램을 종료 후 현재까지의 정보를 저장 후 종료
*/

RunGames()
{

    global index
    global initialized
    global titles


    try{
         if (initialized == True) {
            ; index := Random(6)

            WinWait(titles[index],,2)
         ;   MsgBox(index)
        ;ProcessClose "NoriCube_Video.exe"     <-------- WEJ : 고도화 작업때 사용예정
        }
        else
        {
            initialized := True
        }

        RunWait base "\" index ".lnk"
        ++index

        if (6<index)
        {
            index:=1
        }

    }catch{
        MsgBox "Can not find the games !"
        }
}

StopGames()
{
    if(initialized == False)
    {
        ProcessClose "NoriCube_Video.exe"
    }
}

; 위의 function들을 수행 및 시간 설정  ms(int)단위
    while(1){
        Rungames()
        StopGames()
    }


; f1키 매크로 종료
F1::
{
    if(Pause){
        WinClose "NoriCube_Video"
        Pause -1
    }
}

F2::
{
    if("F2"){
        Pause -1
    }
}

; Autohotkey 및 게임 종료만 할 경우
;F1::
;{
;    if(ExitApp) {
;    WinClose "NoriCube_Video"
;    ExitApp
;    }
;}

   /* RunWait, "NoriCube_Video.exe" */



