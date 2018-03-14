package com.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.daoimpl.WeatherDAOImpl;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.model.Weather;



@EnableWebMvc
@Controller
public class CommonController {
	
 private WeatherDAOImpl weatherDAOImpl;
 
 
	
@Autowired
public void setWeatherDAOImpl(WeatherDAOImpl weatherDAOImpl) {
	this.weatherDAOImpl = weatherDAOImpl;
}


	
		@RequestMapping("/home")
	    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	
	    /*    JSONObject json;
			try {
				json = readJsonFromUrl("http://api.wunderground.com/api/3998f4e929695c03/conditions/q/CA/bekasi.json");
				System.out.println(json.toString());
		       // System.out.println(json.get("weather"));
		        String loudScreaming = json.getJSONObject("LabelData").getString("slogan");
		        
		        
		         	
			
		        
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} */
	       
	        
		Weather weather = new Weather();
			
			
			model.addAttribute("WeatherForm", weather);
		
	        return "home" ;
	    }
	
		
		
		
		@RequestMapping(value = "/search", method = RequestMethod.POST)
		public String doSearch(ModelMap model,
				@ModelAttribute("WeatherForm") Weather ch,
				HttpServletRequest request) {
			
			System.out.println(ch.getCity());
			
			String city = ch.getCity();
			String country = ch.getCountry();
			String cityR = city.replace(" ", "_");
			String countryR = country.replace(" ", "_");
			Weather wt = weatherDAOImpl.getWeather(cityR,countryR);
			
			wt.setCity(ch.getCity());
			wt.setCountry(ch.getCountry());
			System.out.println("weather:: " + wt.getWeather());
			if(wt.getWeather()==null)
			{
				wt.setWeather("not found/error");
			}
			model.addAttribute("WeatherForm", wt);
			
			
			return "search";
			
			
		}

		@RequestMapping("/test")
	    public String test(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
	
	    /*    JSONObject json;
			try {
				json = readJsonFromUrl("http://api.wunderground.com/api/3998f4e929695c03/conditions/q/CA/bekasi.json");
				System.out.println(json.toString());
		       // System.out.println(json.get("weather"));
		        String loudScreaming = json.getJSONObject("LabelData").getString("slogan");
		        
		        
		         	
			
		        
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} */
	       
	        
		Weather weather = new Weather();
			
			
			model.addAttribute("WeatherForm", weather);
		
	        return "template" ;
	    }
		
		
		
		
		
}

