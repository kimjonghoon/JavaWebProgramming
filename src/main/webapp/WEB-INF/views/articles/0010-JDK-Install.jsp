<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<article>

<h1>Java 설치</h1>

<h2 class="floatstop">JDK 인스톨러 다운로드</h2>

<p>
<a href="https://www.oracle.com/java/technologies/downloads/">https://www.oracle.com/java/technologies/downloads/</a> 
</p>

<p>
<img src="https://lh3.googleusercontent.com/NPFI5WCRekGIjG8sYrKP4rIDrsSwCw0ETc9LyjYFJzv_00BrXZ7pYKe-f4kqK9mORF9Si2XBYx81NSPsl19DvazAM87Uqw4OpF2gj9egANGS0MeCZKdZVTeWuJz2gdNlDor3Xvfj3y0L77JU_arerf4jq26o1p1GwtJMLt87-P4_x80bVg6zW2AG90fgDeB7bQZpK_LehwJ0NNGfcUqOX-53UK1ZWIsUlvvZyVFY8CPZ988n4FW4IrExv1H8WfSU7vvI13iVFcGJCpps40d-Cm7ypmPwQe6KM5cSt40ZyRR7iwq9kRtBcPwzTskZkRot3aaue_WLYAAH7YulF4CTpaJjdD5OPK2d28UdlRVhMkPYHbwq7o-FHNxMM9bRzzURC0zMd3YbYY79AtAz9T5u5jclcaZnZ8DTn1T0E8Bb0mhS4_RO1bRl5aygLmjFN7S5zjtCJDHKBF7YmwPVLHJTeKIvZzK_keHg9vAmn_BALWlVtrfmLelMjaR0xDkK9uGs7AwUKaKx-PjnE7n_plyyjFGcpPr2nlOE51cEGgxKccAUlaKRlpO_4RmDTvN6YD_8dhY0gkek5NUuoKLhGJ30K-90OIhhxSMilYnQHof4WxBf-8cGiF4j8cLVsxHiOcjnfuLJQLyuH_Uua2p4Pf4n59zzlQnQ4niiiNzsbCPeKifqNaohXCsmnSgBDyBquNq-p8OyJrWn93LitJrn9Opip7SF=w1194-h889-no?authuser=0" alt="JDK latest version" />
</p>

<div class="explain">
<b>Note:</b>
자바 9부터 32 비트 윈도 시스템은 지원하지 않는다.<br />
32 비트 시스템은 자바 8 최신 버전을 설치한다.
</div>

<p>
공식 사이트에서 x64 Installer를 내려받는다.
내려받은 파일을 실행하고, Next 버튼을 계속 클릭하면 JDK를 설치한다.
JDK는 C:\Program Files\Java\jdk-xxx (xxx는 버전)에 설치된다.
</p>

<h3>Path 환경변수에 JDK의 bin 디렉터리 추가</h3>

<p>
윈도 10의 경우, 시작 메뉴를 마우스 오른쪽 버튼으로 클릭한 후 '시스템(Y)'을 선택한다.
</p>

<p>
<img src="https://lh3.googleusercontent.com/r7P8_xbqIofwoVvNhEKcNQEDOyaQINiGvVYY9k3N9WejVyZXNqoHIC5YYF9PIJDC-Oc94oOvjnSnXi9eV2LSmHumMOjVJCHqB9G6CUEBFKwDN20ixS5G0L942FZ0TgN-hZbCW3FJLWZzIW9yE74rzj_4Hd-gElBACOpS73j1uDs_fYq22b1PElO_ePeHfUDNLCL7V2mKY1P_mLqFMPQPYl8tV1ZCM9SmnKBUHq9m4ZbEuWm04Z6TUd4a8ypvfsPV9d5mUYAhfL1QplyhuHjFGUfuZnHgp42QjDOGYKdEMu7B3M39DDvLmQngqO3rfXLJ0ZIja6Pg6_qXVw2MHL7ERR99m70cd8Bq4d6fmbF6qdGBxpvqEjEnNoNCJmpzpGMJcbAt5ZctL6OsM0SdVDZBOoaAo-SiBMgf0N0gKzyUdaPSgZMpePKay38muMbddvk4qfNeCeLs1aad9KZjt9kNr78aUsxMGqg49Lw4zwy67S4bPh3zt0iQbdurFVbRx5zr7F09EYsV0Yi_ymk2fGlRDyA2izhqglA0HBw5KN2ttO4ZtlUpJwvIvj9KhcwhwhqOzOxqI2n5muflCUlzskN2lqI-HtWqINxMnbelylnMV9sp3DTpSO12cd3cZUlJS2zfbADpYKScDmC-BWJUK67EZH_yR_D6uTZO8MN2SEAISUl1t9wi9yXwYp-8-uxfM4o5FCbO5XVbpyVGaGA8k_Ot65b5=w509-h631-no?authuser=0" alt="System" />
</p>

<p>
'고급 시스템 설정' 선택
</p>

<p>
<img src="https://lh3.googleusercontent.com/6-rkB0XujleuNLYZfI2Ajlt2fid3bZv5LGqNAC61dxt2dMNbVHPR1h3FkqqZRdyvuEfn5xQfwe57S0ow61P59owRSVBORwozj3zOJsVXVn596xqq9dORoOZKuObwTKnyymiitFHjm_gtRunIsGp-JyGcq8MoubmHdsYh2tK7-8bxTjBhPXcBxSH_W4tVB45DumdzcCq4DyEQcq0QfGh5jk88HZMpbOymsC0TBG8XFlTcERnhxeDs6YspSyW0WnhxHSXT1xKnu7MnTw1BXiDzjX0Nu9PyrAhkFoBYVo9RBOQ1NRJtdy_QIBlIlIwH0fwpp2NOrCmgn4Nj_uc-wLTm9eyY01rZnUq4Hh_fc1-qu2bMKTwiW6ziz3L7nUYs0gf52C3aIQzM58jiXVniggTLDtLHF2Gr58JPZT6guEHS3VAvIwbHifKycG0vZHOeuNfXplGVW1wD9krLPDj-xhNujOAzmw8KL90XSjyYtz8NWtRc_9rlNJpHo1_FfVjpRtMVgP_23jiXgYvKn2emrN4c9uEOxaNII-oPNYWmtXXBEB6hmdfvJZVNkDLGvhwVEXYkimSuces2xAB3xl7aezK14x5qOkEdlBxandwbYWG8JfIt5z3el7eLafSw3VIsNsMubD6C3q0hpn_aC15cSwKjFy5VOPcqe32LdaoA-OLCAoOnCGnWrk9drjuJHb0TmAkVxUC3bcTygH4eX9WnOkJ0yzMp=w1042-h344-no?authuser=0" alt="고급 시스템 설정" />
<p>

<p>
'고급' 탭에서 '환경 변수(N)' 클릭 
</p>

<p>
<img src="https://lh3.googleusercontent.com/JJyvk_75ZPtE6NaOF2A-Kzs0BVk44wQuAb9kvSMEPqg-twL76FYFIT37FuiprTLFj8JIuOJsrzY3yzAI7A2F8LOZ7gUskEpbZZLTpClrekHAoAsFUCrHXcJCYIqVoa_5qJnlCbCEfkHiGEIU0PYc7ZlqSeXhcfG-Lyjv-7mAuROdDR4JVMFxG73IASYesG-KRDLUCl78hreTXtNzSsh7F3KlPbHzRSv3XcRVlvpdV0cpTiRg4dC9cVcHJO1Rq7NukdbLRzepW9QM2rbM9f9Ek6utEI_-Ub2bP3EBfgYgf4oCShZIjXDKWlvZtViwzKbaUe28nMxwGTPhHIuoaw8HLcHoYtO62cl0y5uUXd5teJQWWzL9IFUNuPKY5AAWjGgAZTRUzcLNkGWCRErc0UpfNyiNxWRiOkZqn0e5UNRFn0tteQw4EhcBtm4q99Fx1JAw8Rd12OP2tthrKDy1Oh8MtXSgOI4BYgSq9iDmwN5qvcOc5G0NwMGymlwwrH6XpDmZdN70uaDr1-fWmVjKHAUjGWYvFKBWU0VPXiZosMGvRfHp1ZC_KQOos3WONi1jhmyxn51Se9eZqIlK9LUursHrp925QrOkHUYTO7aRNT62_wEgNTp8CAl-2gQw8-lo7uwEGKccqWmkZ2h65Or5ttRIS1hawv788WdyUPa54rGaq9Nl1RxM5sQADXGZld2n_2_F-Muag7uLTLpYNs8IezvD5kNc=w481-h535-no?authuser=0" alt="환경 변수" />
</p>

<p>
사용자 변수(U)의 '새로 만들기(N)' 버튼 클릭
</p>

<p>
<img src="https://lh3.googleusercontent.com/UhxnkXOpx0JoYnaPY0265pwBSQkQ4vS4rDnMGWiyO2a5apuxrMlXzEsYlOFqVBTwh1c9jJCeRY-VBfd0exm7a30f8xzpkIzOGbgy3JS1cFrzEcGgOA2expgAbVaMTees39p0lhqug6P1dLEtaOCo_FUK2XO-cGyxhv24DlTDFX7RlfftjECXTIY6BgR8KPW3xShSMZnKPwaaoH6bMup77UPOKn25-5ADTSPdnlNXSufXK3Pl79saB06zfiH_LzKiiG67vn58sWBbroQ5eotzgWgVkD8i-exJM-MOuOztuZJ6Ji-TyHZl7JWCq5SZEVs6yKvnKlTUMv3A2A-RdC4W4-_Xshq98QBeGCEPrL4VVhEH9IqcPhwv3CWax6Eaq37LcysduJsUNzTkwpX39UUNIOXEi5TdINkr9S1qNSB77lH1HjKpL9DJreKlyK_h_FECMrKmOIqW6qeMfrodErD6A8SrjZ9yEWuL6mM3AiCpZ_OjQfwRI0f87LuhnkmCpkoEABnu67wU4iLRSLAt1LTeJVYSQKAySAQg2a8RXqX5d9XsBN6trMmikoGpAe9hLt3h6YAOyGlpeK1TF5R7wdrMdoGSm9_HNFM3zd2h4hHMWD5yc2UoqSqlIQYHED4tU10rEq--Q9RB5ReQ0qy-dS16WyjyynbA8qVzC_aZiUbfnXats4RZHSVgNizW-ZzQUzSKKnHmcIkHUICyfnHm0Uf2KiG-=w478-h517-no?authuser=0" alt="사용자 변수(U)의 새로 만들기(N) 버튼" />
</p>

<p>
변수 이름(N)에 JAVA_HOME, 변수 값(V)에 '디렉터리 찾아보기(D)'로 자바가 설치된 디렉터리 입력 
</p>

<p>
<img src="https://lh3.googleusercontent.com/tuSsQrP-iKoFoOKO-i3DgDKs78rnrsN1C7-o8zjTRNcRc_WgnmN7kKOi1f-bv4hT9zMRGMBdL-41i6VMM-g3H1rc_TnsBaFV9Q70zRarEwg57gYJ1wZTsN5lE4fVV6776IRm3QBUwUhZTalh8T0vTzfcn0lAArxA3HgJhqesG7zKofZmShN79Qd3hgFEZ7XwoUcvE4LaBFtaIobsgQOjS_np12k77D1E7YuIVJL2wKPb6UDFc9kLp8_iPGPwhz1UsNpqJ65uGWPDgU9D3fD2LPawPvXwR-3Sj1mTtlP1P5x0zJjrAHqLw0zUiMJ3HlgDObjB9TQwsXcR2WwlZYSlICw7HR1nFCS75ovcQoB1qHNVBXhPldmiNF6lLpTVhjFV4pz6UHJ-PrIrhKzIDci8nHLRQfBbDliLUIB0jWzgsyS_2WwTzI5gsABe_ycM2qaMco49Yfg6vfnTKtZFOGOizE9QMGsZrsrpXkfrStwAjzPo4kLdSI3TJDnacV3EFC2XfsuASV1eOmn4K-OKyKgprNdCs6r1YWXfo5mzbU90CkT-W0PT4LGWORyTu_2tRWy_GXcEONC4_Us85jndkc3wYWNmuy21dGS5ifrzI7YUHthC-w7frNQcftK1_LJHw5lTd3xZggTh4EVQOqUGQVTnNSwlkx8kWrejMUuexxSP80TaQ7x3bHXNCvpJzWb_8eAy8Je8Qmmum30ArgVg2SQdBlLBnzWaK5KS9V7g322-zXBodF4vTGwV--p_ohGrJw=w555-h165-no?authuser=0" alt="JAVA_HOME" />
</p>

<p>
사용자 변수(U) 목록에서 Path 선택하고 '편집(E)' 버튼 클릭 
</p>

<p>
<img src="https://lh3.googleusercontent.com/pnmvQn_5hDnJtYJNvss3ouh-kKxgrHdMX0cL20nG0DvRH-76bMPD7fFOWGbx9gYpg193Z-nrpfFljQSUtBXf5zJ86TdXPuji_8sAnK3IgB18GcmILxmJScRDuEZzOz62ZNifj7pTsZaF-NBgO5-72vmInOap4NjG8K5aaXy-JxzpSqcXzPN863SrtO5UZiIFFRFcdk0_6qrY_F4_7NipVjEZjuqPmRwsQFocRSYw_aezR2j0pmANshmv4nvNPwyGHhnTabupUn-ku5xVyeTM-fzR1PALRGxCAYqB8I7QWKwjmEXcSv-KtUl73E7w0NV1GfvDL63tJsBl5_mL8rcT4AFtUVTE3ARw_gzSfPTGBpg1yLEikzDUIb7NdiVwvpAi2ETp06NLaoAGyOzUSTJdc4coRnHHjMvKYDuIv0ICmSa6t_uZtduCDv5fUwcWQwaFkjdz940i1MTA2nSf16DUX0XOYlPss946hC97WiUfsNPJwf34bF3oELIyd5TspAleVfjfZ67sJoPrpGBri9uL-Zl681QAt9quLtynlhuWetKDLX4lcKob5tF3Zim23zK4EzRWkXU9xgR-WJgXrryp22-bcl6UdqMspytWOYOE1IpiGR5Mir7TOpw6rKRFJIiCYzVuOIMhGaBFXpH37xnDtphFP39vmXE8wOnG_aRHDWM20evmgTa71AD5fpHrhRqGDQMqc2H27wHS18gPEkswdknq=w468-h507-no?authuser=0" alt="Edit your Path" />
</p>

<p>
'새로 만들기(N)' 버튼을 사용해 %JAVA_HOME%\bin 추가
</p>

<p>
<img src="https://lh3.googleusercontent.com/eoKh0I3cfiW1o1NUv7YkuK5OBxeMSwKIB3pl3Lz-VcLEkvpi2Df-mKnoF5L-AillaECZOols5RL2uD-EoH2KoyWky7sIhT0e1ZT7R0gayQz2e9unQ5Op0-TVI40vDKxNi0sgXx6Vm9lOmO-I3nhnE-gAuXjgYJLQu7W0nTzmmYxpB4nCdmFbAiWX5SL1UwE6PWT3uqj9Niv8l3buT5SqRNodJe6K9G2jQgtfQ9zP-aJ2-QupdSaapTokxOfkZrDcIjtk-TM86Pch5Le7MmbKLpKxLheXFLsRbBWYF5Hy5sknSl-64hxZlQqiVAaFi0yN66p5Ey12hr_8p97n0rEkbmbG5D3OUAi0ftUvCsjs-JlXE5pEaUQrVXLnl6rrs3NU83Xz4V-7kgWQffN39O6HByXIQdvUXlkR85yCPmD21tLRjfx0AEyuhp3LJ3FSoqrOXK7eq8jejMEEXSHeuoQ6dl2MqNT-nM6k2hnwzdxXEhBbZ6E3vjfyJg5JFuth0kOtRGcY6vX4fhuS1_hylRpRPuOUAfC1InxQ5IQKTkBs-t-2ZJqsWrjocKkSeS5xql9f7XFfcOty4GVA6JzBkJWU039SkEfPn-LpvM4JQnZ63MVqWG4FM6FuYB4_7yOJQCFE7Hx6u4XAw18ovWA9trwxLBa0C91yagwfnqSL9cwzFOHQrcBgEtn46fNp2IXoNnEY8IDHWGX5xcxPNe-T4MePeKD6=w527-h434-no?authuser=0" alt="%JAVA_HOME%\bin" />
</p>

<div class="explain">
<p>
<b>Note:</b>
사용자 변수 Path 값은 시스템 변수 Path에 추가된다. 윈도 운영 체제는 실행 프로그램을 시스템 변수 Path에 추가된 디렉터리에서 찾는다. Path에 JDK의 bin 디렉터리를 추가하면, 어느 디렉터리에서나 JDK의 bin에 있는 윈도 실행 프로그램(javac.exe, java.exe, jar.exe 등)을 실행할 수 있다. Path에 JDK의 bin 디렉터리를 추가하지 않았다면, 컴파일할 때 javac.exe 윈도 실행 프로그램이 있는 경로로 이동하여 실행해야 한다.
</p>
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Program Files\Java\jdk-17.0.2\bin&gt;javac C:\Users\javaschool\Test.java
</pre>
<p>
명령 프롬프트에서 echo %PATH%를 실행하면 설정된 Path를 확인할 수 있다.
</p>
<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;echo %PATH%
C:\Program Files\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Users\javaschool\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Java\jdk-17.0.2\bin;
</pre>
<p>
출력된 경로를 보면 세미콜론(;)으로 디렉터리를 구분하고 있음을 알 수 있다. 윈도 시스템에선 세미콜론을 환경 변수 구분자로 사용한다.
</p>
</div>

<h2>테스트</h2>

<p>
명령 프롬프트를 열고 다음을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;notepad Test.java
</pre>

<p>
파일을 저장한 후 다음을 입력한다.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
public class Test {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
</pre>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;javac Test.java

C:\Users\javaschool&gt;java Test
Hello World!
</pre>

<p>
javac Test.java로 컴파일할 때, <em>'javac'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는 배치 파일이 아닙니다.'</em> 라는 에러는 Path 환경 변수에 JDK의 bin 디렉터리를 추가하지 않았거나 잘못 추가했을 때 발생한다.
</p>

<p>
java Test로 실행할 때, <em>'Exception in thread "main" java.lang.NoClassDefFoundError: Test'</em> 에러는 자바가 Test.class 파일을 찾지 못할 때 발생한다.
</p>

<p>
Test.class 파일이 없는 디렉터리에서 java Test를 실행하면 같은 에러를 만난다. 클래스 파일(Test.class)이 없는 디렉터리에서 실행하려면, java 다음에 -classpath 또는 -cp를 입력한 후, 한 칸 띄고 클래스 파일이 있는 경로를 입력하고, 마지막에 실행할 클래스 이름을 입력해야 한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users\javaschool&gt;cd ..

C:\Users&gt;java -cp C:\Users\javaschool Test
Hello World!
</pre>

<h2>에디터 선택</h2>

<p>
<a href="/java/Package_Modifiers">패키지와 접근자</a>까지 
<a href="http://www.editplus.com/kr/">에디트플러스</a>나 
<a href="https://notepad-plus-plus.org">Notepad++</a>
같은 단순한 에디터를 사용하는 게 좋다.<br />
패키지와 접근자를 학습한 후에 <a href="https://www.eclipse.org">이클립스</a>를 사용한다.
</p>

</article>

<article>
<div id="next-prev">
  <ul>
    <li>다음 : <a href="/java/Features">자바의 특징</a></li>
  </ul>
</div>
</article>
