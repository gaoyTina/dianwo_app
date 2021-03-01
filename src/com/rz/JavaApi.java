package com.rz;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class JavaApi
 */
@WebServlet("/JavaApi")
public class JavaApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavaApi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("utf-8");
		String rnum=request.getParameter("rnum"); 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");		
		response.setHeader("Access-Control-Allow-Origin","*");
		response.setHeader("Access-Control-Allow-Methods","PUT, GET, POST, DELETE, OPTIONS");
		response.setHeader("Access-Control-Allow-Headers","X-Requested-With");
		response.setHeader("Access-Control-Allow-Headers","Content-Type");
		System.out.print(rnum);
		if(rnum!=null)
		{
			switch(rnum)
			{
				case "1":regUser(request,response);break; 
				case "2":gethtfabuList(request,response);break;
				case "3":getNewsById(request,response);break;
				case "4":getProductList(request,response);break;
				case "5":getProductById(request,response);break;
				case "6":testCaiYun(request,response);break;
				case "7":testfabu(request,response);break;
				case "8":testshowpyq(request,response);break;
				case "9":testzhuce(request,response);break;
				case "0":testlogin(request,response);break;
				case "10":getzhuce(request,response);break;
				case "11":pinleifankui(request,response);break;
			}
		}
		else {
			response.getWriter().write("{\"result\":\"nodata\"}");
		}
		
		
	}
	

	

	protected void imgsadd(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime=df.format(new Date());		
		String title=request.getParameter("title"); 
		String imgtxt=request.getParameter("imgtxt"); 
		String details=request.getParameter("details"); 
	    String strSql="insert into tbimgs (title,ctime,imgtxt,details) values (?,?,?,?)";
	    List<Object> params = new ArrayList<Object>();
		params.add(title);
		params.add(createtime);
		params.add(imgtxt);
	    params.add(details);	    
	    DBHelper Dal=new DBHelper();
	    Dal.excuteSql(strSql, params);
	    response.getWriter().write("{\"result\":\"ok\"}");
	}
	protected void testlogin(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String sanuser=request.getParameter("sanuser"); 
		String sanpassword=request.getParameter("sanpassword"); 
		DBHelper Dal=new DBHelper();
		String strSql=" select * from tbhzhuce where sanuser='"+sanuser+"' and sanpassword='"+sanpassword+"'"; 
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> memlist = null;
		try {
			memlist=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String jsonstr =JSON.toJSONString(memlist.get(0)); 
		response.getWriter().write(jsonstr);
		
	}
	protected void testzhuce(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
		String sanuser=request.getParameter("sanuser"); 
		String sanpassword=request.getParameter("sanpassword"); 
		String sansure=request.getParameter("sansure"); 
		String sanname=request.getParameter("sanname"); 
		String sansex=request.getParameter("sansex"); 
		String sanbs=request.getParameter("sanbs");

	    String strSql="insert into tbhzhuce (sanuser,sanpassword,sansure,sanname,sansex,sanbs) values (?,?,?,?,?,?)";
	    List<Object> params = new ArrayList<Object>();
		params.add(sanuser);
		params.add(sanpassword);
		params.add(sansure);
		params.add(sanname);
		params.add(sansex);
		params.add(sanbs);
	    DBHelper Dal=new DBHelper();
	    Dal.excuteSql(strSql, params);
	    response.getWriter().write("{\"result\":\"ok\"}");
	}
	//发布朋友圈
	protected void testfabu(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String createtime=df.format(new Date());//获取当前系统时间
		
		String content=request.getParameter("content"); 
		String imgtxt=request.getParameter("imgtxt");
		
		SimpleDateFormat dfforfilename = new SimpleDateFormat("yyyyMMddHHmmsssss");//设置日期格式
		String filename=dfforfilename.format(new Date())+".png";
		String realPath = request.getSession().getServletContext().getRealPath("/");  
		String filepath=realPath+"upload/"+filename;
		Base64ToImage1(imgtxt,filepath);

	    DBHelper Dal=new DBHelper();
	    String strSql="insert into tbfabu (content,imgurl,createtime) values (?,?,?)";
	    List<Object> params = new ArrayList<Object>();
		params.add(content);
		params.add(filename);
	    params.add(createtime);
	    Dal.excuteSql(strSql, params);
	    response.getWriter().write("{\"result\":\"ok\"}");
	}
	
	/**
	 * base64字符串转换成图片
	 * @param imgStr		base64字符串
	 * @param imgFilePath	图片存放路径
	 * @return
	 *
	 * @author ZHANGJL
	 * @dateTime 2018-02-23 14:42:17
	 */
	public static boolean Base64ToImage1(String imgStr,String imgFilePath) 
	{ // 对字节数组字符串进行Base64解码并生成图片
		if (imgStr.equals("")) // 图像数据为空
		{
			return false;
		}
		imgStr=imgStr.replaceAll("data:image/png;base64,", "");
		imgStr=imgStr.replaceAll("data:image/jpg;base64,", "");
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
			public static boolean Base64ToImage(String imgStr,String imgFilePath) 
			{ // 对字节数组字符串进行Base64解码并生成图片
				if (imgStr.equals("")) // 图像数据为空
				{
					return false;
				}
				imgStr=imgStr.replaceAll("data:image/png;base64,", "");
				imgStr=imgStr.replaceAll("data:image/jpg;base64,", "");
				BASE64Decoder decoder = new BASE64Decoder();
				try {
					// Base64解码
					byte[] b = decoder.decodeBuffer(imgStr);
					for (int i = 0; i < b.length; ++i) {
						if (b[i] < 0) {// 调整异常数据
							b[i] += 256;
						}
					}
					OutputStream out = new FileOutputStream(imgFilePath);
					out.write(b);
					out.flush();
					out.close();
					return true;
				} catch (Exception e) {
					return false;
				}
			}
	//发布朋友圈
			protected void testshowpyq(HttpServletRequest request, HttpServletResponse response) throws IOException
			{
				String typeid=request.getParameter("typeid");
				int currentpage=1;
				int pagesize=10;
				try
				{
					String p=request.getParameter("p"); 
					currentpage = Integer.valueOf(p);
				}
				catch(Exception e){
					currentpage=1;
				}
				
				DBHelper Dal=new DBHelper();
				
				//查询全部
				String strSql=" select id from tbfabu order by id desc "; 
				if(!(typeid==null||typeid==""))
				{
					strSql=" select id from tbfabu where typeid='"+typeid+"' order by id desc "; 
				}
				List<Map<String, Object>> listall = null;
				List<Object> params = new ArrayList<Object>();
				try {
					listall=Dal.executeQuery(strSql, params);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//分页查询
				int startindex=pagesize*(currentpage-1);
				String strSqlpager=" select * from tbfabu order by id desc limit "+startindex+","+pagesize+""; 
				if(!(typeid==null||typeid==""))
				{
					strSqlpager=" select * from tbfabu where typeid='"+typeid+"' order by id desc limit "+startindex+","+pagesize+""; 
				}
				
				List<Map<String, Object>> listpage = null;
				try {
					listpage=Dal.executeQuery(strSqlpager, params);			
					String jsonstr =JSON.toJSONString(listpage); 
					response.getWriter().write(jsonstr);
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}
			//获取用户信息
			protected void getzhuce(HttpServletRequest request, HttpServletResponse response) throws IOException
			{
				String id=request.getParameter("id");
				DBHelper Dal=new DBHelper();
				String strSql=" select * from tbhzhuce where id=? "; 
				List<Object> params = new ArrayList<Object>();
				params.add(id);
				List<Map<String, Object>> memlist = null;
				try {
					memlist=Dal.executeQuery(strSql, params);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String jsonstr =JSON.toJSONString(memlist); 
				response.getWriter().write(jsonstr);
				
			}


			
			
	
	
	protected void getimgs(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		int currentpage=1;
		int pagesize=10;
		try
		{
			String p=request.getParameter("p"); 
			currentpage = Integer.valueOf(p);
		}
		catch(Exception e){
			currentpage=1;
		}
		DBHelper Dal=new DBHelper();
		
		String strSql=" select id from tbimgs order by id desc "; 
		List<Map<String, Object>> listall = null;
		List<Object> params = new ArrayList<Object>();
		try {
			listall=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int startindex=pagesize*(currentpage-1);
		String strSqlpager=" select * from tbimgs order by id desc limit "+startindex+","+pagesize+""; 
		List<Map<String, Object>> listpage = null;
		try {
			listpage=Dal.executeQuery(strSqlpager, params);	
			PagerJsonForApp p=new PagerJsonForApp();
			p.itemlist=listpage;
			p.RecordCount=listall.size();
			p.PageCount=((listall.size()%pagesize==0)?(listall.size()/pagesize):(listall.size()/pagesize+1));
			p.CurrentPage=currentpage;
			String jsonstr =JSON.toJSONString(p); 
			response.getWriter().write(jsonstr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	
	
	protected void testCaiYun(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
	}
	protected void pinleifankui(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String createtime=df.format(new Date());//获取当前系统时间
		
		String fkquestion=request.getParameter("fkquestion"); 
		

	    String strSql="insert into fankui (fkquestion, fktime) values (?,?)";
	    List<Object> params = new ArrayList<Object>();
		params.add(fkquestion);
	    params.add(createtime);
	    DBHelper Dal=new DBHelper();
	    Dal.excuteSql(strSql, params);
	    response.getWriter().write("{\"result\":\"ok\"}");
	}

	protected void regUser(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String createtime=df.format(new Date());//获取当前系统时间
		
		String sanname=request.getParameter("sanname"); 
		String sannum=request.getParameter("sannum"); 
		String sansex=request.getParameter("sansex"); 
		String sanplatform=request.getParameter("sanplatform"); 
		String sanaddress=request.getParameter("sanaddress"); 
		String sanfile=request.getParameter("sanfile");
		String sanprojest=request.getParameter("sanprojest");
		String santext=request.getParameter("santext");

	    String strSql="insert into tbdingdan (sanname,sannum,sansex,sanplatform,sanaddress,sanfile,sanprojest,santext,santime) values (?,?,?,?,?,?,?,?,?)";
	    List<Object> params = new ArrayList<Object>();
		params.add(sanname);
		params.add(sannum);
		params.add(sansex);
		params.add(sanplatform);
		params.add(sanaddress);
		params.add(sanfile);
		params.add(sanprojest);
	    params.add(santext);
	    params.add(createtime);
	    DBHelper Dal=new DBHelper();
	    Dal.excuteSql(strSql, params);
	    response.getWriter().write("{\"result\":\"ok\"}");
	}
	
	protected void gethtfabuList(HttpServletRequest request, HttpServletResponse response) throws IOException
	{ 
		String typeid=request.getParameter("typeid"); 
		DBHelper Dal=new DBHelper();
		String strSqlpager=" select * from tbhtfabu where typeid=? order by id asc ";
		List<Object> params = new ArrayList<Object>();
		params.add(typeid);
		List<Map<String, Object>> listpage = null;
		try {
			listpage=Dal.executeQuery(strSqlpager, params);			
			String jsonstr =JSON.toJSONString(listpage); 
			response.getWriter().write(jsonstr);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	

		protected void getNewsById(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			String id=request.getParameter("id"); 
			DBHelper Dal=new DBHelper();
			String strSql=" select * from tbnews where id=? "; 
			List<Object> params = new ArrayList<Object>();
			params.add(id);
			Map<String, Object> objbyid = null;
			objbyid=Dal.getSingleObject(strSql, params);
			String jsonstr =JSON.toJSONString(objbyid); 
			response.getWriter().write(jsonstr);	
		}
		
		
	
		protected void getProductList(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			String typeid=request.getParameter("typeid");
			int currentpage=1;
			int pagesize=10;
			try
			{
				String p=request.getParameter("p"); 
				currentpage = Integer.valueOf(p);
			}
			catch(Exception e){
				currentpage=1;
			}
			
			DBHelper Dal=new DBHelper();
			
		
			String strSql=" select id from tbproduct order by id desc "; 
			if(!(typeid==null||typeid==""))
			{
				strSql=" select id from tbproduct where typeid='"+typeid+"' order by id desc "; 
			}
			List<Map<String, Object>> listall = null;
			List<Object> params = new ArrayList<Object>();
			try {
				listall=Dal.executeQuery(strSql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			int startindex=pagesize*(currentpage-1);
			String strSqlpager=" select * from tbproduct order by id desc limit "+startindex+","+pagesize+""; 
			if(!(typeid==null||typeid==""))
			{
				strSqlpager=" select * from tbproduct where typeid='"+typeid+"' order by id desc limit "+startindex+","+pagesize+""; 
			}
			
			List<Map<String, Object>> listpage = null;
			try {
				listpage=Dal.executeQuery(strSqlpager, params);			
				String jsonstr =JSON.toJSONString(listpage); 
				response.getWriter().write(jsonstr);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		
		protected void getProductById(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			String id=request.getParameter("id"); 
			DBHelper Dal=new DBHelper();
			String strSql=" select * from tbproduct where id=? "; 
			List<Object> params = new ArrayList<Object>();
			params.add(id);
			Map<String, Object> objbyid = null;
			objbyid=Dal.getSingleObject(strSql, params);
			String jsonstr =JSON.toJSONString(objbyid); 
			response.getWriter().write(jsonstr);	
		}

}
