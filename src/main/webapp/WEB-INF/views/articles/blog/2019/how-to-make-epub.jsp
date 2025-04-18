<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2019.10.9</div>

<h1>EPUB ebook 만들기</h1>

<p>
EPUB를 위한 디렉터리를 생성한다.
</p>

<h6 class="src">EPUB 디렉터리</h6>
<pre style="border: 2px dotted grey;padding: 0.3em;" lang="en">
MyFirstBook (ROOT Directory)
├── mimetype
├── META-INF
│    └── container.xml 
└── OEBPS 
    ├── content.opf
    ├── toc.ncx
    ├── css
    |    └── epub.css
    ├── images
    |    └── cover.jpg
    └── xhtml
         ├── cover.xhtml
         ├── preface.xhtml
         ├── ch01.xhtml
         └── ch02.xhtml
</pre>

<p>
위 디렉터리 구조대로 파일을 생성한다.
</p>

<h6 class="src">mimetype</h6>
<pre style="border: 1px solid grey;padding: 0.3em;" lang="en">
application/epub+zip
</pre>

<h6 class="src">container.xml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container"&gt;
    &lt;rootfiles&gt;
        &lt;rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/&gt;
   &lt;/rootfiles&gt;
&lt;/container&gt;
</pre>

<p>
다음 자바 프로그램을 실행한다.
</p>

<h6 class="src">MakeUUID.java</h6>
<pre class="prettyprint">
import java.util.UUID;
public class MakeUUID {
	public static void main(String[] args) {
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
	}
}
</pre>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">C:\Users&gt; javac MakeUUID.java

C:\Users&gt; java MakeUUID
<b>b5fc6c97-5eeb-44c5-af36-87843d9db1fc</b>
</pre>

<h6 class="src">content.opf</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="utf-8" standalone="yes"?&gt;
&lt;package xmlns="http://www.idpf.org/2007/opf" unique-identifier="BookId" version="2.0"&gt;
	&lt;metadata xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:opf="http://www.idpf.org/2007/opf"&gt;
		&lt;dc:identifier id="BookId" opf:scheme="UUID"&gt;urn:uuid:<b>b5fc6c97-5eeb-44c5-af36-87843d9db1fc</b>&lt;/dc:identifier&gt;
		&lt;dc:title&gt;나의 첫 번째 책&lt;/dc:title&gt;
		&lt;dc:creator opf:role="aut"&gt;홍길동&lt;/dc:creator&gt;
		&lt;dc:language&gt;ko&lt;/dc:language&gt;
		&lt;dc:date opf:event="modification"&gt;2019-10-09&lt;/dc:date&gt;
		&lt;dc:publisher&gt;00 출판사&lt;/dc:publisher&gt;
		&lt;meta name="cover" content="cover-img" /&gt;
	&lt;/metadata&gt;
	&lt;manifest&gt;
		&lt;item href="toc.ncx" id="ncx" media-type="application/x-dtbncx+xml" /&gt;
		&lt;item href="css/epub.css" id="epub.css" media-type="text/css"/&gt;
		&lt;item href="images/cover.jpg" id="cover-img" media-type="image/jpeg"/&gt;
		&lt;item href="xhtml/cover.xhtml" id="cover.xhtml" media-type="application/xhtml+xml"/&gt;
		&lt;item href="xhtml/preface.xhtml" id="preface.xhtml" media-type="application/xhtml+xml"/&gt;
  		&lt;item href="xhtml/ch01.xhtml" id="ch01.xhtml" media-type="application/xhtml+xml"/&gt;
  		&lt;item href="xhtml/ch02.xhtml" id="ch02.xhtml" media-type="application/xhtml+xml"/&gt;
	&lt;/manifest&gt;
	&lt;spine toc="ncx"&gt;
		&lt;itemref idref="cover.xhtml" linear="no"/&gt;
		&lt;itemref idref="preface.xhtml"/&gt;
		&lt;itemref idref="ch01.xhtml"/&gt;
		&lt;itemref idref="ch02.xhtml"/&gt;
	&lt;/spine&gt;
&lt;/package&gt;
</pre>

<h6 class="src">toc.ncx</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="UTF-8" standalone="no" ?&gt;
&lt;!DOCTYPE ncx PUBLIC "-//NISO//DTD ncx 2005-1//EN"
 "http://www.daisy.org/z3986/2005/ncx-2005-1.dtd"&gt;
&lt;ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1"&gt;
	&lt;head&gt;
		&lt;meta content="urn:uuid:<b>b5fc6c97-5eeb-44c5-af36-87843d9db1fc</b>" name="dtb:uid" /&gt;
	&lt;/head&gt;
	&lt;docTitle&gt;
		&lt;text&gt;나의 첫 번째 책&lt;/text&gt;
	&lt;/docTitle&gt;
	&lt;navMap&gt;
		&lt;navPoint id="navPoint-1" playOrder="1"&gt;
			&lt;navLabel&gt;
				&lt;text&gt;1장&lt;/text&gt;
			&lt;/navLabel&gt;
			&lt;content src="xhtml/ch01.xhtml"/&gt;
		&lt;/navPoint&gt;
		&lt;navPoint id="navPoint-2" playOrder="2"&gt;
			&lt;navLabel&gt;
				&lt;text&gt;2장&lt;/text&gt;
			&lt;/navLabel&gt;
			&lt;content src="xhtml/ch02.xhtml"/&gt;
		&lt;/navPoint&gt;
	&lt;/navMap&gt;
&lt;/ncx&gt;
</pre>

<h6 class="src">epub.css</h6>
<pre class="prettyprint">
@charset "UTF-8";
html, body {
    font-family: sans-serif;
    font-size: 1em;
    margin: 0;
    padding: 0;
}
h1 {
    font-size: 2em;
}
p {
    line-height: 1.4;
    font-size: 0.9em;
}
</pre>

<h6 class="src">cover.jpg</h6>
<p style="border: 1px solid grey;text-align: center;">
<img src="https://lh3.googleusercontent.com/1fY0tTkYewIgjGhaEbVD62RaafYt3TIpYdhm5nliFFmEuGU7TXLSgeeHKOZIVsCPru9KYFb3fWeAU6dkTKoqx5vv4vUBw313hYt5Wyk9G44M8d0owNfXuuNhoXtlXtj05kAVn2gdvRV10b3zL0BB6ga98LOxjxS5FiY-PAMJF8wv8WNjPecCp7mEkAEsfWLCAx4kYHbBnFYVLm4u5bxZDY2lMxiJSWw7ULPVHwM7NODMPeNmzVAN2tVZibKORQq_5v0EDpz_qB1FHKCrBUgkkuhsRUBwVr1aurX9cB3o-CPoBM2NlQPtjqZ1haeGdrn69Fz7TXM2pdhyHF10fIipHePqu91kcxUpCCHxmlvllqLZEG6fV_g3_x9_Nf4zVCoJ80KLFpXivbF50re253-eQ7hr0yoBN69kGXl6oY9xEdmDrUUFKOWSclPoFpcQsaWdVaocnoPHs1NQNTm885MnbqRPY6SOAiTpfAg1chkhizvpSX96b4fjjTHf7mZbpPmUCImb7vR_ha79bz79Orp4GaV7qRjeRXJiHasaYr7xOu876oL_e4Wjri_eSR_eIWSTxNX6FmxVqgm6Y4By7UdndQEeJWaVBaOvp4wl9BBzylKugIv763_hrqTeQfvg33g6AnQ8esuTqnUMRHPv_2ntbf20aFBPUOno7QZ9wdY6j0FJ4s21JY06Kcw=w225-h346-no" alt="cover.jpg" />
1524 x 2339
</p>

<h6 class="src">cover.xhtml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="utf-8" standalone="no"?&gt;
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"&gt;

&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;title&gt;표지&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;div style="text-align: center; padding: 0pt; margin: 0pt;"&gt;
    &lt;img src="../images/cover.jpg" alt="Cover" /&gt;
  &lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">preface.xhtml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="utf-8" standalone="no"?&gt;
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"&gt;

&lt;html xmlns="http://www.w3.org/1999/xhtml" 
    xml:lang="ko" xmlns:xml="http://www.w3.org/XML/1998/namespace"&gt;
&lt;head&gt;
  &lt;title&gt;판권지&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;p&gt;&lt;strong&gt;나의 첫 번째 책&lt;/strong&gt;&lt;/p&gt;
  &lt;p&gt;지은이 : 홍길동&lt;/p&gt;
  &lt;p&gt;펴낸곳 : 00 출판사&lt;/p&gt;
  &lt;p&gt;주소 : 서울&lt;/p&gt;
  &lt;p&gt;전화 : 000-0000-0000&lt;/p&gt;
  &lt;p&gt;등록 : 0000-000000&lt;/p&gt;
  &lt;p&gt;발행 : 2019/10/9&lt;/p&gt;
  &lt;p&gt;정가 : 5000원&lt;/p&gt;
  &lt;p&gt;ISBN : 000-00-000000-0-0&lt;/p&gt;
  &lt;p&gt;이메일 : 000@000.000&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">ch01.xhtml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="utf-8" standalone="no"?&gt;
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"&gt;

&lt;html xmlns="http://www.w3.org/1999/xhtml" 
    xml:lang="ko" xmlns:xml="http://www.w3.org/XML/1998/namespace"&gt;
&lt;head&gt;
&lt;title&gt;1장&lt;/title&gt;
&lt;link href="../css/epub.css" rel="stylesheet" type="text/css" /&gt;
&lt;/head&gt;

&lt;body&gt;

&lt;h1&gt;1장&lt;/h1&gt;

&lt;p&gt;
가 나 다 라...
&lt;/p&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">ch02.xhtml</h6>
<pre class="prettyprint">
&lt;?xml version="1.0" encoding="utf-8" standalone="no"?&gt;
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"&gt;

&lt;html xmlns="http://www.w3.org/1999/xhtml" 
    xml:lang="ko" xmlns:xml="http://www.w3.org/XML/1998/namespace"&gt;
&lt;head&gt;
&lt;title&gt;2장&lt;/title&gt;
&lt;link href="../css/epub.css" rel="stylesheet" type="text/css" /&gt;
&lt;/head&gt;

&lt;body&gt;

&lt;h1&gt;2장&lt;/h1&gt;

&lt;p&gt;
마 바 사 아...
&lt;/p&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>EPUB 파일 생성</h3>

<p>
Info-Zip의 zip.exe 파일을 윈도에 설치해야 한다.<br />
<a href="http://stahlworks.com/dev/index.php?tool=zipunzip">http://stahlworks.com/dev/index.php?tool=zipunzip</a>에서 zip.exe를 내려받고 C:\Windows에 복사한다.
</p>

<p style="border: 1px solid grey;">
<img src="https://lh3.googleusercontent.com/mKf4kYoZu3Q_E6jcngk5-c8eg1bIBUSxDPlyZK5BZGVk47TKTObiswj2xtPs_197nqOSYlAwnHW_j3RPQiqMviFGa72i0YQLNa0q1GqD798i56PAsQTD3NpjDqrx00OSfa0AbMh1L4SwCOzTTcXQC7-ChWAKQndZsOfrc1HEH1TTc6r_jcAul3gLGl6Mf6lAUsbj-PuP0ZR993xuXd0vo6z1E_G4QgO2kY9axBE02-NJc_9V0Zqu9jc1RRjxQ_OuIV88paXzrvEtexwAwYyQ8GpEFOkTmn_PMtLymx--DTTZbu12XLWNnKL5DiDIPBXJvkS69Hkx-JILSdF03C81gKom-YFSqd-ecIFHp3EWKW9W1F1COk6uo3lVj1O-e4H3yLiKPvzi0D6YQcYcWDcWVKlJdBz4SUQGNCjavIXzMn5u-UFgocPD7kSq20jbWYl7GHLVKrScqOkVzMCA5Lpg4d97BEP_Tl-XL2CebrAo9Lpl10zTxe_KyYtXxl-px0CvBEhAd_EP5McSQuA0ogMPMGFkcfCBTjh57nAFreO6PJKlz8BihcH2JdkqG7C9R5J2QBuHF_N-Kyq-Eo8FZw0buzYCMqqIL03CEMv6XhkIeFQXQJ7U15eZGwX5vgFSpybOY8bPmq2Osr9JznYKbx056hkuF__GKbh2YsaNdmohfZxocxCMHsu5hio=w725-h398-no" alt="info-zip's zip.exe" />
</p>

<p>
루트 디렉터리인 MyFirstBook로 이동하여 다음 명령을 차례로 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">
zip -0Xq MyFirstBook.epub mimetype

zip -Xr9Dq MyFirstBook.epub META-INF OEBPS
</pre>

<h3>EPUB 파일 검사</h3>

<p>
<a href="https://github.com/w3c/epubcheck/releases/tag/v4.1.1">https://github.com/w3c/epubcheck/releases/tag/v4.1.1</a>에서 epubcheck-4.1.1.zip 파일을 내려받는다.
압축을 풀고 디렉터리를 원하는 곳으로 옮긴다.
</p>

<p>
명령 프롬프트에서 다음을 실행해서 오류를 확인한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">java -jar C:/epubcheck-4.1.1/epubcheck.jar C:/Users/kim/MyFirstBook/MyFirstBook.epub
</pre>

<h3>테스트</h3>

<p>
MyFirstBook.epub를 iTunes를 통해 아이패드로 옮기면, 아이패드의 기본 앱인 iBooks에 등록된다.<br />
<img src="https://lh3.googleusercontent.com/3Fvh1eSh9nNXHWwDhTpR7qCABjufsnFPjcNNVOuLzCACyRbOJBPBtFY4vyeeKSYBobpF9RED-ioZW6Lzl7d0ntrCK_4gwOO1XuTh5Svf0iyJFB1cOqB5KlGRKTEDuFcnM5g6jbj7Xmmbx2HV5oHa2fnflCyWbSQ2q1HHzawQxzl68kQM10eT5ceal7GhZS3rVzE-Oez6Q77vVDR1AAA60DMFp01HVnoJO7npSDzmKODBITEpBupJYVxphf7Fov-HP7UwIVhgspB4MFr-_x1txscPDL-x3yPjapE6kiM0swxPn3igq-ycOO_kOqenfaxYotPIMjXnDzqrK3BlOp5Diwdy5nQgmRR7u-_pq1Mu4t3qr5STnqA_LPAJT9lC-Pt_iP3DTeutZdzmjeEe8UXJRfgtuHchwvve6eD8xcX6mThTW23DXLQCDDvrvtGbv9DUcvgRLIf5lRdOOMKbMlCHxKcRuvDfUa6kB3ben09AzRtzo0DnulAQIdLSaGzeQywRAdvYAUmLAVaRtJP_XiB9ATokWNRub3Ivw5Lh5KAg973Qe1LBvSVXFtqYwfEMJuB1wfeoOFB8DYzYbNIdHpck1uQHY6RB3lo76cxE4b1cU-oYU5QS3DGfsARv7jUeYsnMX0M4T8WpJV-dAHA0zC77ZiqL5glrr1xwLbLJW24lE7iMlYSiu9eQ_dY=w573-h346-no" alt="iTunes - Books" /><br />
<img src="https://lh3.googleusercontent.com/KH1wZyfDWW3woRq9LXuT8d18Gfvz6yu88ZKF8X_bd7PH10eRFNkQcbqS9qZcbHYMwmsO5cA9WMYUWOuJuZMRhOvGrORCc0Gmk7zOezK52DKdIFHe51vLMJzGYL3mXdxIa3grINydjPVnH4b3A7AjErVMgyQebFklt6EGpfN-SNzcbeJ-evEwDxy3oB8kKAQT4nX_D756pKBZXg1y87AxazZ4jUhSkgH96Iask-jmWZG8ORr4U6XkK7C_37mBiJjmTBtSPq0e_teJYxJOTLR9iQFvUPap3hEo8lAep3bYmXZk2C1qxhMt3qjcR24-34-__bJ2hv0iuqdwV4xJ7HAbzrAuI8gqO0SvqDCcelQxpZlp7h2jt_gDPLcDKBd_tKBH6E95cn3MKDRfwbez7NEc3n1nrVkxRIjsm4C9UFiN7PZQ8yDDu4SJ3pt38UynQUE9l4Oek6MLAGVJcMs-yPjsn2wjK5fvrM8zuIIACRxzXDVUUXFpJ683J8Ted2YNE3PZvhK1mQwJlOo8Kz4-1fxHjVn-J65QveI3ZakRdvrJ9n7nxrt97qJnNDvpbDtq0w8pzd8JsZhlgaCtXcutxkyT3cHiv-r-59nCG0ro5Ztvq-aM24yXg5ZvfJG9rIJ_B6Bpi9i2VvDUwaibOHmjbQt-JWxNxs63tuiAImTc54tEeaZLicwUXDoi_rI=w1024-h768-no" alt="iBooks" />
</p>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="${ctx}/blog/2019/how-to-make-epub">1 EPUB ebook 만들기</a></li>
	<li><a href="${ctx}/blog/2019/how-to-make-epub-with-eclipse">2 이클립스를 사용해 EPUB ebook 만들기</a></li>
</ul>

</article>
