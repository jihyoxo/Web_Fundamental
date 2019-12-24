package kr.co.acorn.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Utility {
	public static String getKoreanDate(String date) {//Aug 05, 2019, 2019-08-05
		String koreanDate = null;
		SimpleDateFormat from = new SimpleDateFormat(
				"MMM dd, yyyy",Locale.US);
		SimpleDateFormat to = new SimpleDateFormat(
				"yyyy/MM/dd",Locale.KOREAN);
		
		try {
			Date d = from.parse(date);//date => Aug 05, 2019
			koreanDate = to.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return koreanDate;//2019-08-05, 2019/08/05
	}
}
