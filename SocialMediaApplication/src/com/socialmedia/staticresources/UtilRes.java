package com.socialmedia.staticresources;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class UtilRes {
	
	public static String getStringMonth(int month){
		String monthis = "";
		
		switch(month){
		case 1:
			monthis = "January";
		break;
		case 2:
			monthis = "February";
		break;
		case 3:
			monthis = "March";
		break;
		case 4:
			monthis = "April";
		break;
		case 5:
			monthis = "May";
		break;
		case 6:
			monthis = "June";
		break;
		case 7:
			monthis = "July";
		break;
		case 8:
			monthis = "August";
		break;
		case 9:
			monthis = "September";
		break;
		case 10:
			monthis = "October";
		break;
		case 11:
			monthis = "November";
		break;
		case 12:
			monthis = "December";
		break;
		}
		
		return monthis;
	}
	
	
	public static int getIntMonth(String month){
		int monthis = 0;
		
		switch(month){
		case "January":
			monthis = 1;
		break;
		case "February":
			monthis = 2;
		break;
		case "March":
			monthis = 3;
		break;
		case "April":
			monthis = 4;
		break;
		case "May":
			monthis = 5;
		break;
		case "June":
			monthis = 6;
		break;
		case "July":
			monthis = 7;
		break;
		case "August":
			monthis = 8;
		break;
		case "September":
			monthis = 9;
		break;
		case "October":
			monthis = 10;
		break;
		case "November":
			monthis = 11;
		break;
		case "December":
			monthis = 12;
		break;
		}
		
		return monthis;
	}
	
	public static List<String> getProvinces(String country){
		List<String> prolist = new ArrayList<String>();
		
		if(country.equals("Pakistan")){
			prolist.add("Sindh");
			prolist.add("Punjab");
			prolist.add("Balochistan");
			prolist.add("Khebar Pakhtunkhawa");
			prolist.add("Azad Kashmir");
			prolist.add("Gilgit Baltistan");
		}else if(country.equals("India")){
			prolist.add("Andhra Pradesh");
			prolist.add("Arunachal Pradesh");
			prolist.add("Goa");
			prolist.add("Chhattisgarh");
			prolist.add("Haryana");
			prolist.add("Gujrat");
			prolist.add("Kerala");
			prolist.add("Maharashtra");
			prolist.add("Rajasthan");
			prolist.add("West Bengal");
			prolist.add("Tamil Nadu");
			prolist.add("Telangana");
		}else if(country.equals("Iran")){
			
		}
		
		
		Collections.sort(prolist);
		return prolist;
	}
	
	public static List<String> getCities(String province){
		List<String> citylist = new ArrayList<String>();
		if(province.equals("Sindh")){
			citylist.add("Hyderabad");
			citylist.add("Karachi");
			citylist.add("Badin");
			citylist.add("Tando Bago");
			citylist.add("MirpurKhas");
			citylist.add("Tando Allahyar");
			citylist.add("Larkana");
			citylist.add("Sukkur");
			citylist.add("Shedadhkot");
			citylist.add("Matli");
			citylist.add("Mithi");
			citylist.add("Umarkot");
			citylist.add("Jamshoro");
			citylist.add("Tando Jam");
			citylist.add("Dadu");
			citylist.add("Kashmore");
			citylist.add("Khairpur");
			citylist.add("Malir");
			citylist.add("Korangi");
			citylist.add("Tando Muhammad Khan");
		}else if(province.equals("Punjab")){
			citylist.add("Attock");
			citylist.add("Lahore");
			citylist.add("Sargodha");
			citylist.add("Gujranwala");
			citylist.add("Hafizabad");
			citylist.add("Gujrat");
			citylist.add("Faisalabad");
			citylist.add("Bhawalnagar");
			citylist.add("Mandi Bahauddin");
			citylist.add("Nankana Sahib");
			citylist.add("Pakpattan");
			citylist.add("Toba Tek Singh");
			citylist.add("Sheikhupura");
			citylist.add("Sialkot");
		}else if(province.equals("Azad Kashmir")){
			citylist.add("Haveli");
			citylist.add("Kotli");
			citylist.add("Bhimber");
			citylist.add("Poonch");
			citylist.add("Sudhnati");
			citylist.add("Bagh");
			citylist.add("Mirpur");
			citylist.add("Neelum");
			citylist.add("Muzzaffarabad");
			citylist.add("Jhelum Valley");
		}else if(province.equals("Balochistan")){
			citylist.add("Lasbela");
			citylist.add("Khuzdar");
			citylist.add("Mastung");
			citylist.add("Musakhel");
			citylist.add("Quetta");
			citylist.add("Panjgur");
			citylist.add("Nasirabad");
			citylist.add("Kalat");
			citylist.add("Jhal Magsi");
			citylist.add("Gwadar");
			citylist.add("Loralai");
			citylist.add("Dera Bugti");
			citylist.add("Awaran");
			citylist.add("Barkhan");
		}else if(province.equals("Khebar Pakhtunkhawa")){
			citylist.add("Kohat");
			citylist.add("Khybar");
			citylist.add("Malakand");
			citylist.add("North Waziristan");
			citylist.add("Mardan");
			citylist.add("Manshera");
			citylist.add("Abbottabad");
			citylist.add("Charsadda");
			citylist.add("Bajaur");
			citylist.add("Chitral");
		}else if(province.equals("Gilgit Baltistan")){
			citylist.add("Hunza");
			citylist.add("Shigar");
			citylist.add("Nagar");
			citylist.add("Kharmang");
			citylist.add("Gilgit");
			citylist.add("Skardu");
			citylist.add("Astore");
			citylist.add("Diamer");
			citylist.add("Ghizer");
			citylist.add("Ghanche");
		}
		Collections.sort(citylist);
		return citylist;
	}

}
