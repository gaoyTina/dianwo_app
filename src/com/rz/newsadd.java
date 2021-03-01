package com.rz;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class newsadd
 */
@WebServlet("/newsadd")
public class newsadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsadd() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8"); 
		 String tbpicture=request.getParameter("tbpicture"); 
		 String tbname=request.getParameter("tbname"); 
		 String tbimage=request.getParameter("tbimage"); 
		 String tbyear=request.getParameter("tbyear"); 
		 String tbdtai=request.getParameter("tbdtai"); 
		 String tbtime=request.getParameter("tbtime"); 
		 String typeid=request.getParameter("typeid"); 
		 
		 
		 DBHelper Dal=new DBHelper();
		 String strSql=" insert into tbhtfabu (touxiang,nicheng,sex,yearold,dongtai,fbtime,typeid) values (?,?,?,?,?,?,?) "; 
		 List<Object> params = new ArrayList<Object>();
		 
		 params.add(tbpicture);
		 params.add(tbname);
		 params.add(tbimage);
		 params.add(tbyear);
		 params.add(tbdtai);
		 params.add(tbtime);
		 params.add(typeid);
		 Dal.excuteSql(strSql, params);
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>发布成功!</font>");
        response.setHeader("Refresh", "3;URL="+request.getContextPath()+"/admin/newsadd.jsp");
	}

}
