package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.bean.HzpBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();HzpBean hzb = new HzpBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("delsp")){  //add  
			 String id = request.getParameter("id");
				String sql="delete from sp where id='"+id+"'";
				int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/sp/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/sp/index.jsp").forward(request, response); 
				}
			 
			
		}
		else if(method.equals("delsp2")){ ///update  
			String id = request.getParameter("id"); 
			 String url = request.getParameter("url"); 
			 String sql="delete from sp where id='"+id+"'";
				int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
				}
			 
		}
		else if(method.equals("addprep")){
			String spid=request.getParameter("spid").trim();
			String num=request.getParameter("num").trim();
			String member=(String)session.getAttribute("member");
			String str=new ComBean().getString("select member from sp where id='"+spid+"'");
			//System.out.println(str);
			if(str.equals(member)){
				request.setAttribute("message", "���ܹ����Լ�����Ʒ��");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else{
				int flag = hzb.addPrep(spid, Integer.parseInt(num), member,str);
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
		}
		else if(method.equals("tjdd")){ ///update  
			String prepid = request.getParameter("prepid"); 
			 String sj = request.getParameter("sj"); 
			 String dd = request.getParameter("dd"); 
			 String sql="update prep set flag='�Ѿ��ύ',sj='"+sj+"',dd='"+dd+"' where id='"+prepid+"'";
				int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){  
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/prep/index.jsp").forward(request, response); 
				}
			 
		}
		else if(method.equals("memberdelPrep")){
			String id = request.getParameter("id"); 
			String sql="delete from prep where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/prep/wei.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/wei.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delpabc")){
			String id = request.getParameter("id"); 
			String sql="delete from prep where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/prep/tj.jsp").forward(request, response); 
			}
		}
		else if(method.equals("jzsp")){
			String id = request.getParameter("id"); 
			String sql="update sp set jz='��' where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/sp/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/sp/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("addnews")){
			String title = request.getParameter("title"); 
			String content = request.getParameter("content1");
			String sql="insert into news(title,content,sj) values('"+title+"','"+content+"','"+date2+"')";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		
		else if(method.equals("upnews")){
			String id = request.getParameter("id");
			String title = request.getParameter("title"); 
			String content = request.getParameter("content1");
			String sql="update news set title='"+title+"',content='"+content+"' where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delnews")){
			String id = request.getParameter("id");  
			String sql="delete from news where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delaf")){
			String id = request.getParameter("id");  
			String sql="delete from affiche where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delm")){
			String id = request.getParameter("id");  
			String sql="delete from member where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/person.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delg")){
			String id = request.getParameter("id");  
			String sql="delete from guestbook where id='"+id+"'";
			int flag = cBean.comUp(sql);
			if(flag == Constant.SUCCESS){  
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
			}
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
