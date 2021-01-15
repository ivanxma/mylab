package mydemo;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONObject;
public class SendHttpRequest {
public static void main(String[] args) {
	try {
	        String userdata;
		userdata = SendHttpRequest.call_me();
		System.out.print(userdata);
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	 public static String call_me() throws Exception {
	    URL url = new URL("https://oespno4hzgltngu2dvjdwvd5ia.apigateway.us-ashburn-1.oci.customer-oci.com/v2/getuser");
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            // optional default is GET
            con.setRequestMethod("GET");
    		
            //add request header
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
            	response.append(inputLine);
            }
            in.close();
            
            //print in String
            System.out.println(response.toString());
            
            //Read JSON response and print
            JSONObject myResponse = new JSONObject(response.toString());
	    return myResponse.getString("userdata");
             
	}
}
