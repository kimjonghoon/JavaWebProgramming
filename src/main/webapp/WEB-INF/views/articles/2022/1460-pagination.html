<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Pagination</title>
<meta name="Keywords" content="java,web programming,pagination" />
<meta name="Description" content="이 글은 웹 프로그래밍에서 목차 페이지에 사용하는 쪽수 매기는 기능을 설명합니다." />
<link rel="stylesheet" href="../../../static/css/korean.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../../static/css/prettify.css" type="text/css" />
<script src="../../../static/js/jquery.js"></script>
<script src="../../../static/js/commons.js"></script>
<script src="../../../static/js/prettify.js"></script>
<script src="../../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>
<div class="last-modified">Last Modified 2022.10.11</div>

<h1>페이징 처리</h1>

<h6 class="src">NumbersForPagination.java</h6>
<pre class="prettyprint">
package net.java_school.commons;

public class NumbersForPagination {
  private int prevBlock;
  private int firstPage;
  private int lastPage;
  private int nextBlock;
  private int totalPage;
  private int listItemNo;
  private int startRecord;
  private int endRecord;

  public int getPrevBlock() {
    return prevBlock;
  }
  public void setPrevBlock(int prevBlock) {
    this.prevBlock = prevBlock;
  }
  public int getFirstPage() {
    return firstPage;
  }
  public void setFirstPage(int firstPage) {
    this.firstPage = firstPage;
  }
  public int getLastPage() {
    return lastPage;
  }
  public void setLastPage(int lastPage) {
    this.lastPage = lastPage;
  }
  public int getNextBlock() {
    return nextBlock;
  }
  public void setNextBlock(int nextBlock) {
    this.nextBlock = nextBlock;
  }
  public int getTotalPage() {
    return totalPage;
  }
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public int getListItemNo() {
    return listItemNo;
  }
  public void setListItemNo(int listItemNo) {
    this.listItemNo = listItemNo;
  }
  public int getStartRecord() {
    return startRecord;
  }
  public void setStartRecord(int startRecord) {
    this.startRecord = startRecord;
  }
  public int getEndRecord() {
    return endRecord;
  }
  public void setEndRecord(int endRecord) {
    this.endRecord = endRecord;
  }
}
</pre>

<h6 class="src">Paginator.java</h6>
<pre class="prettyprint">
/*
 * ----------------Design--------------------------------------------
 * [First] [Prev] 11 12 13 14 15 16 17 18 19 20 [Next] [Last]
 *
 * ----------------Numbers for pagination--------------------------------------
 * [First] -- 1
 * [Prev]  -- prevBlock
 * 11      -- firstPage (within current block)
 * 20      -- lastPage (within current block)
 * [Next]  -- nextBlock
 * [Last]  -- totalPage (totalPage is equal to the final page number)
 *
 * -----------------Number for design-------------------------------------
 * listItemNo  -- The number to append to the first item in the list (Not persistent data)
 *
 * ------------------Numbers for fetch query-------------------
 * startRecord -- First record number on the current page
 * endRecord   -- Last record number on the current page
 */
package net.java_school.commons;

import java.util.List;

public interface Paginator {

  public int getTotalRecordCount(String searchWord);

  public List&lt;?&gt; getItems(String searchWord, int startRecord, int endRecord);

  public default NumbersForPagination getNumbersForPagination(int totalRecordCount, int page, int recordsPerPage, int pagesPerBlock) {

    NumbersForPagination numbers = new NumbersForPagination();

    int totalPage = totalRecordCount / recordsPerPage;
    if (totalRecordCount % recordsPerPage != 0) totalPage++;

    int totalBlock = totalPage / pagesPerBlock;
    if (totalPage % pagesPerBlock != 0) totalBlock++;

    int block = page / pagesPerBlock;
    if (page % pagesPerBlock != 0) block++;

    int firstPage = (block - 1) * pagesPerBlock + 1;
    int lastPage = block * pagesPerBlock;

    int prevBlock = 0;
    if (block &gt; 1) prevBlock = firstPage - 1;

    int nextBlock = 0;
    if (block &lt; totalBlock) nextBlock = lastPage + 1;
    if (block &gt;= totalBlock) lastPage = totalPage;

    int listItemNo = totalRecordCount - (page - 1) * recordsPerPage;
    int startRecord = (page - 1) * recordsPerPage + 1;
    int endRecord = page * recordsPerPage;

    numbers.setPrevBlock(prevBlock);
    numbers.setFirstPage(firstPage);
    numbers.setLastPage(lastPage);
    numbers.setNextBlock(nextBlock);
    numbers.setTotalPage(totalPage);

    numbers.setListItemNo(listItemNo);

    numbers.setStartRecord(startRecord);
    numbers.setEndRecord(endRecord);

    return numbers;
  }
}
</pre>

<h3>사용 방법</h3>

<pre class="prettyprint">
@Controller
public class HomeController <strong>implements Paginator</strong> {

  @Autowired
  private SomeService service;

  @Override
  public int getTotalRecordCount(String searchWord) {
    return service.getTotalRecordCount(searchWord);
  }

  @Override
  public List&lt;Item&gt; getItems(String searchWord, int startRecord, int endRecord) {
    return service.getItems(searchWord, startRecord, endRecord);
  }

  @GetMapping("/")
  public String index(Integer page, String searchWord, Model model) {
    if (page == null) return "redirect:/?page=1";

    //1. Get total record count (A total of the number of records)
    <strong>int totalRecordCount = getTotalRecordCount(searchWord);</strong>

    //2. Get numbers for pagination
    <strong>int recordsPerPage = 4;</strong>
    <strong>int pagesPerBlock = 10;</strong>
    <strong>NumbersForPagination numbers = 
      getNumbersForPagination(totalRecordCount, page, recordsPerPage, pagesPerBlock);</strong>

    //3. Get items to list on the page
    <strong>List&lt;Item&gt; items = 
      getItems(searchWord, numbers.getStartRecord(), numbers.getEndRecord());</strong>

    model.addAttribute("items", items);
    model.addAttribute("prevBlock", numbers.getPrevBlock());
    model.addAttribute("nextBlock", numbers.getNextBlock());
    model.addAttribute("firstPage", numbers.getFirstPage());
    model.addAttribute("lastPage", numbers.getLastPage());
    model.addAttribute("totalPage", numbers.getTotalPage());

    return "index";
  }
}
</pre>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="#" th:href="@{/blog/2022/spring-mybatis-example}">간단한 Spring MyBatis 예제</a></li>
	<li><a href="#" th:href="@{/blog/2019/generics}">제네릭</a></li>
	<li><a href="#" th:href="@{/blog/2019/default-method}">디폴트 메서드</a></li>
	<li><a href="#" th:href="@{/blog/2017/basic-board}">기본 게시판</a></li>
</ul>

</article>
</body>
</html>
