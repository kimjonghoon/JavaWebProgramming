<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2018.3.26</div>
	
<h1>구글 클라우드 Blobstore 예제</h1>

<p>
예제 : <a href="https://github.com/kimjonghoon/gaefile">https://github.com/kimjonghoon/gaefile</a><br />
(<a href="${ctx}/blog/2017/ajax-fileupload">에이젝스 파일 업로드</a> 예제를 Blobstore를 이용하는 것으로 수정)
</p>


<h3>실행 방법</h3>

<p>
Google Cloud SDK 설치가 필요하다.<br />
<a href="https://cloud.google.com/sdk/downloads">https://cloud.google.com/sdk/downloads</a>를 방문한다.<br />
'대화형 설치 프로그램'의 지시를 따라 설치한다.<br />
(대화형 설치 프로그램으로 설치해야 최신 버전이 설치된다)<br />
설치 후 명령 프롬프트를 새로 열고 gcloud components install app-engine-java를 실행해 자바 컴포넌트를 설치한다.<br />
</p>
<p>
내려받은 예제를 풀고 루트 디렉터리로 이동하여 mvn appengine:run 실행한다.<br />
(이때 자바는 자바 8이어야 한다)
</p>
<p>
명령 프롬프트에 Dev App Server is now running 메시지가 보이면, 웹 브라우저로 http://localhost:8080을 방문한다.
</p>

<h3>코드 설명</h3>

<ul>
	<li>게시글은 관계형 데이터베이스의 테이블에, 첨부파일 정보는 데이터스토어에, 첨부파일은 Blobstore에 저장된다고 가정했다.</li>
	<li>index.jsp에서 1099는 게시글 번호를 의미한다.</li>
	<li>FileGroup 엔티티는 AttachFile의 부모 엔티티다. 게시글이 엔티티로 저장된다면 이 엔티티는 필요 없다.</li>
	<li>FileGroup 엔티티는 1099로 키가 만들어지므로 Id 속성 타입을 String으로 했다. Id 속성 타입이 Long이면 키는 자동 생성된다.</li>
	<li>다음 코드는 엔티티를 저장한다.<br />
	(import static com.googlecode.objectify.ObjectifyService.ofy;문이 필요하다)
<pre class="prettyprint">
ofy().save().entity(attachFile).now();
</pre>
	</li>
	<li>다음은 목록을 구하는 코드다.<br />
	order("creation")은 오름차순으로 정렬한다.
<pre class="prettyprint">
Key&lt;FileGroup&gt; theGroup = Key.create(FileGroup.class, group);
List&lt;AttachFile&gt; attachFiles = ofy()
	.load()
	.type(AttachFile.class)
	.ancestor(theGroup)
	.order("creation")
	.list();
</pre>
	</li>
	<li>다음은 AttachFile 엔티티와 파일을 삭제하는 핸들러 메소드 코드다.
<pre class="prettyprint">
@DeleteMapping("/{group}/{id}")
public ResponseEntity&lt;String&gt; del(@PathVariable String group, @PathVariable Long id) {
    Key&lt;FileGroup&gt; theGroup = Key.create(FileGroup.class, group);
    Key&lt;AttachFile&gt; key = Key.create(theGroup, AttachFile.class, id);

    AttachFile attachFile = ofy()
            .load()
            .key(key)
            .now();

    String blobKeyString = attachFile.getBlobKeyString();
    BlobKey blobKey = new BlobKey(blobKeyString);
    blobstoreService.delete(blobKey);

    ofy().delete().key(key).now();

    return new ResponseEntity&lt;&gt;("OK", HttpStatus.NO_CONTENT);
}
</pre>
	파일과 관련된 일은 모두 FileController가 담당하도록 구현했다.<br />
	그래서 FileController를 @RestController로 구현할 수 없었다.<br />
	반환 타입을 ResponseEntity&lt;String&gt; 둔 이유는 @Controller로 만든 컨트롤러는 어떻게든 뷰를 해석하려 들기 때문이다.<br />
	위와 같이 구현하면 뷰를 무시하고 반환 타입을 지정할 수 있다.	
	</li>
	<li>다음은 파일을 내려받게 하는 코드다.
<pre class="prettyprint">
@GetMapping("/{group}/{id}")
public void download(@PathVariable String group, @PathVariable Long id, HttpServletRequest req, HttpServletResponse resp) throws IOException {
    Key&lt;FileGroup&gt; theGroup = Key.create(FileGroup.class, group);
    Key&lt;AttachFile&gt; key = Key.create(theGroup, AttachFile.class, id);

    AttachFile attachFile = ofy()
            .load()
            .key(key)
            .now();

    String blobKeyString = attachFile.getBlobKeyString();
    BlobKey blobKey = new BlobKey(blobKeyString);
    BlobInfo blobInfo = new BlobInfoFactory().loadBlobInfo(blobKey);
    String filename = URLEncoder.encode(blobInfo.getFilename(), "UTF-8");
    resp.setContentType("application/octet-stream");
    resp.addHeader("Content-Disposition", "attachment; filename*=UTF-8''" + filename);
    blobstoreService.serve(blobKey, resp);
 }
</pre>	
	</li>
</ul>

</article>
