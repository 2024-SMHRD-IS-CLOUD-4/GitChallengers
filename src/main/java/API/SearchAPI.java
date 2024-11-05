package API;


//네이버 검색 API 예제 - 블로그 검색
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


public class SearchAPI {



//	rss	-	RSS 컨테이너. RSS 리더기를 사용해 검색 결과를 확인할 수 있습니다.
//	rss/channel	-	검색 결과를 포함하는 컨테이너. channel 요소의 하위 요소인 title, link, description은 RSS에서 사용하는 정보이며, 검색 결과와는 상관이 없습니다.
//	rss/channel/lastBuildDate	dateTime	검색 결과를 생성한 시간
//	rss/channel/total	Integer	총 검색 결과 개수
//	rss/channel/start	Integer	검색 시작 위치
//	rss/channel/display	Integer	한 번에 표시할 검색 결과 개수
//	rss/channel/item	-	개별 검색 결과. JSON 형식의 결괏값에서는 items 속성의 JSON 배열로 개별 검색 결과를 반환합니다.
//	rss/channel/item/title	String	블로그 포스트의 제목. 제목에서 검색어와 일치하는 부분은 <b> 태그로 감싸져 있습니다.
//	rss/channel/item/link	String	블로그 포스트의 URL
//	rss/channel/item/description	String	블로그 포스트의 내용을 요약한 패시지 정보. 패시지 정보에서 검색어와 일치하는 부분은 <b> 태그로 감싸져 있습니다.
//	rss/channel/item/bloggername	String	블로그 포스트가 있는 블로그의 이름
//	rss/channel/item/bloggerlink	String	블로그 포스트가 있는 블로그의 주소
//	rss/channel/item/postdate	dateTime	블로그 포스트가 작성된 날짜
	
	
	
	
	
	
	
 public static void main(String[] args) {
     String clientId = "04bFOj2XLXKJ9lNDOaxz"; //애플리케이션 클라이언트 아이디
     String clientSecret = "9Jz2IKsaUC"; //애플리케이션 클라이언트 시크릿


     String text = null;
     try {
         text = URLEncoder.encode("그린팩토리", "UTF-8");
     } catch (UnsupportedEncodingException e) {
         throw new RuntimeException("검색어 인코딩 실패",e);
     }


     String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
     //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과


     Map<String, String> requestHeaders = new HashMap<>();
     requestHeaders.put("X-Naver-Client-Id", clientId);
     requestHeaders.put("X-Naver-Client-Secret", clientSecret);
     String responseBody = get(apiURL,requestHeaders);


     System.out.println(responseBody);
 }


 private static String get(String apiUrl, Map<String, String> requestHeaders){
     HttpURLConnection con = connect(apiUrl);
     try {
         con.setRequestMethod("GET");
         for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
             con.setRequestProperty(header.getKey(), header.getValue());
         }


         int responseCode = con.getResponseCode();
         if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
             return readBody(con.getInputStream());
         } else { // 오류 발생
             return readBody(con.getErrorStream());
         }
     } catch (IOException e) {
         throw new RuntimeException("API 요청과 응답 실패", e);
     } finally {
         con.disconnect();
     }
 }


 private static HttpURLConnection connect(String apiUrl){
     try {
         URL url = new URL(apiUrl);
         return (HttpURLConnection)url.openConnection();
     } catch (MalformedURLException e) {
         throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
     } catch (IOException e) {
         throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
     }
 }


 private static String readBody(InputStream body){
     InputStreamReader streamReader = new InputStreamReader(body);


     try (BufferedReader lineReader = new BufferedReader(streamReader)) {
         StringBuilder responseBody = new StringBuilder();


         String line;
         while ((line = lineReader.readLine()) != null) {
             responseBody.append(line);
         }


         return responseBody.toString();
     } catch (IOException e) {
         throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
     }
 }
}
