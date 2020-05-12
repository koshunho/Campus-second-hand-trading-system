package com.action;

/**
 * 新闻管理-上传缩略图
 * 
 */
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.bean.SystemBean;
import com.util.Constant;
import com.util.Filter;
import com.util.SmartFile;
import com.util.SmartUpload;

public class NewsAction extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public NewsAction() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String sysdir = new SystemBean().getDir();
		HttpSession session = request.getSession();
		try{
			String member = (String)session.getAttribute("member");
			 
				 String method = null; 
				 ComBean cb=new ComBean();
				 SmartUpload mySmartUpload = new SmartUpload();//init
				 int count = 0;
				 try{
					 mySmartUpload.initialize(config,request,response);
		             mySmartUpload.upload(); 
		             method = mySmartUpload.getRequest().getParameter("method").trim();
		            
		             if(method.equals("addsp")){//增加
		            	 //String mc = "";	String type="请选择";String pic="";String jg="";String sl="";
		            	String mc = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("mc").trim());
						String type = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("type").trim());
						String jg = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("jg").trim());
						String sl = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("sl").trim()); 
						String js = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("js").trim()); 
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/pic";
		                    count = mySmartUpload.save(path);
		                   int flag = cb.comUp("insert into sp( mc, type,pic,jg,sl,js,member) " +
		                   		"values('"+mc+"', '"+type+"','"+path+"/"+file.getFileName()+"','"+jg+"','"+sl+"','"+js+"','"+member+"')");
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");
								request.getRequestDispatcher("member/sp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher("member/sp/index.jsp").forward(request, response);
							}
						 
		            }
		            //update
		            else if(method.equals("upsp")){
		            	String id = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("id").trim());
		            	String mc = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("mc").trim());
						String type = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("type").trim());
						String jg = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("jg").trim());
						String sl = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("sl").trim()); 
						String js = Filter.escapeHTMLTags(mySmartUpload.getRequest().getParameter("js").trim()); 
							SmartFile file = mySmartUpload.getFiles().getFile(0);
			            	String fileExt=file.getFileExt();	            
			            	String path="/pic";
		                    count = mySmartUpload.save(path);
		                   int flag = cb.comUp("update sp set mc='"+mc+"', type='"+type+"',pic='"+path+"/"+file.getFileName()+"'," +
		                   		"jg='"+jg+"',sl='"+sl+"',js='"+js+"' where id='"+id+"'");
							if(flag == Constant.SUCCESS){
								request.setAttribute("message", "操作成功！");
								request.getRequestDispatcher("member/sp/index.jsp").forward(request, response);
							}
							else{
								request.setAttribute("message", "系统维护中，请稍后再试！");
								request.getRequestDispatcher("member/sp/index.jsp").forward(request, response);
							}
						 
		            }
		             
		            else{
		            	request.getRequestDispatcher("error.jsp").forward(request, response);
		            }
		        }catch(Exception ex){
		        	ex.printStackTrace();
		        	//request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
			 
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
