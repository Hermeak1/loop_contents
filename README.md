## Autohotkey Streaming_Macro 
1.2.0.0
### Autohotkey를 사용하여 Unity게임을 Stream 시킬 수 있는 매크로
----
- 사용버전 - Autohotkey V2

- 공식사이트 - https://www.autohotkey.com/docs/v2/lib/

----

현재 6분단위에 맞추서 프로그램 3가지가 스트리밍을 하는 방식

향후,
고도화 작업시 RunWait , ProcessClose 를 이용하여  순환 예정

단 Unity Game 내부에서 게임시간이 다 되었을때 자동 종료되는 이벤트 처리를 해야한다.



F1 : 자동재생 Pause / 켜진 유니티빌드파일 종료
F2 : Pause 풀고 다시 시작 / 다음컨텐츠부터

예시) 1,2,3,,, 순으로 재생이 될예정이고 1번파일 부터 시작을 하고 f1키로 정지를 시킨후 유니티 빌드파일도 같이 종료가 된다. 이후 f2로 다시 pause를 풀면 2번부터 실행이된다.