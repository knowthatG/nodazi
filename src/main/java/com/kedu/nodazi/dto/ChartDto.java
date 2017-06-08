package com.kedu.nodazi.dto;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ChartDto {
	
	private List<ArrayList<Object>>	result;
//	private List<Object>			price;
	
	public ChartDto() {
		this.result = new ArrayList<ArrayList<Object>>();
//		this.price  = new ArrayList<Object>();
	}
	
	public void addPrice(){
		
	}
	
	/*public void addPrice(String date , int price_low, int price_open, int price_close, int price_high){
		ArrayList<Object> price = new ArrayList<Object>();
		
		price.add(dateFormat(date));
		price.add(price_low);
		price.add(price_open);
		price.add(price_close);
		price.add(price_high);
		
		result.add(price);
	}*/
	
	public void addPrice(PricesDto dto){
		ArrayList<Object> price = new ArrayList<Object>();
		
		price.add(dateFormat(dto.getPrice_date()));
		price.add(dto.getPrice_low());
		price.add(dto.getPrice_open());
		price.add(dto.getPrice_close());
		price.add(dto.getPrice_high());
		
		result.add(price);
	}
	
	public int countResult(){
		return result.size();
	}
	
	public String dateFormat(Date date){
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
		
		String day = sdf.format(date);
		
		return day;
		
	}
	
	public String toString(){
		String str = "";
		
		for(ArrayList list : result){
			str += list.toString();
		}
		
		return str;
	}

}
