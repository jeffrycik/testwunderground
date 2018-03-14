package com.daoimpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import javax.sql.DataSource;

import org.json.JSONException;
import org.json.JSONObject;

import com.model.Weather;

public class WeatherDAOImpl {

	private DataSource dataSource;
	
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    return sb.toString();
	  }

public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
    InputStream is = new URL(url).openStream();
    try {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    } finally {
      is.close();
    }
  }
	
	
	public Weather getWeather (String city, String country)
	{
		
		 JSONObject json;
		  Weather wt = null;
			try {
				json = readJsonFromUrl("http://api.wunderground.com/api/3998f4e929695c03/conditions/q/"+country+"/"+city+".json");
				System.out.println(json.toString());
		       // System.out.println(json.get("weather"));
		      
				//String weather = json.getJSONObject("current_observation").getString("weather");
		        wt = new Weather(json);
				
					} catch (IOException e) {
					
						e.printStackTrace();
					} catch (JSONException e) {
						e.printStackTrace();
					} 
		
		return wt;
	}


	
}
