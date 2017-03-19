package common; 

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

public class StringProcess {
	
	/**
	 * Ham tra ve gioi tinh: 1=Nam, 0=Nu
	 * @param val
	 * @return String
	 */
	public static String gioiTinh(String val) {
		if("0".equals(val)){
			return "Nu";
		}
		return "Nam";
	}
	
	/**
	 * Ham in ra mot xau, null in ra xau rong
	 * @param s
	 * @return String
	 */
	public static String getVaildString(String s) {
		if(s==null) return "";
		return s;
	}
	
	public static String getVaildStringLam(String s) {
		if(s==null || s=="") return "all";
		return s;
	}
	
	/**
	 * Ham kiem tra xau rong hay khong
	 * @param s
	 * @return boolean
	 */
	public static boolean notVaild(String s){
		return s==null || s.trim().length()<1;
	}
	
	/**
	 * Ham kiem tra xem xau co bao gom chi chu so hay khong
	 * @param s
	 * @return boolean
	 */
	public static boolean notVaildNumber(String s){
		if(notVaild(s)) return true;
		String regex = "[0-9]+"; 
		if(s.matches(regex)) return false;
		return true;
	}
	
	// Class kiểm định dạng email
    public static boolean validateEmail(final String hex) {
    	Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
    	Matcher matcher =pattern.matcher(hex);
        return !matcher.matches();
 
    }
    
    /* From ISO-8859-1 to UTF-8 */
    public static String IsoToUtf8(String input){
    	String output = "";
    	try {    	    
    	    output = new String(input.getBytes("ISO-8859-1"), "UTF-8");
    	} catch (UnsupportedEncodingException e) {
    	    e.printStackTrace();
    	}
    	return output;
    }
    
    /* From UTF-8 to ISO-8859-1 */
    public static String Utf8ToIso(String input){
    	String output = "";
    	try {   
    	    output = new String(input.getBytes("UTF-8"), "ISO-8859-1");
    	} catch (UnsupportedEncodingException e) {
    	    e.printStackTrace();
    	}
    	return output;
    }
    public static boolean checkSpace(String temps){
    	return temps.indexOf(' ')>0;
    }
    
    public static ActionErrors checkCreateAccount(String email,String password,String fullname,String phone,String address,String role,String status,String sex,String code_mail){
    	ActionErrors errors=new ActionErrors();
    	if(validateEmail(email) || checkSpace(email)){
    		errors.add("emailError",new ActionMessage("error.required.email"));
    	}
    	if(notVaild(password) || checkSpace(password)){
    		errors.add("password",new ActionMessage("error.required.passWord"));
    	}
    	if(notVaild(fullname)){
    		errors.add("fullname",new ActionMessage("error.required.fullname"));
    	}
    	if(notVaild(phone) ||checkSpace(phone) || notVaildNumber(phone)){
    		errors.add("phone",new ActionMessage("error.required.phone"));
    	}
    	if(notVaild(address)){
    		errors.add("address",new ActionMessage("error.required.address"));
    	}
    	if(notVaild(role)){
    		errors.add("role",new ActionMessage("error.required.role"));
    	}
    	if(notVaild(status)){
    		errors.add("status",new ActionMessage("error.required.status"));
    	}
    	if(notVaild(sex)){
    		errors.add("sex",new ActionMessage("error.required.sex"));
    	}
    	if(notVaild(code_mail) || checkSpace(code_mail)){
    		errors.add("code_mail",new ActionMessage("error.required.code_mail"));
    	}
    	return errors;
    }
    
    public static ActionErrors checkNewPost(int id_account,String title_post,String content_post,String type_product,String percent_product,String cost,String address_product,String type_post){
    	ActionErrors errors=new ActionErrors();
    	if(notVaild(title_post)){
    		errors.add("title_post",new ActionMessage("error.post.title_post"));
    	}
    	if(notVaild(content_post)){
    		errors.add("content_post",new ActionMessage("error.post.content_post"));
    	}
    	if(notVaild(cost) || notVaildNumber(cost)){
    		errors.add("cost",new ActionMessage("error.post.cost"));
    	}
    	return errors;
    }
    
    
    //Ham lam tron nguyen
    public static int TinhSoTrang(int sumRow,int rowInPage){
    	if(sumRow%rowInPage==0){
    		return sumRow/rowInPage;
    	}else{
    		return sumRow/rowInPage+1;
    	}
    }
    
    private String writeImageToFile(String imagePath, byte[] image,
            String userId) throws IOException {
        String dateFormat = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat(dateFormat);
        Date ngay=new Date();
        String date = simpleDateFormat.format(ngay);
 
        imagePath = imagePath + date + System.getProperty("file.separator");
 
        FileOutputStream fileOutStream = null;
        File directory = new File(imagePath);
 
        if (!directory.exists())
            directory.mkdirs();
 
        StringBuffer imageFile = new StringBuffer().append(imagePath)
                .append(userId).append("_").append(new Date().getTime())
                .append(".jpg");
 
        fileOutStream = new FileOutputStream(imageFile.toString());
 
        fileOutStream.write(image);
 
        fileOutStream.flush();
 
        fileOutStream.close();
 
        return imageFile.toString();
    }

}

