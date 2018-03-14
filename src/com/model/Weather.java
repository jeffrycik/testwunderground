package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.annotations.JsonAdapter;

public class Weather {

	
	private String city;
	private String country;
	private String weather;
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	
	
	public Weather(JSONObject json){
		try 
		{
		
			setWeather(json.getJSONObject("current_observation").getString("weather"));
			
		} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public Weather() {
		}
}
