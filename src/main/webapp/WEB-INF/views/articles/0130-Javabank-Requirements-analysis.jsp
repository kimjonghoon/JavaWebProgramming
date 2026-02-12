<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>자바은행 - 요구사항 분석</title>
<meta name="Keywords" content="요구사항 분석,Requirements analysis,시나리오,Scenario,클래스 다이어그램,Class Diagram,is a,has a" />
<meta name="Description" content="첫 번째 자바 순수 예제인 자바은행의 요구사항 분석에 관한 글입니다" />
<link rel="stylesheet" href="../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>자바은행 - 요구사항 분석</h1>

<p>
자바로 구현하는 은행 프로그램을 실습한다.
</p>

<p>
만들 프로그램에 대한 명확한 이해를 동료와 공유해야 하는데, 그러기 위해서는 아래 시나리오와 같은 작업이 필요하다.
</p>

<h2>시나리오</h2>

<ul>
	<li>은행은 계좌를 등록한다.</li>
	<li>은행은 계좌번호로 계좌를 찾을 수 있다.</li>
	<li>은행은 계좌 소유자 이름으로 계좌를 찾을 수 있다.</li>
	<li>은행은 모든 계좌의 목록을 볼 수 있다.</li>
	<li>계좌는 소유자명, 계좌번호, 잔액으로 구성된다.</li>
	<li>계좌는 입금, 출금, 잔액 확인 기능이 있다.</li>
	<li>계좌 잔액 변화가 있을 때마다 거래 내용에 기록된다.</li>
	<li>거래 내용은 거래 일자, 거래시간, 거래금액, 입금 또는 출금으으로 구성된다.</li>
</ul>

<h2>클래스 다이어그램</h2>

<p>
시나리오로부터 클래스와 필드, 메소드를 추출해 내어야 한다.
시나리오에서 명사는 클래스나 필드로, 동사는 메소드가 된다.
<img src="https://lh3.googleusercontent.com/-Dgg4barA3Sk/VX_qKuvc-LI/AAAAAAAACLI/9r_JG99thNs/w617-h526-no/bank-classdiagram.png" alt="자바은행 클래스다이어그램 추상화 단계" style="display: block;" />
분석/설계 단계에서의 산출물은 아래와 같은 클래스 다이어그램이다.
<img src="https://lh4.googleusercontent.com/-7_W2KsCUQSU/VX_qK5Qp9gI/AAAAAAAACLM/5EQN6xP4NXo/w814-h526-no/bank-classdiagram2.png" alt="자바은행 클래스다이어그램" style="display: block;" />
</p>

<p>
Transaction, Bank, Account 클래스에서 미루어 짐작 가능한 게터<sup>getters</sup>와 세터<sup>setters</sup> 메소드는 생략했다.
</p>

<p>
-는 private, +는 public, #는 protected 접근자를 의미한다.<br />
</p>

<p>
클래스 다이어그램은 클래스 구조뿐만 아니라 객체와 객체 간의 관계도 나타낸다.<br />
클래스 사이에 선이 연결되어 있다면 그 클래스로부터 생성된 객체는 서로 관계가 있다.<br />
</p>

<p>
다이아몬드는 객체가 다른 객체를 부품처럼 가진다는 의미이다.
</p>

<p>
객체가 다른 객체를 부품처럼 가지는 관계를 'has a'관계라고 한다.<br />
은행은 여러 계좌를 가지고 있으므로 은행과 계좌 클래스는 "has a" 관계다.<br />
</p>

<p>
'has a'관계 중에서 본체가 사라지면 부품도 같이 사라지는 강한 결합이라면 이를 합성(Composition)이라 하고 검은 다이아몬드로 표현한다.<br />
</p>

<p>
본체가 사라지더라도 부품이 사라지지 않는 약한 결합을 집합(Aggregation)이라 하고 속이 빈 다이아몬드로 표현한다.<br />
</p>

<p>
자바에선 합성이나 집합 모두 레퍼런스 변수로 구현한다.<br />
이 변수에 부품에 해당하는 객체 레퍼런스가 할당된다.
</p>

<p>
0..*는 부품 객체의 수로서, 0 이상을 의미한다.
</p>

<p>
화살표는 객체가 다른 객체의 메소드를 호출하는 방향이다.
</p>

<p>
클래스 다이어그램 외에 유즈 케이스 다이어그램<sup>Use Case Diagram</sup>, 시퀀스 다이어그램<sup>Sequence Diagram</sup>등 다양한 다이어그램이 필요할 수 있다.<br />
하지만 간단한 프로그램은 클래스 다이어그램만으로 충분하다.<br />
</p>

<span id="refer">참고</span>
<ul id="references">
	<li><a href="http://www.infopub.co.kr/bookinfo/bookinfo.asp?sku=05000195">New 알기쉬운 Java 2 J2SE 1.4</a></li>
</ul>

</article>

</body>
</html>
